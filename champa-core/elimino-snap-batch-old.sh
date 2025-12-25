sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone show |grep clone2
if [ $? -eq 0 ]
    then    

        sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_cobol_mnl -snapshot batch_cobol_mnl_snap1
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_cobol_tmp -snapshot batch_cobol_tmp_snap1
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_disk2 -snapshot batch_disk2_snap1
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_disk4 -snapshot batch_disk4_snap1
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_historicos -snapshot batch_historicos_snap1
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_home -snapshot batch_home_snap1
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_home_bctrl -snapshot batch_home_bctrl_snap1
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_salto_hist -snapshot batch_salto_hist_snap1
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_salto_liq -snapshot batch_salto_liq_snap1
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_salto_lis -snapshot batch_salto_lis_snap1
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_salto_resu_pdf -snapshot batch_salto_resu_pdf_snap1
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_salto_vigia -snapshot batch_salto_vigia_snap1
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_tn -snapshot batch_tn_snap1
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_usr_cobol -snapshot batch_usr_cobol_snap1
fi

sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone show |grep clone1
if [ $? -eq 0 ]
then

        sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_cobol_mnl -snapshot batch_cobol_mnl_snap2
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_cobol_tmp -snapshot batch_cobol_tmp_snap2
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_disk2 -snapshot batch_disk2_snap2
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_disk4 -snapshot batch_disk4_snap2
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_historicos -snapshot batch_historicos_snap2
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_home -snapshot batch_home_snap2
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_home_bctrl -snapshot batch_home_bctrl_snap2
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_salto_hist -snapshot batch_salto_hist_snap2
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_salto_liq -snapshot batch_salto_liq_snap2
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_salto_lis -snapshot batch_salto_lis_snap2
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_salto_resu_pdf -snapshot batch_salto_resu_pdf_snap2
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_salto_vigia -snapshot batch_salto_vigia_snap2
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_tn -snapshot batch_tn_snap2
         sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume  batch_usr_cobol -snapshot batch_usr_cobol_snap2
fi
