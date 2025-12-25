#/usr/sbin/pvscan
#/usr/sbin/vgscan
#/usr/sbin/lvscan

/usr/sbin/vgchange -an ocobolmnlvg
/usr/sbin/vgchange -an ocoboltmpvg
/usr/sbin/vgchange -an ocobolvg
/usr/sbin/vgchange -an odatadogvg
/usr/sbin/vgchange -an odisk2vg
/usr/sbin/vgchange -an odisk4vg
/usr/sbin/vgchange -an ohomectrlvg
/usr/sbin/vgchange -an ohomesrvtcplogvg
/usr/sbin/vgchange -an ohomevg
/usr/sbin/vgchange -an osaltohistvg
/usr/sbin/vgchange -an osaltolisvg
/usr/sbin/vgchange -an otnvg

/usr/sbin/vgexport ocobolmnlvg
/usr/sbin/vgexport ocoboltmpvg
/usr/sbin/vgexport ocobolvg
/usr/sbin/vgexport odatadogvg
/usr/sbin/vgexport odisk2vg
/usr/sbin/vgexport odisk4vg
/usr/sbin/vgexport ohomectrlvg
/usr/sbin/vgexport ohomesrvtcplogvg
/usr/sbin/vgexport ohomevg
/usr/sbin/vgexport osaltohistvg
/usr/sbin/vgexport osaltolisvg
/usr/sbin/vgexport otnvg

/usr/sbin/vgimport ocobolmnlvg
/usr/sbin/vgimport ocoboltmpvg
/usr/sbin/vgimport ocobolvg
/usr/sbin/vgimport odatadogvg
/usr/sbin/vgimport odisk2vg
/usr/sbin/vgimport odisk4vg
/usr/sbin/vgimport ohomectrlvg
/usr/sbin/vgimport ohomesrvtcplogvg
/usr/sbin/vgimport ohomevg
/usr/sbin/vgimport osaltohistvg
/usr/sbin/vgimport osaltolisvg
/usr/sbin/vgimport otnvg

/usr/sbin/vgchange -ay ocobolmnlvg
/usr/sbin/vgchange -ay ocoboltmpvg
/usr/sbin/vgchange -ay ocobolvg
/usr/sbin/vgchange -ay odatadogvg
/usr/sbin/vgchange -ay odisk2vg
/usr/sbin/vgchange -ay odisk4vg
/usr/sbin/vgchange -ay ohomectrlvg
/usr/sbin/vgchange -ay ohomesrvtcplogvg
/usr/sbin/vgchange -ay ohomevg
/usr/sbin/vgchange -ay osaltohistvg
/usr/sbin/vgchange -ay osaltolisvg
/usr/sbin/vgchange -ay otnvg

#xfs_repair -L /dev/mapper/autcobolvg-autcobollv

/usr/bin/mount /dev/mapper/odisk2vg-odisk2lv /online/disk2
/usr/bin/mount /dev/mapper/odisk4vg-odisk4lv /online/disk4
/usr/bin/mount /dev/mapper/otnvg-otnlv /online/tn
/usr/bin/mount /dev/mapper/ocobolvg-ocobollv /online/usr/cobol
/usr/bin/mount /dev/mapper/osaltolisvg-osaltolislv /online/usr/cobol/salto/listados
/usr/bin/mount /dev/mapper/osaltohistvg-osaltohistlv /online/usr/cobol/salto/historico
/usr/bin/mount /dev/mapper/ocobolmnlvg-ocobolmnllv /online/usr/cobol/salto/mensual
/usr/bin/mount /dev/mapper/odatadogvg-odatadoglv /datadog
/usr/bin/mount /dev/mapper/ocoboltmpvg-ocoboltmplv /online/usr/cobol/tmp
/usr/bin/mount /dev/mapper/ohomevg-ohomelv /online/home
/usr/bin/mount /dev/mapper/ohomectrlvg-ohomectrllv /online/home/octrl-m
/usr/bin/mount /dev/mapper/ohomesrvtcplogvg-ohomesrvtcploglv /online/home/srvtcp/log

