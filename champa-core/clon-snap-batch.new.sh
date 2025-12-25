# Mathias Sierralta, 5-jun-2024
# Nota a tener en cuenta, LUN_ID debe ser el mismo para cada LUN en el mapeo
#
#LUN_ID=300 /vol/batch_cobol_mnl/batch_cobol_mnl
#LUN_ID=301 /vol/batch_cobol_tmp/batch_cobol_tmp
#LUN_ID=302 /vol/batch_disk2/batch_disk2
#LUN_ID=303 /vol/batch_disk4/batch_disk4
#LUN_ID=304 /vol/batch_historicos/batch_historicos
#LUN_ID=305 /vol/batch_home/batch_home
#LUN_ID=306 /vol/batch_home_bctrl/batch_home_bctrl
#LUN_ID=307 /vol/batch_salto_hist/batch_salto_hist
#LUN_ID=308 /vol/batch_salto_liq/batch_salto_liq
#LUN_ID=309 /vol/batch_salto_lis/batch_salto_lis
#LUN_ID=310 /vol/batch_salto_resu_pdf/batch_salto_resu_pdf
#LUN_ID=311 /vol/batch_salto_vigia/batch_salto_vigia
#LUN_ID=312 /vol/batch_tn/batch_tn
#LUN_ID=313 /vol/batch_usr_cobol/batch_usr_cobol


# Desmonto y exporto los vg en champaqui
sudo -u root /home/control-m/scripts/clon-snap-umount-batch.sh

sudo -u vsadmin ssh vsadmin@172.24.87.236 snap show |grep snap1
if [ $? -ne 0 ]
then
    echo "ELIMINO TODO DE SNAP2 Y CREAR TODO EL SNAP1"

    #sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume autoriza_usr_cobol_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_cobol_mnl_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_cobol_tmp_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_disk2_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_disk4_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_historicos_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_home_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_home_bctrl_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_salto_hist_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_salto_liq_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_salto_lis_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_salto_resu_pdf_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_salto_vigia_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_tn_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_usr_cobol_clone2

    #sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume autoriza_usr_cobol_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_cobol_mnl_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_cobol_tmp_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_disk2_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_disk4_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_historicos_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_home_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_home_bctrl_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_salto_hist_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_salto_liq_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_salto_lis_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_salto_resu_pdf_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_salto_vigia_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_tn_clone2
    sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_usr_cobol_clone2

    #sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume autoriza_usr_cobol -snapshot autoriza_usr_cobol_snap2
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

