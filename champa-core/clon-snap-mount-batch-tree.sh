#/usr/sbin/pvscan
#/usr/sbin/vgscan
#/usr/sbin/lvscan

/usr/sbin/vgchange -an bcobolmnlvg
/usr/sbin/vgchange -an bcobolpdrvg
/usr/sbin/vgchange -an bcoboltmpvg
/usr/sbin/vgchange -an bcobolvg
/usr/sbin/vgchange -an bconversionvg
/usr/sbin/vgchange -an bdbcorevg
/usr/sbin/vgchange -an bdisk2vg
/usr/sbin/vgchange -an bdisk4vg
/usr/sbin/vgchange -an bhistoricosvg
/usr/sbin/vgchange -an bhomebctrlvg
/usr/sbin/vgchange -an bhomevg
/usr/sbin/vgchange -an bprocesosvg
/usr/sbin/vgchange -an bsaltohistvg
/usr/sbin/vgchange -an bsaltoliqvg
/usr/sbin/vgchange -an bsaltolisvg
/usr/sbin/vgchange -an bsaltoresupdfvg
/usr/sbin/vgchange -an bsaltovigiavg
/usr/sbin/vgchange -an btngaliciavg
/usr/sbin/vgchange -an btnvg

/usr/sbin/vgexport bcobolmnlvg
/usr/sbin/vgexport bcobolpdrvg
/usr/sbin/vgexport bcoboltmpvg
/usr/sbin/vgexport bcobolvg
/usr/sbin/vgexport bconversionvg
/usr/sbin/vgexport bdbcorevg
/usr/sbin/vgexport bdisk2vg
/usr/sbin/vgexport bdisk4vg
/usr/sbin/vgexport bhistoricosvg
/usr/sbin/vgexport bhomebctrlvg
/usr/sbin/vgexport bhomevg
/usr/sbin/vgexport bprocesosvg
/usr/sbin/vgexport bsaltohistvg
/usr/sbin/vgexport bsaltoliqvg
/usr/sbin/vgexport bsaltolisvg
/usr/sbin/vgexport bsaltoresupdfvg
/usr/sbin/vgexport bsaltovigiavg
/usr/sbin/vgexport btngaliciavg
/usr/sbin/vgexport btnvg

/usr/sbin/vgimport bcobolmnlvg
/usr/sbin/vgimport bcobolpdrvg
/usr/sbin/vgimport bcoboltmpvg
/usr/sbin/vgimport bcobolvg
/usr/sbin/vgimport bconversionvg
/usr/sbin/vgimport bdbcorevg
/usr/sbin/vgimport bdisk2vg
/usr/sbin/vgimport bdisk4vg
/usr/sbin/vgimport bhistoricosvg
/usr/sbin/vgimport bhomebctrlvg
/usr/sbin/vgimport bhomevg
/usr/sbin/vgimport bprocesosvg
/usr/sbin/vgimport bsaltohistvg
/usr/sbin/vgimport bsaltoliqvg
/usr/sbin/vgimport bsaltolisvg
/usr/sbin/vgimport bsaltoresupdfvg
/usr/sbin/vgimport bsaltovigiavg
/usr/sbin/vgimport btngaliciavg
/usr/sbin/vgimport btnvg

/usr/sbin/vgchange -ay bcobolmnlvg
/usr/sbin/vgchange -ay bcobolpdrvg
/usr/sbin/vgchange -ay bcoboltmpvg
/usr/sbin/vgchange -ay bcobolvg
#/usr/sbin/vgchange -ay bconversionvg
/usr/sbin/vgchange -ay bdbcorevg
/usr/sbin/vgchange -ay bdisk2vg
/usr/sbin/vgchange -ay bdisk4vg
/usr/sbin/vgchange -ay bhistoricosvg
/usr/sbin/vgchange -ay bhomebctrlvg
/usr/sbin/vgchange -ay bhomevg
/usr/sbin/vgchange -ay bprocesosvg
/usr/sbin/vgchange -ay bsaltohistvg
/usr/sbin/vgchange -ay bsaltoliqvg
/usr/sbin/vgchange -ay bsaltolisvg
/usr/sbin/vgchange -ay bsaltoresupdfvg
/usr/sbin/vgchange -ay bsaltovigiavg
/usr/sbin/vgchange -ay btngaliciavg
/usr/sbin/vgchange -ay btnvg

