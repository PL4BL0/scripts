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
echo " se crearon los snap1 "
read p
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

echo " se crearon los clones1"
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
