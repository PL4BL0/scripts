#!/bin/bash

# Asegúrate de tener el AWS CLI instalado y configurado.
# Puedes instalarlo en macOS usando Homebrew:
# brew install awscli
# Configúralo con: aws configure

# --- Configuración ---
backupVaultName="aws_bkp_nx"  # Reemplaza con el nombre de tu backup vault
region="us-east-1"            # Reemplaza con la región correspondiente a tu vault
outputFilePath="~/Desktop/recovery_points.csv" # Usando .csv para un formato adecuado

# --- Mensaje de inicio ---
echo "Iniciando exportación de puntos de recuperación..."
echo "Vault: '$backupVaultName' en la región: '$region'"

# --- Asegurarse de que el directorio de salida existe ---
# Expande el path para que 'dirname' funcione correctamente con '~'
expandedOutputFilePath=$(eval echo "$outputFilePath")
outputDir=$(dirname "$expandedOutputFilePath")

echo "Verificando/Creando directorio de salida: $outputDir"
mkdir -p "$outputDir"
if [ $? -ne 0 ]; then
    echo "Error: No se pudo crear el directorio de salida '$outputDir'. Verifica los permisos." >&2
    exit 1
fi
outputFilePath="$expandedOutputFilePath" # Usar el path expandido para el resto del script

# --- Get all recovery points from the backup vault with error handling ---
recoveryPointsJson=$(aws backup list-recovery-points-by-backup-vault \
    --backup-vault-name "$backupVaultName" \
    --region "$region" \
    --output json \
    --no-paginate 2>&1)

# Check if the AWS CLI command was successful
if [ $? -ne 0 ]; then
    echo "Error al obtener los puntos de recuperación:" >&2
    echo "$recoveryPointsJson" >&2
    echo "Asegúrate de que el backup vault exista, la región sea correcta y tengas las credenciales configuradas." >&2
    exit 1
fi

# Extract the RecoveryPoints array from the JSON output
recoveryPointsArray=$(echo "$recoveryPointsJson" | jq -c '.RecoveryPoints[]')

# Check if any recovery points were found
if [ -z "$recoveryPointsArray" ]; then
    echo "Advertencia: No se encontraron puntos de recuperación en el backup vault '$backupVaultName'."
    echo "Script finalizado."
    exit 0
fi

# --- Filter recovery points (optional) ---
# Uncomment and adjust this section if you need to filter the results.
# filteredRecoveryPointsJson=$(echo "$recoveryPointsJson" | \
#     jq -c '.RecoveryPoints[] | select(.ResourceType == "DynamoDB" and .ResourceName | contains("nthunder"))')
filteredRecoveryPointsJson="$recoveryPointsArray"

# --- Prepare data for CSV export using jq ---
echo "Preparando los datos para la exportación..."

# Build the CSV header
echo "RecoveryPointArn,ResourceName,ResourceType,CreationDate,RetentionDays" > "$outputFilePath"

# Process each recovery point and append to the CSV file
echo "$filteredRecoveryPointsJson" | while IFS= read -r rp; do
    recoveryPointArn=$(echo "$rp" | jq -r '.RecoveryPointArn // "N/A"')
    resourceName=$(echo "$rp" | jq -r '.ResourceName // "N/A"')
    resourceType=$(echo "$rp" | jq -r '.ResourceType // "N/A"')
    
    # Format CreationDate to a readable format (YYYY-MM-DD HH:MM:SS)
    creationDateUnix=$(echo "$rp" | jq -r '.CreationDate // ""')
    
    # Validar que creationDateUnix sea un número antes de intentar formatear
    if [[ -n "$creationDateUnix" && "$creationDateUnix" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        # 'date -r' es para macOS (BSD date). Para Linux, es 'date -d @'
        creationDateFormatted=$(date -r "$creationDateUnix" +"%Y-%m-%d %H:%M:%S" 2>/dev/null)
        if [ $? -ne 0 ]; then # Check if date command itself failed
            creationDateFormatted="Error Formatting Date"
        fi
    else
        creationDateFormatted="N/A" # No es un timestamp válido o está vacío
    fi

    # RetentionDays is nested under 'Lifecycle.DeleteAfterDays'
    retentionDays=$(echo "$rp" | jq -r '.Lifecycle.DeleteAfterDays // "N/A"')

    # Output to CSV, handling commas within fields by quoting them
    printf "\"%s\",\"%s\",\"%s\",\"%s\",\"%s\"\n" \
        "$recoveryPointArn" \
        "$resourceName" \
        "$resourceType" \
        "$creationDateFormatted" \
        "$retentionDays" >> "$outputFilePath"

done

# --- Success message ---
echo "Proceso completado. Los puntos de recuperación han sido exportados exitosamente a '$outputFilePath'."