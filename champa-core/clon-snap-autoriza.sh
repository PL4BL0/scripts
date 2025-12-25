# Mathias Sierralta, 5-jun-2024
# Nota a tener en cuenta, LUN_ID debe ser el mismo para cada LUN en el mapeo
#
# LUN_ID=100 /vol/autoriza_usr_cobol/autoriza_usr_cobol
# LUN_ID=101 /vol/autoriza_home/autoriza_home 
# LUN_ID=102 /vol/autoriza_home_octrlm/autoriza_home_octrlm
# LUN_ID=103 /vol/autoriza_usr_cobol_cod_aut_datadog/autoriza_usr_cobol_cod_aut_datadog
# LUN_ID=104 /vol/autoriza_usr_cobol_cod_aut_jpos/autoriza_usr_cobol_cod_aut_jpos
# LUN_ID=105 /vol/autoriza_usr_cobol_tmp/autoriza_usr_cobol_tmp


# Desmonto y exporto los vg en champaqui
sudo -u root /home/control-m/scripts/clon-snap-umount-autoriza.sh

sudo -u vsadmin ssh vsadmin@172.24.87.234 snap show |grep snap1
if [ $? -ne 0 ]
then
    echo "ELIMINO TODO DE SNAP2 Y CREAR TODO EL SNAP1"

    sudo -u vsadmin ssh vsadmin@172.24.87.234 volume offline -volume autoriza_usr_cobol_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.234 volume offline -volume autoriza_home_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.234 volume offline -volume autoriza_home_octrlm_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.234 volume offline -volume autoriza_usr_cobol_cod_aut_datadog_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.234 volume offline -volume autoriza_usr_cobol_cod_aut_jpos_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.234 volume offline -volume autoriza_usr_cobol_tmp_clone2

    sudo -u vsadmin ssh vsadmin@172.24.87.234 volume delete -volume autoriza_usr_cobol_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.234 volume delete -volume autoriza_home_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.234 volume delete -volume autoriza_home_octrlm_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.234 volume delete -volume autoriza_usr_cobol_cod_aut_datadog_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.234 volume delete -volume autoriza_usr_cobol_cod_aut_jpos_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.234 volume delete -volume autoriza_usr_cobol_tmp_clone2

    sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_usr_cobol -snapshot autoriza_usr_cobol_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_home -snapshot autoriza_home_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_home_octrlm -snapshot autoriza_home_octrlm_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_usr_cobol_cod_aut_datadog -snapshot autoriza_usr_cobol_cod_aut_datadog_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_usr_cobol_cod_aut_jpos -snapshot autoriza_usr_cobol_cod_aut_jpos_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_usr_cobol_tmp -snapshot autoriza_usr_cobol_tmp_snap2

    echo "Creo los snap1"

        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume snapshot create -volume autoriza_usr_cobol -snapshot autoriza_usr_cobol_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume snapshot create -volume autoriza_home -snapshot autoriza_home_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume snapshot create -volume autoriza_home_octrlm -snapshot autoriza_home_octrlm_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume snapshot create -volume autoriza_usr_cobol_cod_aut_datadog -snapshot autoriza_usr_cobol_cod_aut_datadog_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume snapshot create -volume autoriza_usr_cobol_cod_aut_jpos -snapshot autoriza_usr_cobol_cod_aut_jpos_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume snapshot create -volume autoriza_usr_cobol_tmp -snapshot autoriza_usr_cobol_tmp_snap1

    echo "Creo los clone1"

        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume clone create -flexclone autoriza_usr_cobol_clone1 -type RW -parent-vserver fsx -parent-volume autoriza_usr_cobol -parent-snapshot autoriza_usr_cobol_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume clone create -flexclone autoriza_home_clone1 -type RW -parent-vserver fsx -parent-volume autoriza_home -parent-snapshot autoriza_home_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume clone create -flexclone autoriza_home_octrlm_clone1 -type RW -parent-vserver fsx -parent-volume autoriza_home_octrlm -parent-snapshot autoriza_home_octrlm_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume clone create -flexclone autoriza_usr_cobol_cod_aut_datadog_clone1 -type RW -parent-vserver fsx -parent-volume autoriza_usr_cobol_cod_aut_datadog -parent-snapshot autoriza_usr_cobol_cod_aut_datadog_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume clone create -flexclone autoriza_usr_cobol_cod_aut_jpos_clone1 -type RW -parent-vserver fsx -parent-volume autoriza_usr_cobol_cod_aut_jpos -parent-snapshot autoriza_usr_cobol_cod_aut_jpos_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume clone create -flexclone autoriza_usr_cobol_tmp_clone1 -type RW -parent-vserver fsx -parent-volume autoriza_usr_cobol_tmp -parent-snapshot autoriza_usr_cobol_tmp_snap1

    echo "Mapeo las LUN's de clone1"

        sudo -u vsadmin ssh vsadmin@172.24.87.234 lun map -path /vol/autoriza_usr_cobol_clone1/autoriza_usr_cobol -igroup igchampaqui -lun-id 100
        sudo -u vsadmin ssh vsadmin@172.24.87.234 lun map -path /vol/autoriza_home_clone1/autoriza_home -igroup igchampaqui -lun-id 101
        sudo -u vsadmin ssh vsadmin@172.24.87.234 lun map -path /vol/autoriza_home_octrlm_clone1/autoriza_home_octrlm -igroup igchampaqui -lun-id 102
        sudo -u vsadmin ssh vsadmin@172.24.87.234 lun map -path /vol/autoriza_usr_cobol_cod_aut_datadog_clone1/autoriza_usr_cobol_cod_aut_datadog -igroup igchampaqui -lun-id 103
        sudo -u vsadmin ssh vsadmin@172.24.87.234 lun map -path /vol/autoriza_usr_cobol_cod_aut_jpos_clone1/autoriza_usr_cobol_cod_aut_jpos -igroup igchampaqui -lun-id 104
        sudo -u vsadmin ssh vsadmin@172.24.87.234 lun map -path /vol/autoriza_usr_cobol_tmp_clone1/autoriza_usr_cobol_tmp -igroup igchampaqui -lun-id 105

