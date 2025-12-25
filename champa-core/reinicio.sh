/usr/bin/ps -def |grep aws
if [ $? -eq 0 ]
then 
    /usr/sbin/shutdown -r now
else
    echo "no se reinicio porque estaba corriendo cmd aws" >> /tmp/reinicio-log.log 
fi
