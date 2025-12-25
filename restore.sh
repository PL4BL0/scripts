#!/bin/bash

# Herramienta v2.0 para restaurar y descargar desde S3, manejando objetos en Glacier.

# --- Muestra cómo usar la herramienta y sale ---
function usage {
    echo "Uso: $0 [modo] [s3_uri] [argumentos...]"
    echo ""
    echo "Modos:"
    echo "  restore   - Inicia la restauración de objetos en Glacier."
    echo "  download  - Descarga los objetos a un directorio local."
    echo ""
    echo "Argumentos:"
    echo "  s3://bucket/prefijo/         - La ruta S3 a procesar."
    echo "  /ruta/local/                 - (Solo para download) Directorio de destino."
    echo "  --include \"patron*\"        - Incluye archivos que coincidan. Se puede usar varias veces."
    echo "  --exclude \"patron*\"        - Excluye archivos que coincidan. Se puede usar varias veces."
    echo ""
    echo "Ejemplo Completo:"
    echo "  $0 restore s3://bucket/p/ --include \"datos*\" --include \"log*\" --exclude \"*.tmp\""
    echo ""
    exit 1
}

# --- VALIDACIÓN INICIAL ---
MODE=$1
S3_URI=$2

if [[ "$MODE" != "restore" && "$MODE" != "download" ]] || [[ -z "$S3_URI" ]]; then
    usage
fi

# Extrae el bucket y el prefijo del S3 URI
if [[ $S3_URI =~ s3://([^/]+)/(.*) ]]; then
    BUCKET_NAME="${BASH_REMATCH[1]}"
    PREFIX="${BASH_REMATCH[2]}"
else
    echo "Error: Formato de S3 URI incorrecto." >&2
    exit 1
fi

# --- PROCESAMIENTO AVANZADO DE ARGUMENTOS ---
shift 2 # Quita el modo y el S3 URI de la lista de argumentos

LOCAL_PATH=""
if [[ "$MODE" == "download" ]]; then
    if [[ -z "$1" || "$1" == --* ]]; then
        echo "Error: El modo download requiere una ruta local de destino." >&2
        usage
    fi
    LOCAL_PATH=$1
    shift # Quita la ruta local de la lista
fi

declare -a include_patterns
declare -a exclude_patterns

while [[ $# -gt 0 ]]; do
    case "$1" in
        --include)
            [[ -z "$2" ]] && { echo "Error: --include requiere un patrón." >&2; usage; }
            include_patterns+=("$2")
            shift 2
            ;;
        --exclude)
            [[ -z "$2" ]] && { echo "Error: --exclude requiere un patrón." >&2; usage; }
            exclude_patterns+=("$2")
            shift 2
            ;;
        *)
            echo "Error: Argumento desconocido '$1'." >&2
            usage
            ;;
    esac
done

# --- CONSTRUCCIÓN DE COMANDOS DE FILTRADO ---
function glob_to_regex() {
    # Convierte un patrón simple (como mtrans*) a una expresión regular para grep
    echo "$1" | sed -e 's/\./\\./g' -e 's/\*/.*/g'
}

FILTER_CMD=""
if (( ${#include_patterns[@]} > 0 )); then
    regex_parts=()
    for pattern in "${include_patterns[@]}"; do
        regex_parts+=("$(glob_to_regex "$pattern")")
    done
    full_regex=$(printf "%s|" "${regex_parts[@]}")
    FILTER_CMD="grep -E '/(${full_regex%|})'"
fi

if (( ${#exclude_patterns[@]} > 0 )); then
    for pattern in "${exclude_patterns[@]}"; do
        regex="/$(glob_to_regex "$pattern")"
        if [[ -z "$FILTER_CMD" ]]; then
             # Si solo hay excludes, el primer grep no puede empezar con |
             FILTER_CMD="grep -v -E '$regex'"
        else
             FILTER_CMD+=" | grep -v -E '$regex'"
        fi
    done
fi

# --- LÓGICA PRINCIPAL ---
case "$MODE" in
    restore)
        echo "✅ Iniciando MODO RESTAURACIÓN para S3 URI: $S3_URI"
        LIST_CMD="aws s3api list-objects-v2 --bucket \"$BUCKET_NAME\" --prefix \"$PREFIX\" --query \"Contents[?StorageClass=='GLACIER'].[Key]\" --output text"
        RESTORE_CMD="xargs -I {} aws s3api restore-object --bucket \"$BUCKET_NAME\" --key \"{}\" --restore-request '{\"Days\":7,\"GlacierJobParameters\":{\"Tier\":\"Standard\"}}'"
        
        if [[ -n "$FILTER_CMD" ]]; then
            eval "$LIST_CMD | $FILTER_CMD | $RESTORE_CMD"
        else
            eval "$LIST_CMD | $RESTORE_CMD"
        fi
        
        echo -e "\n✅ ¡Solicitudes de restauración enviadas!"
        echo "⏳ RECUERDA: La restauración puede tardar entre 3 y 5 horas."
        ;;

    download)
        echo "✅ Iniciando MODO DESCARGA para S3 URI: $S3_URI"
        echo "Descargando en: $LOCAL_PATH"
        
        LIST_CMD="aws s3api list-objects-v2 --bucket \"$BUCKET_NAME\" --prefix \"$PREFIX\" --query \"Contents[].[Key]\" --output text"
        DOWNLOAD_CMD="xargs -I {} aws s3 cp \"s3://$BUCKET_NAME/{}\" \"$LOCAL_PATH\""

        if [[ -n "$FILTER_CMD" ]]; then
            eval "$LIST_CMD | $FILTER_CMD | $DOWNLOAD_CMD"
        else
            eval "$LIST_CMD | $DOWNLOAD_CMD"
        fi

        echo -e "\n✅ ¡Descarga completada!"
        ;;
esac