#!/bin/bash
# Remote server details
REMOTE_USER="srvbackup"
REMOTE_HOST="172.24.85.241"
echo "se va a conectar con: $REMOTE_USER"
echo "al equipo: $REMOTE_HOST"

# Directories on the remote server where are the files to copy
DIRECTORIES=(
    "/home/srvbackup/errores/autoriza"
    "/home/srvbackup/errores/batch"
    "/home/srvbackup/errores/online"
)
# Local destination directory where copy 
LOCAL_PATH="/Users/naranjax/Documents/BI.RD/logs2025"

# Temporary file to store the list of files to copy
NEW_FILES="new_files.txt"

# Find files created in the last 24 hours on the remote server and store the list in the temporary file
for DIR in "${DIRECTORIES[@]}"; do
ssh ${REMOTE_USER}@${REMOTE_HOST} "find ${DIR} -type f -mtime -1" > ${NEW_FILES} 
done

cat $NEW_FILES

# Copy the list of files from the remote server to the local machine and rename them
while IFS= read -r FILE; do
    DIR_NAME=$(basename $(dirname ${FILE}))
    BASE_NAME=$(basename ${FILE})
    echo $DIR_NAME $BASE_NAME
    
    scp "${REMOTE_USER}@${REMOTE_HOST}:${FILE}" "${LOCAL_PATH}/${DIR_NAME}_${BASE_NAME}"
done < ${NEW_FILES}

ls -l

# Delete the temporary file
rm ${NEW_FILES}

echo "New files copied and renamed successfully!"