else
    sudo -u vsadmin ssh vsadmin@172.24.87.236 snap show |grep snap2
    if [ $? -ne 0 ]
    then
        echo "ELIMINO TODO DE SNAP1 Y CREAR TODO EL SNAP2"

        #sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume autoriza_usr_cobol_clone1 
	 sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_cobol_mnl_clone1
	 sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_cobol_tmp_clone1
	 sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_disk2_clone1
	 sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_disk4_clone1
	 sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_historicos_clone1
	 sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_home_clone1
	 sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_home_bctrl_clone1
	 sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_salto_hist_clone1
	 sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_salto_liq_clone1
	 sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_salto_lis_clone1
	 sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_salto_resu_pdf_clone1
	 sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_salto_vigia_clone1
	 sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_tn_clone1
	 sudo -u vsadmin ssh vsadmin@172.24.87.236 volume offline -volume batch_usr_cobol_clone1

        #sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume autoriza_usr_cobol_clone1
	sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_cobol_mnl_clone1
	sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_cobol_tmp_clone1
	sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_disk2_clone1
	sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_disk4_clone1
	sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_historicos_clone1
	sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_home_clone1
	sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_home_bctrl_clone1
	sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_salto_hist_clone1
	sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_salto_liq_clone1
	sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_salto_lis_clone1
	sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_salto_resu_pdf_clone1
	sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_salto_vigia_clone1
	sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_tn_clone1
	sudo -u vsadmin ssh vsadmin@172.24.87.236 volume delete -volume batch_usr_cobol_clone1

        #sudo -u vsadmin ssh vsadmin@172.24.87.236 snap delete  -volume autoriza_usr_cobol -snapshot autoriza_usr_cobol_snap1
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

        echo "Creo los snap2"

            #sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume autoriza_usr_cobol -snapshot autoriza_usr_cobol_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_cobol_mnl -snapshot batch_cobol_mnl_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_cobol_tmp -snapshot batch_cobol_tmp_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_disk2 -snapshot batch_disk2_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_disk4 -snapshot batch_disk4_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_historicos -snapshot batch_historicos_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_home -snapshot batch_home_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_home_bctrl -snapshot batch_home_bctrl_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_salto_hist -snapshot batch_salto_hist_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_salto_liq -snapshot batch_salto_liq_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_salto_lis -snapshot batch_salto_lis_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_salto_resu_pdf -snapshot batch_salto_resu_pdf_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_salto_vigia -snapshot batch_salto_vigia_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_tn -snapshot batch_tn_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume snapshot create -volume  batch_usr_cobol -snapshot batch_usr_cobol_snap2

         echo "Creo los clone2"

            #sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone autoriza_usr_cobol_clone2 -type RW -parent-vserver fsx -parent-volume autoriza_usr_cobol -parent-snapshot autoriza_usr_cobol_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_cobol_mnl_clone2 -type RW -parent-vserver fsx -parent-volume batch_cobol_mnl -parent-snapshot batch_cobol_mnl_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_cobol_tmp_clone2 -type RW -parent-vserver fsx -parent-volume batch_cobol_tmp -parent-snapshot batch_cobol_tmp_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_disk2_clone2 -type RW -parent-vserver fsx -parent-volume batch_disk2 -parent-snapshot batch_disk2_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_disk4_clone2 -type RW -parent-vserver fsx -parent-volume batch_disk4 -parent-snapshot batch_disk4_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_historicos_clone2 -type RW -parent-vserver fsx -parent-volume batch_historicos -parent-snapshot batch_historicos_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_home_clone2 -type RW -parent-vserver fsx -parent-volume batch_home -parent-snapshot batch_home_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_home_bctrl_clone2 -type RW -parent-vserver fsx -parent-volume batch_home_bctrl -parent-snapshot batch_home_bctrl_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_salto_hist_clone2 -type RW -parent-vserver fsx -parent-volume batch_salto_hist -parent-snapshot batch_salto_hist_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_salto_liq_clone2 -type RW -parent-vserver fsx -parent-volume batch_salto_liq -parent-snapshot batch_salto_liq_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_salto_lis_clone2 -type RW -parent-vserver fsx -parent-volume batch_salto_lis -parent-snapshot batch_salto_lis_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_salto_resu_pdf_clone2 -type RW -parent-vserver fsx -parent-volume batch_salto_resu_pdf -parent-snapshot batch_salto_resu_pdf_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_salto_vigia_clone2 -type RW -parent-vserver fsx -parent-volume batch_salto_vigia -parent-snapshot batch_salto_vigia_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_tn_clone2 -type RW -parent-vserver fsx -parent-volume batch_tn -parent-snapshot batch_tn_snap2
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 volume clone create -flexclone batch_usr_cobol_clone2 -type RW -parent-vserver fsx -parent-volume batch_usr_cobol -parent-snapshot batch_usr_cobol_snap2

         echo "Mapeo las LUN's de clone2"   

            #sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path /vol/autoriza_usr_cobol_clone2/autoriza_usr_cobol -igroup igchampaqui -lun-id 100
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_cobol_mnl_clone2/batch_cobol_mnl -igroup igchampaqui -lun-id 300
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_cobol_tmp_clone2/batch_cobol_tmp -igroup igchampaqui -lun-id 301
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_disk2_clone2/batch_disk2 -igroup igchampaqui -lun-id 302
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_disk4_clone2/batch_disk4 -igroup igchampaqui -lun-id 303
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_historicos_clone2/batch_historicos -igroup igchampaqui -lun-id 304
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_home_clone2/batch_home -igroup igchampaqui -lun-id 305
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_home_bctrl_clone2/batch_home_bctrl -igroup igchampaqui -lun-id 306
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_salto_hist_clone2/batch_salto_hist -igroup igchampaqui -lun-id 307
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_salto_liq_clone2/batch_salto_liq -igroup igchampaqui -lun-id 308
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_salto_lis_clone2/batch_salto_lis -igroup igchampaqui -lun-id 309
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_salto_resu_pdf_clone2/batch_salto_resu_pdf -igroup igchampaqui -lun-id 310
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_salto_vigia_clone2/batch_salto_vigia -igroup igchampaqui -lun-id 311
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_tn_clone2/batch_tn -igroup igchampaqui -lun-id 312
	     sudo -u vsadmin ssh vsadmin@172.24.87.236 lun map -path  /vol/batch_usr_cobol_clone2/batch_usr_cobol -igroup igchampaqui -lun-id 313

    fi
fi

# Monto el vg en champaqui
#sudo -u root /usr/sbin/reboot
sudo -u root /usr/sbin/shutdown -r now
#sleep 60

#sudo -u root /home/control-m/scripts/clon-snap-mount-batch.sh

#echo -e "\033[1;4;31mControl de clon snap, la fecha del archivo debe coincidir con la ejecucion"
#echo -e "\033[0m"
#sleep 40
#l -t /batch/usr/cobol/salto/arch/mbase
#dia=`l -t /batch/usr/cobol/salto/arch/mbase | awk '{printf $7}'`
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

#CANT=`df -h |grep batch |wc -l`
#df -h |grep batch
#if [ $? -ne 0 ]
#then
#   echo "Error al montar los File System, informar al administrador UNIX de 8 a 18 hs"
#   echo " Esperar a que el administrador UNIX informe para lanzar nuevamente el backup"
#   exit 1
#fi
exit 0
