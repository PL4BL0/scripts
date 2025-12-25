# Mathias Sierralta, 25-jul-2024
# Nota a tener en cuenta, LUN_ID debe ser el mismo para cada LUN en el mapeo
#
# LUN_ID=200 /vol/online_datadog/online_datadog
# LUN_ID=201 /vol/online_disk2/online_disk2
# LUN_ID=202 /vol/online_disk4/online_disk4
# LUN_ID=203 /vol/online_home/online_home
# LUN_ID=204 /vol/online_home_octrlm/online_home_octrlm
# LUN_ID=205 /vol/online_home_srvtcp_log/online_home_srvtcp_log
# LUN_ID=206 /vol/online_tn/online_tn
# LUN_ID=207 /vol/online_usr_cobol/online_usr_cobol
# LUN_ID=208 /vol/online_usr_cobol_salto_historico/online_usr_cobol_salto_historico
# LUN_ID=209 /vol/online_usr_cobol_salto_listados/online_usr_cobol_salto_listados
# LUN_ID=210 /vol/online_usr_cobol_salto_mensual/online_usr_cobol_salto_mensual
# LUN_ID=211 /vol/online_usr_cobol_tmp/online_usr_cobol_tmp


# Desmonto y exporto los vg en champaqui
sudo -u root /home/control-m/scripts/clon-snap-umount-online.sh

sudo -u vsadmin ssh vsadmin@172.24.87.229 snap show |grep snap1
if [ $? -ne 0 ]
then
    echo "ELIMINO TODO DE SNAP2 Y CREAR TODO EL SNAP1"

    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_datadog_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_disk2_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_disk4_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_home_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_home_octrlm_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_home_srvtcp_log_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_tn_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_usr_cobol_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_usr_cobol_salto_historico_clone2
#    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_usr_cobol_salto_listados_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_usr_cobol_salto_listados_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_usr_cobol_salto_mensual_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_usr_cobol_tmp_clone2

    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_datadog_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_disk2_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_disk4_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_home_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_home_octrlm_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_home_srvtcp_log_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_tn_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_usr_cobol_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_usr_cobol_salto_historico_clone2
#    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_usr_cobol_salto_listados_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_usr_cobol_salto_listados_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_usr_cobol_salto_mensual_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_usr_cobol_tmp_clone2

    sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_datadog -snapshot online_datadog_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_disk2 -snapshot online_disk2_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_disk4 -snapshot online_disk4_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_home -snapshot online_home_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_home_octrlm -snapshot online_home_octrlm_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_home_srvtcp_log -snapshot online_home_srvtcp_log_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_tn -snapshot online_tn_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_usr_cobol -snapshot online_usr_cobol_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_usr_cobol_salto_historico -snapshot online_usr_cobol_salto_historico_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_usr_cobol_salto_listados -snapshot online_usr_cobol_salto_listados_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_usr_cobol_salto_mensual -snapshot online_usr_cobol_salto_mensual_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_usr_cobol_tmp -snapshot online_usr_cobol_tmp_snap2

    echo "Creo los snap1"

        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_datadog -snapshot online_datadog_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_disk2 -snapshot online_disk2_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_disk4 -snapshot online_disk4_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_home -snapshot online_home_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_home_octrlm -snapshot online_home_octrlm_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_home_srvtcp_log -snapshot online_home_srvtcp_log_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_tn -snapshot online_tn_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_usr_cobol -snapshot online_usr_cobol_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_usr_cobol_salto_historico -snapshot online_usr_cobol_salto_historico_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_usr_cobol_salto_listados -snapshot online_usr_cobol_salto_listados_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_usr_cobol_salto_mensual -snapshot online_usr_cobol_salto_mensual_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_usr_cobol_tmp -snapshot online_usr_cobol_tmp_snap1

    echo "Creo los clone1"

        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_datadog_clone1 -type RW -parent-vserver fsx -parent-volume online_datadog -parent-snapshot online_datadog_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_disk2_clone1 -type RW -parent-vserver fsx -parent-volume online_disk2 -parent-snapshot online_disk2_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_disk4_clone1 -type RW -parent-vserver fsx -parent-volume online_disk4 -parent-snapshot online_disk4_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_home_clone1 -type RW -parent-vserver fsx -parent-volume online_home -parent-snapshot online_home_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_home_octrlm_clone1 -type RW -parent-vserver fsx -parent-volume  online_home_octrlm -parent-snapshot online_home_octrlm_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_home_srvtcp_log_clone1 -type RW -parent-vserver fsx -parent-volume  online_home_srvtcp_log -parent-snapshot online_home_srvtcp_log_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_tn_clone1 -type RW -parent-vserver fsx -parent-volume online_tn -parent-snapshot online_tn_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_usr_cobol_clone1 -type RW -parent-vserver fsx -parent-volume online_usr_cobol  -parent-snapshot online_usr_cobol_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_usr_cobol_salto_historico_clone1 -type RW -parent-vserver fsx -parent-volume online_usr_cobol_salto_historico -parent-snapshot online_usr_cobol_salto_historico_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_usr_cobol_salto_listados_clone1 -type RW -parent-vserver fsx -parent-volume online_usr_cobol_salto_listados -parent-snapshot online_usr_cobol_salto_listados_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_usr_cobol_salto_mensual_clone1 -type RW -parent-vserver fsx -parent-volume online_usr_cobol_salto_mensual -parent-snapshot online_usr_cobol_salto_mensual_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_usr_cobol_tmp_clone1 -type RW -parent-vserver fsx -parent-volume online_usr_cobol_tmp -parent-snapshot online_usr_cobol_tmp_snap1


    echo "Mapeo las LUN's de clone1"

        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_datadog_clone1/online_datadog -igroup igchampaqui -lun-id 200
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_disk2_clone1/online_disk2 -igroup igchampaqui -lun-id 201
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_disk4_clone1/online_disk4 -igroup igchampaqui -lun-id 202
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_home_clone1/online_home -igroup igchampaqui -lun-id 203
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_home_octrlm_clone1/online_home_octrlm -igroup igchampaqui -lun-id 204
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_home_srvtcp_log_clone1/online_home_srvtcp_log -igroup igchampaqui -lun-id 205
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_tn_clone1/online_tn -igroup igchampaqui -lun-id 206
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_usr_cobol_clone1/online_usr_cobol -igroup igchampaqui -lun-id 207
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_usr_cobol_salto_historico_clone1/online_usr_cobol_salto_historico -igroup igchampaqui -lun-id 208
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_usr_cobol_salto_listados_clone1/online_usr_cobol_salto_listados -igroup igchampaqui -lun-id 209
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_usr_cobol_salto_mensual_clone1/online_usr_cobol_salto_mensual -igroup igchampaqui -lun-id 210
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_usr_cobol_tmp_clone1/online_usr_cobol_tmp -igroup igchampaqui -lun-id 211

