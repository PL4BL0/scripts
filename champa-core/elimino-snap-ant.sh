DIA_NUM=$(date +%w)

echo " Elimino los snap "

if [ $DIA_NUM -eq 0 -o $DIA_NUM -eq 2 -o $DIA_NUM -eq 4 -o $DIA_NUM -eq 6 ]
then

    sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_usr_cobol -snapshot autoriza_usr_cobol_snap1
    sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_home -snapshot autoriza_home_snap1
    sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_home_octrlm -snapshot autoriza_home_octrlm_snap1
    sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_usr_cobol_cod_aut_datadog -snapshot autoriza_usr_cobol_cod_aut_datadog_snap1
    sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_usr_cobol_cod_aut_jpos -snapshot autoriza_usr_cobol_cod_aut_jpos_snap1
    sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_usr_cobol_tmp -snapshot autoriza_usr_cobol_tmp_snap1

else
    if [ $DIA_NUM -eq 1 -o $DIA_NUM -eq 3 -o $DIA_NUM -eq 5 ]
    then

    sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_usr_cobol -snapshot autoriza_usr_cobol_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_home -snapshot autoriza_home_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_home_octrlm -snapshot autoriza_home_octrlm_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_usr_cobol_cod_aut_datadog -snapshot autoriza_usr_cobol_cod_aut_datadog_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_usr_cobol_cod_aut_jpos -snapshot autoriza_usr_cobol_cod_aut_jpos_snap2
    sudo -u vsadmin ssh vsadmin@172.24.87.234 snap delete  -volume autoriza_usr_cobol_tmp -snapshot autoriza_usr_cobol_tmp_snap2
    fi
fi
