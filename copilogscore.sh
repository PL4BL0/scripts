#!/bin/bash

# Remote server details
REMOTE_USER="srvbackup"
REMOTE_HOST="172.24.85.241"
REMOTE_PATH="/home/srvbackup/errores/autoriza/"

# Local destination directory
LOCAL_PATH="/Users/naranjax/Documents/BI.RD/logs2025"

# Create a temporary file to store the list of new files
NEW_FILES="new_files.txt"

# Find files created in the last 24 hours on the remote server and store the list in the temporary file
ssh ${REMOTE_USER}@${REMOTE_HOST} "find ${REMOTE_PATH} -type f -mtime -1" > ${NEW_FILES}

# Copy the new files from the remote server to the local machine
scp -r $(cat ${NEW_FILES} | xargs -I {} echo "${REMOTE_USER}@${REMOTE_HOST}:{}") ${LOCAL_PATH}

# Clean up the temporary file
rm ${NEW_FILES}

echo "New files copied successfully!"