else
    sudo -u vsadmin ssh vsadmin@172.24.87.234 snap show |grep snap2
    if [ $? -ne 0 ]
    then
        echo "ELIMINO TODO DE SNAP1 Y CREAR TODO EL SNAP2"

        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume offline -volume autoriza_usr_cobol_clone1 
        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume offline -volume autoriza_home_clone1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume offline -volume autoriza_home_octrlm_clone1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume offline -volume autoriza_usr_cobol_cod_aut_datadog_clone1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume offline -volume autoriza_usr_cobol_cod_aut_jpos_clone1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume offline -volume autoriza_usr_cobol_tmp_clone1

        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume delete -volume autoriza_usr_cobol_clone1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume delete -volume autoriza_home_clone1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume delete -volume autoriza_home_octrlm_clone1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume delete -volume autoriza_usr_cobol_cod_aut_datadog_clone1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume delete -volume autoriza_usr_cobol_cod_aut_jpos_clone1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 volume delete -volume autoriza_usr_cobol_tmp_clone1

        sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_usr_cobol -snapshot autoriza_usr_cobol_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_home -snapshot autoriza_home_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_home_octrlm -snapshot autoriza_home_octrlm_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_usr_cobol_cod_aut_datadog -snapshot autoriza_usr_cobol_cod_aut_datadog_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_usr_cobol_cod_aut_jpos -snapshot autoriza_usr_cobol_cod_aut_jpos_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_usr_cobol_tmp -snapshot autoriza_usr_cobol_tmp_snap1

        echo "Creo los snap2"

            sudo -u vsadmin ssh vsadmin@172.24.87.234 volume snapshot create -volume autoriza_usr_cobol -snapshot autoriza_usr_cobol_snap2
            sudo -u vsadmin ssh vsadmin@172.24.87.234 volume snapshot create -volume autoriza_home -snapshot autoriza_home_snap2
            sudo -u vsadmin ssh vsadmin@172.24.87.234 volume snapshot create -volume autoriza_home_octrlm -snapshot autoriza_home_octrlm_snap2
            sudo -u vsadmin ssh vsadmin@172.24.87.234 volume snapshot create -volume autoriza_usr_cobol_cod_aut_datadog -snapshot autoriza_usr_cobol_cod_aut_datadog_snap2
            sudo -u vsadmin ssh vsadmin@172.24.87.234 volume snapshot create -volume autoriza_usr_cobol_cod_aut_jpos -snapshot autoriza_usr_cobol_cod_aut_jpos_snap2
            sudo -u vsadmin ssh vsadmin@172.24.87.234 volume snapshot create -volume autoriza_usr_cobol_tmp -snapshot autoriza_usr_cobol_tmp_snap2

         echo "Creo los clone2"

            sudo -u vsadmin ssh vsadmin@172.24.87.234 volume clone create -flexclone autoriza_usr_cobol_clone2 -type RW -parent-vserver fsx -parent-volume autoriza_usr_cobol -parent-snapshot autoriza_usr_cobol_snap2
            sudo -u vsadmin ssh vsadmin@172.24.87.234 volume clone create -flexclone autoriza_home_clone2 -type RW -parent-vserver fsx -parent-volume autoriza_home -parent-snapshot autoriza_home_snap2
            sudo -u vsadmin ssh vsadmin@172.24.87.234 volume clone create -flexclone autoriza_home_octrlm_clone2 -type RW -parent-vserver fsx -parent-volume autoriza_home_octrlm -parent-snapshot autoriza_home_octrlm_snap2
            sudo -u vsadmin ssh vsadmin@172.24.87.234 volume clone create -flexclone autoriza_usr_cobol_cod_aut_datadog_clone2 -type RW -parent-vserver fsx -parent-volume autoriza_usr_cobol_cod_aut_datadog -parent-snapshot autoriza_usr_cobol_cod_aut_datadog_snap2
            sudo -u vsadmin ssh vsadmin@172.24.87.234 volume clone create -flexclone autoriza_usr_cobol_cod_aut_jpos_clone2 -type RW -parent-vserver fsx -parent-volume autoriza_usr_cobol_cod_aut_jpos -parent-snapshot autoriza_usr_cobol_cod_aut_jpos_snap2
            sudo -u vsadmin ssh vsadmin@172.24.87.234 volume clone create -flexclone autoriza_usr_cobol_tmp_clone2 -type RW -parent-vserver fsx -parent-volume autoriza_usr_cobol_tmp -parent-snapshot autoriza_usr_cobol_tmp_snap2

         echo "Mapeo las LUN's de clone2"   

            sudo -u vsadmin ssh vsadmin@172.24.87.234 lun map -path /vol/autoriza_usr_cobol_clone2/autoriza_usr_cobol -igroup igchampaqui -lun-id 100
            sudo -u vsadmin ssh vsadmin@172.24.87.234 lun map -path /vol/autoriza_home_clone2/autoriza_home -igroup igchampaqui -lun-id 101
            sudo -u vsadmin ssh vsadmin@172.24.87.234 lun map -path /vol/autoriza_home_octrlm_clone2/autoriza_home_octrlm -igroup igchampaqui -lun-id 102
            sudo -u vsadmin ssh vsadmin@172.24.87.234 lun map -path /vol/autoriza_usr_cobol_cod_aut_datadog_clone2/autoriza_usr_cobol_cod_aut_datadog -igroup igchampaqui -lun-id 103
            sudo -u vsadmin ssh vsadmin@172.24.87.234 lun map -path /vol/autoriza_usr_cobol_cod_aut_jpos_clone2/autoriza_usr_cobol_cod_aut_jpos -igroup igchampaqui -lun-id 104
            sudo -u vsadmin ssh vsadmin@172.24.87.234 lun map -path /vol/autoriza_usr_cobol_tmp_clone2/autoriza_usr_cobol_tmp -igroup igchampaqui -lun-id 105

    fi
fi

# Monto el vg en champaqui

#sleep 30

#sudo -u root /home/control-m/scripts/clon-snap-mount-autoriza.sh

#echo -e "\033[1;4;31mControl de clon snap, la fecha del archivo debe coincidir con la ejecucion"
#echo -e "\033[0m"
#sleep 40
#l -t /autoriza/usr/cobol/salto/arch/mbase
#dia=`l -t /autoriza/usr/cobol/salto/arch/mbase | awk '{printf $7}'`
#hoy=`date | awk '{printf $3}'`
#if [ $dia -eq $hoy ]
#then
#        echo " LA FECHA DEL ARCHIVO COINCIDE CON LA FECHA DE HOY"
#        echo " Snap actualizado exitosamente"
#        exit 0
#else
#        echo -e "\033[1;4;31mREVISAR EL SNAP"
#        echo -e "\033[0m"
#        exit 1
#fi

#CANT=`df -h |grep autoriza |wc -l`
#df -h |grep autoriza
#if [ $? -ne 0 ]
#then
#   echo "Error al montar los File System, informar al administrador UNIX de 8 a 18 hs"
#   echo " Esperar a que el administrador UNIX informe para lanzar nuevamente el backup"
#   exit 1
#fi
exit 0
