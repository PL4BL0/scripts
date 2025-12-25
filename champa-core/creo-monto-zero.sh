    echo "Creo los snap1"

        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_cobol_mnl -snapshot batch_cobol_mnl_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_cobol_tmp -snapshot batch_cobol_tmp_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_disk2 -snapshot batch_disk2_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_disk4 -snapshot batch_disk4_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_historicos -snapshot batch_historicos_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_home -snapshot batch_home_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_home_bctrl -snapshot batch_home_bctrl_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_salto_hist -snapshot batch_salto_hist_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_salto_liq -snapshot batch_salto_liq_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_salto_lis -snapshot batch_salto_lis_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_salto_resu_pdf -snapshot batch_salto_resu_pdf_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_salto_vigia -snapshot batch_salto_vigia_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_tn -snapshot batch_tn_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_usr_cobol -snapshot batch_usr_cobol_snap1

    echo "Creo los clone1"

        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_cobol_mnl_clone1 -type RW -parent-vserver fsx -parent-volume batch_cobol_mnl -parent-snapshot batch_cobol_mnl_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_cobol_tmp_clone1 -type RW -parent-vserver fsx -parent-volume batch_cobol_tmp -parent-snapshot batch_cobol_tmp_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_disk2_clone1 -type RW -parent-vserver fsx -parent-volume batch_disk2 -parent-snapshot batch_disk2_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_disk4_clone1 -type RW -parent-vserver fsx -parent-volume batch_disk4 -parent-snapshot batch_disk4_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_historicos_clone1 -type RW -parent-vserver fsx -parent-volume batch_historicos -parent-snapshot batch_historicos_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_home_clone1 -type RW -parent-vserver fsx -parent-volume batch_home -parent-snapshot batch_home_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_home_bctrl_clone1 -type RW -parent-vserver fsx -parent-volume batch_home_bctrl -parent-snapshot batch_home_bctrl_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_salto_hist_clone1 -type RW -parent-vserver fsx -parent-volume batch_salto_hist -parent-snapshot batch_salto_hist_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_salto_liq_clone1 -type RW -parent-vserver fsx -parent-volume batch_salto_liq -parent-snapshot batch_salto_liq_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_salto_lis_clone1 -type RW -parent-vserver fsx -parent-volume batch_salto_lis -parent-snapshot batch_salto_lis_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_salto_resu_pdf_clone1 -type RW -parent-vserver fsx -parent-volume batch_salto_resu_pdf -parent-snapshot batch_salto_resu_pdf_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_salto_vigia_clone1 -type RW -parent-vserver fsx -parent-volume batch_salto_vigia -parent-snapshot batch_salto_vigia_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_tn_clone1 -type RW -parent-vserver fsx -parent-volume batch_tn -parent-snapshot batch_tn_snap1
        sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_usr_cobol_clone1 -type RW -parent-vserver fsx -parent-volume batch_usr_cobol -parent-snapshot batch_usr_cobol_snap1

    echo "Mapeo las LUN's de clone1"

        sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_cobol_mnl_clone1/batch_cobol_mnl -igroup igchampaqui -lun-id 300
        sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_cobol_tmp_clone1/batch_cobol_tmp -igroup igchampaqui -lun-id 301
        sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_disk2_clone1/batch_disk2 -igroup igchampaqui -lun-id 302
        sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_disk4_clone1/batch_disk4 -igroup igchampaqui -lun-id 303
        sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_historicos_clone1/batch_historicos -igroup igchampaqui -lun-id 304
        sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_home_clone1/batch_home -igroup igchampaqui -lun-id 305
        sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_home_bctrl_clone1/batch_home_bctrl -igroup igchampaqui -lun-id 306
        sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_salto_hist_clone1/batch_salto_hist -igroup igchampaqui -lun-id 307
        sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_salto_liq_clone1/batch_salto_liq -igroup igchampaqui -lun-id 308
        sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_salto_lis_clone1/batch_salto_lis -igroup igchampaqui -lun-id 309
        sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_salto_resu_pdf_clone1/batch_salto_resu_pdf -igroup igchampaqui -lun-id 310
        sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_salto_vigia_clone1/batch_salto_vigia -igroup igchampaqui -lun-id 311
        sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_tn_clone1/batch_tn -igroup igchampaqui -lun-id 312
        sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_usr_cobol_clone1/batch_usr_cobol -igroup igchampaqui -lun-id 313
