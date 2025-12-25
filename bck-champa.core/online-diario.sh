#!/bin/bash

# Obtener la fecha actual en formato "-------- dd-mm-aaaa ----------"
fecha_inicial=$(date +"-------- %d-%m-%Y ----------")

# Definir el nombre del archivo con fecha y hora
nombre_archivo=$(date +"%d-%m-%Y_%H-%M-%S").txt

# Escribir la fecha inicial en el archivo errores.txt
echo "$fecha_inicial" > /home/srvbackup/errores/online/"$nombre_archivo"

# Asumir el rol de IAM

# Obtener la fecha actual en formato "dd-mm-aaaa"
fecha_actual=$(date +"%d-%m-%Y")

# Lista de directorios locales que quieres sincronizar
directorios_local=("/online/disk2" "/online/disk4" "/online/tn" "/online/usr/cobol" "/online/usr/cobol/salto/listados"
 "/online/usr/cobol/salto/historico" "/online/usr/cobol/salto/mensual" "/datadog" "/online/usr/cobol/tmp" "/online/home"
 "/online/home/octrl-m" "/online/home/srvtcp/log")

# Nombre del bucket S3
bucket="backup-core-nx"

# Ruta en S3 donde quieres sincronizar los archivos
ruta_s3="s3://$bucket/online/diario/$fecha_actual"

# Verificar si la carpeta ya existe en S3
if aws s3api head-object --bucket "$bucket" --key "online/diario/$fecha_actual/" 2>/dev/null; then
    # Si existe, mostrar un mensaje
    echo "Ya existe la carpeta"
else
    # Si no existe, crear la carpeta y mostrar un mensaje de error si falla
    if ! aws s3api put-object --bucket "$bucket" --key "online/diario/$fecha_actual/" 2>> /home/srvbackup/errores/online/"$nombre_archivo"; then
        echo "No se pudo crear la carpeta del backup actual"
        exit 2
    else
        echo "Se generó una nueva carpeta '$fecha_actual'"
    fi
fi

# Función para sincronizar un directorio local con S3
sincronizar_directorio() {
    local directorio="$1"
export LC_ALL=en_US.iso88591
    aws s3 sync "$directorio" "$ruta_s3""$directorio" --only-show-errors 2>> /home/srvbackup/errores/online/"$nombre_archivo"
}

# Realizar el primer intento de sincronización
for dir in "${directorios_local[@]}"; do
    sincronizar_directorio "$dir" &
done

# Esperar a que todos los procesos secundarios terminen
wait
# Contar advertencias y fallos
warnings=$(grep -c "warning" /home/srvbackup/errores/online/"$nombre_archivo")
failed=$(grep -c "failed" /home/srvbackup/errores/online/"$nombre_archivo")

# Si hubo fallos, realizar un segundo intento de sincronización
if [ "$failed" -gt 0 ]; then
    echo "El primer intento de sincronización falló. Realizando un segundo intento..."

# Generar un nuevo archivo con la fecha y hora actual para el segundo intento
    nombre_archivo=$(date +"%d-%m-%Y_%H-%M-%S").txt
    echo "-------- $(date +"%d-%m-%Y %H:%M:%S") ----------" > /home/srvbackup/errores/online/"$nombre_archivo"

    # Realizar el segundo intento de sincronización
    for dir in "${directorios_local[@]}"; do
        sincronizar_directorio "$dir" &
done

    # Esperar a que todos los procesos secundarios terminen
    wait

    # Contar advertencias y fallos nuevamente
    warnings=$(grep -c "warning" /home/srvbackup/errores/online/"$nombre_archivo")
    failed=$(grep -c "failed" /home/srvbackup/errores/online/"$nombre_archivo")

    # Si hubo fallos después del segundo intento, mostrar mensaje de fallo y salir
    if [ "$failed" -gt 0 ]; then
                echo "La sincronización falló después del segundo intento"
        exit 1
    fi
fi

# Si no hubo fallos en la sincronización, imprimir mensaje de éxito
echo "La sincronización se realizó correctamente sin errores."


