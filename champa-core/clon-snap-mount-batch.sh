sudo -u root /home/control-m/scripts/clon-snap-mount-batch-tree.sh

sleep 15

sudo -u root /home/control-m/scripts/clon-snap-mount-online.sh

sleep 15

sudo -u root /home/control-m/scripts/clon-snap-mount-autoriza.sh

sleep 15

echo "Control de clon snap, la fecha del archivo debe coincidir con la ejecucion"

l -t /batch/usr/cobol/salto/arch/mbase
diab=`l -t /batch/usr/cobol/salto/arch/mbase | awk '{printf $7}'`
diao=`l -t /online/usr/cobol/salto/arch/mbase | awk '{printf $7}'`
diaa=`l -t /autoriza/usr/cobol/salto/arch/mbase | awk '{printf $7}'`

hoy=`date | awk '{printf $3}'`
if [ $diaa -eq $hoy ]
then
        echo " LA FECHA DEL ARCHIVO MBASE DE AUTORIZA COINCIDE CON LA FECHA DE HOY"
        echo " Snap actualizado exitosamente"
else
        echo "REVISAR EL SNAP DE AUTORIZA"
fi

if [ $diab -eq $hoy ]
then
        echo " LA FECHA DEL ARCHIVO MBASE DE BATCH COINCIDE CON LA FECHA DE HOY"
        echo " Snap actualizado exitosamente"
else
        echo "REVISAR EL SNAP DE BATCH"
fi

if [ $diaa -eq $hoy ]
then
        echo " LA FECHA DEL ARCHIVO MBASE DE ONLINE COINCIDE CON LA FECHA DE HOY"
        echo " Snap actualizado exitosamente"
else
        echo "REVISAR EL SNAP DE ONLINE"
fi

exit 0
