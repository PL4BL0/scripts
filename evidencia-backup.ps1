# Asegúrate de tener instalado y configurado el módulo AWS.Tools.Backup
# Puedes instalarlo con: Install-Module -Name AWS.Tools.Backup

# Define el nombre del backup vault y la región correspondiente
$backupVaultName = "aws_bkp_nx"  # Reemplaza con el nombre de tu backup vault
$region = "us-east-1"  # Reemplaza con la región correspondiente

# Obtiene todos los puntos de recuperación del backup vault
$recoveryPoints = Get-BAKRecoveryPointsByBackupVaultList `
    -BackupVaultName $backupVaultName `
    -Region $region

# Filtra los puntos de recuperación por tipo de recurso y nombre si es necesario
$filteredRecoveryPoints = $recoveryPoints 
#| Where-Object {
#    $_.ResourceType -eq "DynamoDB" -and $_.ResourceName -like "*nthunder*"
#}

# Prepara los datos para exportar a un archivo de texto con formato CSV
$csvData = $filteredRecoveryPoints | Select-Object `
    @{Name="RecoveryPointArn"; Expression={$_.RecoveryPointArn}},
    @{Name="ResourceName"; Expression={$_.ResourceName}},
    @{Name="ResourceType"; Expression={$_.ResourceType}},
    @{Name="CreationDate"; Expression={$_.CreationDate}},
    @{Name="RetentionDays"; Expression={$_.Lifecycle.DeleteAfterDays}}

# Convierte los datos a una cadena de texto con formato CSV
$csvString = $csvData | ConvertTo-Csv -NoTypeInformation

# Especifica la ruta y el nombre del archivo de salida
$outputFilePath = "C:\Users\JeremiasHernandez\Desktop\recovery_points.txt"  # Reemplaza con la ruta deseada

# Escribe la cadena CSV en el archivo de texto
$csvString | Out-File -FilePath $outputFilePath
