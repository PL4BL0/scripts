#!/bin/bash
# fecha actual 
TODAY=$(date +"%d-%m-%Y")
echo $TODAY

# Offer to change the date
read -p "Do you want to change the date? (yes/no) " answer
if [ "$answer" == "yes" ]; then
    read -p "Enter new date (dd-mm-yyyy): " new_date
    if [[ "$new_date" =~ ^[0-9]{2}-[0-9]{2}-[0-9]{4}$ ]]; then
        TODAY="$new_date"
        echo "Date updated to: $TODAY"
    else
        echo "Invalid date format."
    fi    
fi

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

