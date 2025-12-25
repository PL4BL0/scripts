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
directorios_local=("/home/srvbackup/errores/prueba" "/home/srvbackup/errores/prueba2")

# Nombre del bucket S3
bucket="backup-core-prueba"

# Ruta en S3 donde quieres sincronizar los archivos
ruta_s3="s3://$bucket/autoriza/semanal/$fecha_actual"

# Verificar si la carpeta ya existe en S3
if aws s3api head-object --bucket "$bucket" --key "online/semanal/$fecha_actual/" 2>/dev/null; then
    echo "Ya existe la carpeta"
else
    if ! aws s3api put-object --bucket "$bucket" --key "online/semanal/$fecha_actual/" 2>> /home/srvbackup/errores/online/"$nombre_archivo"; then
        echo "No se pudo crear la carpeta del backup actual"
        exit 2
    else
        echo "Se generó una nueva carpeta '$fecha_actual'"
    fi
fi

# Inicializar la variable para rastrear si alguna sincronización es exitosa
sincronizacion_exitosa=0

# Función para sincronizar un directorio local con S3
sincronizar_directorio() {
    local directorio="$1"
    export LC_ALL=en_US.iso88591

    # Validación previa de copia usando --dryrun
    dryrun_output=$(aws s3 sync "$directorio" "$ruta_s3""$directorio" --dryrun --only-show-errors)

    # Verificar si hay datos para copiar
    if [ -n "$dryrun_output" ]; then
        # Si hay datos, realizar la sincronización real
        aws s3 sync "$directorio" "$ruta_s3""$directorio" --only-show-errors 2>> /home/srvbackup/errores/online/"$nombre_archivo"
        sincronizacion_exitosa=1  # Marcar que al menos una sincronización fue exitosa
    else
        # Informar que no hay datos para copiar en este directorio
        echo "No se encontraron datos a copiar en $directorio, revisar montado de filesystem" | tee -a /home/srvbackup/errores/online/"$nombre_archivo"
    fi
}

# Realizar el primer intento de sincronización
for dir in "${directorios_local[@]}"; do
    sincronizar_directorio "$dir"
done

# Contar advertencias y fallos
warnings=$(grep -c "warning" /home/srvbackup/errores/online/"$nombre_archivo")
failed=$(grep -c "failed" /home/srvbackup/errores/online/"$nombre_archivo")

# Verificar si ninguna sincronización fue exitosa
if [ "$sincronizacion_exitosa" -eq 0 ]; then
    echo "La sincronización falló debido a la falta de datos en todos los directorios."
    exit 1
fi

# Si hubo fallos, realizar un segundo intento de sincronización
if [ "$failed" -gt 0 ]; then
    echo "El primer intento de sincronización falló. Realizando un segundo intento..."

    # Generar un nuevo archivo con la fecha y hora actual para el segundo intento
    nombre_archivo=$(date +"%d-%m-%Y_%H-%M-%S").txt
    echo "-------- $(date +"%d-%m-%Y %H:%M:%S") ----------" > /home/srvbackup/errores/online/"$nombre_archivo"

    # Reiniciar variable de éxito para el segundo intento
    sincronizacion_exitosa=0

    for dir in "${directorios_local[@]}"; do
        sincronizar_directorio "$dir"
    done

    # Contar advertencias y fallos nuevamente
    warnings=$(grep -c "warning" /home/srvbackup/errores/online/"$nombre_archivo")
    failed=$(grep -c "failed" /home/srvbackup/errores/online/"$nombre_archivo")

    # Verificar si ninguna sincronización fue exitosa en el segundo intento
    if [ "$sincronizacion_exitosa" -eq 0 ]; then
        echo "La sincronización falló debido a la falta de datos a copiar en todos los directorios en el segundo intento."
        exit 1
    fi

    # Si hubo fallos después del segundo intento, mostrar mensaje de fallo y salir
    if [ "$failed" -gt 0 ]; then
        echo "La sincronización falló después del segundo intento"
        exit 1
    fi
fi

# Si al menos una sincronización fue exitosa y no hubo errores críticos, imprimir mensaje de éxito
echo "La sincronización se realizó correctamente sin errores."
