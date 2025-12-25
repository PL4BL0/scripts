#!/bin/bash
#ssh srvbackup@172.24.85.241 << EOF
find /home/srvbackup/errores/autoriza/ -type f -mtime -1
find /home/srvbackup/errores/online/ -type f -mtime -1
find /home/srvbackup/errores/batch/ -type f -mtime -1 
EOF