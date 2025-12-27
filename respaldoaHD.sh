#!/bin/bash

# ==========================================
# CONFIGURACIÓN CORRECTA
# ==========================================

ORIGEN="$HOME"

# AQUÍ ESTABA EL ERROR. Usamos el nombre que sale en la foto:
DESTINO="/Volumes/macFUSE Volume 0 (ntfs-3g)/bckp.MAC13.2025"

CARPETAS=(
    "Desktop"
    "Documents"
    "Pictures"
    "Music"
    "Movies"
)

# ==========================================
# INICIO DEL PROCESO
# ==========================================

echo "🚀 Iniciando respaldo al disco 'macFUSE Volume 0 (ntfs-3g)'..."
echo "📂 Destino: $DESTINO"

# Verificación de seguridad: ¿Está el disco REALMENTE conectado?
# Comprobamos si la carpeta 'Volumes' tiene el disco montado
if [ ! -d "/Volumes/macFUSE Volume 0 (ntfs-3g)" ]; then
    echo "❌ ERROR CRÍTICO: No encuentro el disco externo."
    echo "Asegúrate de que 'macFUSE Volume 0 (ntfs-3g)' aparezca en tu Finder."
    exit 1
fi

# Crear carpeta de destino si no existe
if [ ! -d "$DESTINO" ]; then
    echo "📁 Creando carpeta bckp.MAC13.2025 en el disco externo..."
    mkdir -p "$DESTINO"
fi

for carpeta in "${CARPETAS[@]}"; do
    FUENTE="$ORIGEN/$carpeta"
    RUTA_DESTINO="$DESTINO" 

    if [ -d "$FUENTE" ]; then
        echo "----------------------------------------"
        echo "🔵 Copiando carpeta: $carpeta"
        
        # Usamos cp -RvX para máxima compatibilidad
        cp -RvX "$FUENTE" "$RUTA_DESTINO"
        
        echo "✅ $carpeta completada."
    else
        echo "⚠️ $carpeta no encontrada."
    fi
done

echo "----------------------------------------"
echo "🎉 ¡Respaldo Finalizado! Ahora SÍ deberías ver los archivos en el disco."