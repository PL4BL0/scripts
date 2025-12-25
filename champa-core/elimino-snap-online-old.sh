sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone show |grep clone1
if [ $? -eq 0 ]
    then    
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
fi

sudo -u vsadmin ssh vsadmin@172.24.87.229 volume clone show |grep clone2
if [ $? -eq 0 ]
	then
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
fi
