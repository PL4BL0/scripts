sudo -u vsadmin ssh vsadmin@172.24.87.234 snap show |grep snap1
if [ $? -ne 0 ]
then
    echo "DEBERIA BORRAR TODO DE SNAP2 Y CREAR TODO EL SNAP1"
else
    sudo -u vsadmin ssh vsadmin@172.24.87.234 snap show |grep snap2
    if [ $? -ne 0 ]
    then
        echo "DEBERIA BORRAR TODO DE SNAP1 Y CREAR TODO EL SNAP2"
    fi
fi