#xfs_repair -L /dev/mapper/autcobolvg-autcobollv

#/usr/bin/mount /dev/mapper/autcobolvg-autcobollv /autoriza/usr/cobol/

/usr/bin/mount /dev/mapper/bdisk4vg-bdisk4lv                /batch/disk4
/usr/bin/mount /dev/mapper/bhomevg-bhomelv                  /batch/home
/usr/bin/mount /dev/mapper/btnvg-btnlv                      /batch/tn
/usr/bin/mount /dev/mapper/bhistoricosvg-bhistoricoslv      /batch/historicos
#/usr/bin/mount /dev/mapper/btngaliciavg-btngalicialv        /batch/tn/galicia
/usr/bin/mount /dev/mapper/bdisk2vg-bdisk2lv                /batch/disk2
#/usr/bin/mount /dev/mapper/bconversionvg-bconversionlv      /batch/conversion
#/usr/bin/mount /dev/mapper/bdbcorevg-bdbcorelv              /batch/dbcore
#/usr/bin/mount /dev/mapper/bprocesosvg-bprocesoslv          /batch/procesos
/usr/bin/mount /dev/mapper/bhomebctrlvg-bhomebctrllv        /batch/home/bctrl-m
/usr/bin/mount /dev/mapper/bcobolvg-bcobollv                /batch/usr/cobol
#/usr/bin/mount /dev/mapper/bcobolpdrvg-bcobolpdrlv          /batch/usr/cobol/pdr
/usr/bin/mount /dev/mapper/bsaltoliqvg-bsaltoliqlv          /batch/usr/cobol/salto/liq
/usr/bin/mount /dev/mapper/bsaltovigiavg-bsaltovigialv      /batch/usr/cobol/salto/vigia
/usr/bin/mount /dev/mapper/bsaltoresupdfvg-bsaltoresupdflv  /batch/usr/cobol/salto/resumenes/pdf
/usr/bin/mount /dev/mapper/bsaltolisvg-bsaltolislv          /batch/usr/cobol/salto/listados
/usr/bin/mount /dev/mapper/bcoboltmpvg-bcoboltmplv          /batch/usr/cobol/tmp
/usr/bin/mount /dev/mapper/bsaltohistvg-bsaltohistlv        /batch/usr/cobol/salto/historico
/usr/bin/mount /dev/mapper/bcobolmnlvg-bcobolmnllv          /batch/usr/cobol/salto/mensual


echo -e "\033[1;4;31mControl de clon snap, la fecha del archivo debe coincidir con la ejecucion"
echo -e "\033[0m"
#sleep 40
l -t /batch/usr/cobol/salto/arch/mbase
dia=`l -t /batch/usr/cobol/salto/arch/mbase | awk '{printf $7}'`
hoy=`date | awk '{printf $3}'`
if [ $dia -eq $hoy ]
then
        echo " LA FECHA DEL ARCHIVO COINCIDE CON LA FECHA DE HOY"
        echo " Snap actualizado exitosamente"
        exit 0
else
        echo -e "\033[1;4;31mREVISAR EL SNAP"
        echo -e "\033[0m"
        exit 1
fi

CANT=`df -h |grep batch |wc -l`
df -h |grep batch
if [ $? -ne 0 ]
then
   echo "Error al montar los File System, informar al administrador UNIX de 8 a 18 hs"
   echo " Esperar a que el administrador UNIX informe para lanzar nuevamente el backup"
   exit 1
fi
