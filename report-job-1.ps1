# Asegúrate de tener instalado y configurado AWS.Tools.Backup
# Puedes instalarlo con: Install-Module -Name AWS.Tools.Backup

# 1. Lista de cuentas a relevar (reemplaza con tus IDs)
$accountIds = @(
    "000730223957",
"887443037123",
"082097868692",
"605134464899",
"108782094379",
"438907269372",
"545547662815",
"533267434277",
"235494820933",
"062641599171",
"211125507574",
"891377125183",
"718562176973",
"905418241526",
"677922165494",
"831470686561",
"961341546618",
"872515279293",
"905418149223",
"979097567891",
"643522419901",
"871650853919",
"116981806357",
"390403881983",
"590183724006",
"866979334401",
"647458720023",
"378672388316",
"649452367238",
"681612596432",
"449173419784",
"133622154518",
"545672384439",
"082796355736",
"235317140495",
"736249945380",
"582817720825",
"425785538755",
"292382915980",
"387361416006",
"057731777813",
"575417001661",
"147602726048",
"852945269327",
"136720710177",
"584223820136",
"467710080515",
"491763982938",
"841847039497",
"176869135313",
"471361715340",
"155165559527",
"905523407963",
"088409023502",
"089125844537",
"922089156627",
"327642094724"
)

# 2. Rango de fechas para filtrar los Backup Jobs del 26/04/2025
$startDate = [DateTime]::Parse("2025-04-26T00:00:00Z")
$endDate   = [DateTime]::Parse("2025-04-27T00:00:00Z")

# 3. Acumulador de resultados
$results = @()

foreach ($acct in $accountIds) {
    # 4. Obtener los Backup Jobs en ese rango de fechas
    $jobs = Get-BAKBackupJobList `
        -ByAccountId     $acct `
        -ByCreatedAfter  $startDate `
        -ByCreatedBefore $endDate

    foreach ($job in $jobs) {
        $results += [PSCustomObject]@{
            AccountId       = $acct
            BackupVaultName = $job.BackupVaultName
            ResourceArn     = $job.ResourceArn
            ResourceType    = $job.ResourceType
            ResourceName    = ($job.ResourceArn -split "/")[-1]
            CreationDate    = $job.CreationDate.ToString("s")
        }
    }
}

# 5. Convertir a líneas CSV (texto plano)
$csvLines = $results | ConvertTo-Csv -NoTypeInformation

# 6. Guardar en archivo de texto
$outputDirectory = "$env:USERPROFILE\Desktop\Backups"
$outputFileName  = "backup_jobs_2025-04-26.txt"
$outputFile = Join-Path $outputDirectory $outputFileName

# Crear la carpeta si no existe
if (-not (Test-Path $outputDirectory -PathType Container)) {
    try {
        New-Item -ItemType Directory -Path $outputDirectory -ErrorAction Stop | Out-Null
    }
    catch {
        Write-Error "No se pudo crear la carpeta $outputDirectory. Detalles: $_"
        exit 1
    }
}

# Escribir en el archivo
try {
    $csvLines | Out-File -FilePath $outputFile -Encoding UTF8 -Force
}
catch [System.UnauthorizedAccessException] {
    Write-Error "Acceso denegado al escribir en '$outputFile'. Verifica permisos o ruta."
}
catch {
    Write-Error "Error inesperado al escribir el archivo: $_"
}
