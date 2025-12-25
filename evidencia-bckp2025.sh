#!/bin/bash

# Ensure you have the AWS CLI installed and configured.
# You can install it on macOS using Homebrew:
# brew install awscli
# Configure it with: aws configure

# Define the backup vault name and the region
backupVaultName="aws_bkp_nx"  # Replace with the name of your backup vault
region="us-east-1"            # Replace with the region corresponding to your vault
outputFilePath="~/Desktop/recovery_points.csv" # Using .csv for proper format, ~ for home directory

# --- Start message ---
echo "Iniciando exportación de puntos de recuperación..."
echo "Vault: '$backupVaultName' en la región: '$region'"

# --- Get all recovery points from the backup vault with error handling ---
# Use --output json to get JSON output for jq
# Use --no-paginate to get all results in one go (for smaller vaults) or
# handle pagination in a loop if you have many recovery points.
recoveryPointsJson=$(aws backup list-recovery-points-by-backup-vault \
    --backup-vault-name "$backupVaultName" \
    --region "$region" \
    --output json \
    --no-paginate 2>&1) # Redirect stderr to stdout for error capture

# Check if the AWS CLI command was successful
if [ $? -ne 0 ]; then
    echo "Error al obtener los puntos de recuperación:" >&2
    echo "$recoveryPointsJson" >&2 # Print the error message from AWS CLI
    echo "Asegúrate de que el backup vault exista, la región sea correcta y tengas las credenciales configuradas." >&2
    exit 1
fi

# Extract the RecoveryPoints array from the JSON output
# jq will handle if RecoveryPoints is empty gracefully
recoveryPointsArray=$(echo "$recoveryPointsJson" | jq -c '.RecoveryPoints[]')

# Check if any recovery points were found
if [ -z "$recoveryPointsArray" ]; then
    echo "Advertencia: No se encontraron puntos de recuperación en el backup vault '$backupVaultName'."
    echo "Script finalizado."
    exit 0
fi

# --- Filter recovery points (optional) ---
# Uncomment and adjust this section if you need to filter the results.
# Example: Filter for DynamoDB resources with "nthunder" in their name
# filteredRecoveryPointsJson=$(echo "$recoveryPointsJson" | \
#     jq -c '.RecoveryPoints[] | select(.ResourceType == "DynamoDB" and .ResourceName | contains("nthunder"))')

# For this script, we'll process all if no filter is applied.
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
    if [ -n "$creationDateUnix" ]; then
        # 'date -r' is for macOS (BSD date). For Linux, it's 'date -d @'
        creationDateFormatted=$(date -r "$creationDateUnix" +"%Y-%m-%d %H:%M:%S")
    else
        creationDateFormatted="N/A"
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