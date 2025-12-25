/usr/bin/umount -l /online/disk2
/usr/bin/umount -l /online/disk4
/usr/bin/umount -l /online/tn
/usr/bin/umount -l /datadog
/usr/bin/umount -l /online/usr/cobol/salto/listados
/usr/bin/umount -l /online/usr/cobol/salto/historico
/usr/bin/umount -l /online/usr/cobol/salto/mensual
/usr/bin/umount -l /online/usr/cobol/tmp
/usr/bin/umount -l /online/usr/cobol
/usr/bin/umount -l /online/home/octrl-m
/usr/bin/umount -l /online/home/srvtcp/log
/usr/bin/umount -l /online/home

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
