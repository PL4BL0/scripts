#!/bin/bash
# fecha actual 
TODAY=$(date +"%d-%m-%Y")
echo $TODAY
# Remote server data
REMOTE_USER="srvbackup"
REMOTE_HOST="172.24.85.241"

#rutas
RUTAS=(
    "/home/srvbackup/errores/autoriza/$TODAY*"
    "/home/srvbackup/errores/batch/$TODAY*"
    "/home/srvbackup/errores/online/$TODAY*"
)

#ssh ${REMOTE_USER}@${REMOTE_HOST} cat /home/srvbackup/errores/batch/$TODAY*

# cateo the logs from the diferent directories
for DIR in "${RUTAS[@]}"; do
    
    ssh ${REMOTE_USER}@${REMOTE_HOST} "cat ${DIR}" 
    echo $RUTAS
    
done