else
    sudo -u vsadmin ssh vsadmin@172.24.87.229 snap show |grep snap2
    if [ $? -ne 0 ]
    then
        echo "ELIMINO TODO DE SNAP1 Y CREAR TODO EL SNAP2"

	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_datadog_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_disk2_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_disk4_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_home_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_home_octrlm_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_home_srvtcp_log_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_tn_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_usr_cobol_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_usr_cobol_salto_historico_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_usr_cobol_salto_listados_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_usr_cobol_salto_listados_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_usr_cobol_salto_mensual_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume offline -volume online_usr_cobol_tmp_clone1

    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_datadog_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_disk2_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_disk4_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_home_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_home_octrlm_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_home_srvtcp_log_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_tn_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_usr_cobol_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_usr_cobol_salto_historico_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_usr_cobol_salto_listados_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_usr_cobol_salto_listados_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_usr_cobol_salto_mensual_clone1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 volume delete -volume online_usr_cobol_tmp_clone1

    	sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_datadog -snapshot online_datadog_snap1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_disk2 -snapshot online_disk2_snap1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_disk4 -snapshot online_disk4_snap1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_home -snapshot online_home_snap1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_home_octrlm -snapshot online_home_octrlm_snap1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_home_srvtcp_log -snapshot online_home_srvtcp_log_snap1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_tn -snapshot online_tn_snap1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_usr_cobol -snapshot online_usr_cobol_snap1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_usr_cobol_salto_historico -snapshot online_usr_cobol_salto_historico_snap1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_usr_cobol_salto_listados -snapshot online_usr_cobol_salto_listados_snap1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_usr_cobol_salto_mensual -snapshot online_usr_cobol_salto_mensual_snap1
    	sudo -u vsadmin ssh vsadmin@172.24.87.229 snap delete  -volume  online_usr_cobol_tmp -snapshot online_usr_cobol_tmp_snap1

        echo "Creo los snap2"

        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_datadog -snapshot online_datadog_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_disk2 -snapshot online_disk2_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_disk4 -snapshot online_disk4_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_home -snapshot online_home_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_home_octrlm -snapshot online_home_octrlm_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_home_srvtcp_log -snapshot online_home_srvtcp_log_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_tn -snapshot online_tn_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_usr_cobol -snapshot online_usr_cobol_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_usr_cobol_salto_historico -snapshot online_usr_cobol_salto_historico_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_usr_cobol_salto_listados -snapshot online_usr_cobol_salto_listados_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_usr_cobol_salto_mensual -snapshot online_usr_cobol_salto_mensual_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume snapshot create -volume online_usr_cobol_tmp -snapshot online_usr_cobol_tmp_snap2

        echo "Creo los clone2"

        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_datadog_clone2 -type RW -parent-vserver fsx -parent-volume online_datadog -parent-snapshot online_datadog_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_disk2_clone2 -type RW -parent-vserver fsx -parent-volume online_disk2 -parent-snapshot online_disk2_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_disk4_clone2 -type RW -parent-vserver fsx -parent-volume online_disk4 -parent-snapshot online_disk4_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_home_clone2 -type RW -parent-vserver fsx -parent-volume online_home -parent-snapshot online_home_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_home_octrlm_clone2 -type RW -parent-vserver fsx -parent-volume  online_home_octrlm -parent-snapshot online_home_octrlm_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_home_srvtcp_log_clone2 -type RW -parent-vserver fsx -parent-volume  online_home_srvtcp_log -parent-snapshot online_home_srvtcp_log_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_tn_clone2 -type RW -parent-vserver fsx -parent-volume online_tn -parent-snapshot online_tn_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_usr_cobol_clone2 -type RW -parent-vserver fsx -parent-volume online_usr_cobol  -parent-snapshot online_usr_cobol_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_usr_cobol_salto_historico_clone2 -type RW -parent-vserver fsx -parent-volume online_usr_cobol_salto_historico -parent-snapshot online_usr_cobol_salto_historico_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_usr_cobol_salto_listados_clone2 -type RW -parent-vserver fsx -parent-volume online_usr_cobol_salto_listados -parent-snapshot online_usr_cobol_salto_listados_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_usr_cobol_salto_mensual_clone2 -type RW -parent-vserver fsx -parent-volume online_usr_cobol_salto_mensual -parent-snapshot online_usr_cobol_salto_mensual_snap2
        sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone create -flexclone online_usr_cobol_tmp_clone2 -type RW -parent-vserver fsx -parent-volume online_usr_cobol_tmp -parent-snapshot online_usr_cobol_tmp_snap2

        echo "Mapeo las LUN's de clone2"   

        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_datadog_clone2/online_datadog -igroup igchampaqui -lun-id 200
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_disk2_clone2/online_disk2 -igroup igchampaqui -lun-id 201
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_disk4_clone2/online_disk4 -igroup igchampaqui -lun-id 202
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_home_clone2/online_home -igroup igchampaqui -lun-id 203
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_home_octrlm_clone2/online_home_octrlm -igroup igchampaqui -lun-id 204
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_home_srvtcp_log_clone2/online_home_srvtcp_log -igroup igchampaqui -lun-id 205
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_tn_clone2/online_tn -igroup igchampaqui -lun-id 206
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_usr_cobol_clone2/online_usr_cobol -igroup igchampaqui -lun-id 207
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_usr_cobol_salto_historico_clone2/online_usr_cobol_salto_historico -igroup igchampaqui -lun-id 208
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_usr_cobol_salto_listados_clone2/online_usr_cobol_salto_listados -igroup igchampaqui -lun-id 209
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_usr_cobol_salto_mensual_clone2/online_usr_cobol_salto_mensual -igroup igchampaqui -lun-id 210
        sudo -u vsadmin ssh vsadmin@172.24.87.229 lun map -path /vol/online_usr_cobol_tmp_clone2/online_usr_cobol_tmp -igroup igchampaqui -lun-id 211

    fi
fi

# Monto el vg en champaqui

sleep 30

#sudo -u root /home/control-m/scripts/clon-snap-mount-online.sh

#echo -e "\033[1;4;31mControl de clon snap, la fecha del archivo debe coincidir con la ejecucion"
#echo -e "\033[0m"
#sleep 40
#l -t /online/usr/cobol/salto/arch/mbase
#dia=`l -t /online/usr/cobol/salto/arch/mbase | awk '{printf $7}'`
#hoy=`date | awk '{printf $3}'`
#if [ $dia -eq $hoy ]
#then
#       echo " LA FECHA DEL ARCHIVO COINCIDE CON LA FECHA DE HOY"
#        echo " Snap actualizado exitosamente"
#        exit 0
#else
#        echo -e "\033[1;4;31mREVISAR EL SNAP"
#        echo -e "\033[0m"
#        exit 1
#fi

#CANT=`df -h |grep online |wc -l`
#df -h |grep online
#if [ $? -ne 0 ]
#then
  # echo "Error al montar los File System, informar al administrador UNIX de 8 a 18 hs"
 #  echo " Esperar a que el administrador UNIX informe para lanzar nuevamente el backup"
#   exit 1
#fi
exit 0
