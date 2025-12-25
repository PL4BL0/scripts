/usr/bin/umount -l /batch/disk4
/usr/bin/umount -l /batch/home
/usr/bin/umount -l /batch/tn
/usr/bin/umount -l /batch/historicos
/usr/bin/umount -l /batch/tn/galicia
/usr/bin/umount -l /batch/disk2
/usr/bin/umount -l /batch/conversion
/usr/bin/umount -l /batch/dbcore
/usr/bin/umount -l /batch/procesos
/usr/bin/umount -l /batch/home/bctrl-m
/usr/bin/umount -l /batch/usr/cobol
/usr/bin/umount -l /batch/usr/cobol/pdr
/usr/bin/umount -l /batch/usr/cobol/salto/liq
/usr/bin/umount -l /batch/usr/cobol/salto/vigia
/usr/bin/umount -l /batch/usr/cobol/salto/resumenes/pdf
/usr/bin/umount -l /batch/usr/cobol/salto/listados
/usr/bin/umount -l /batch/usr/cobol/tmp
/usr/bin/umount -l /batch/usr/cobol/salto/historico
/usr/bin/umount -l /batch/usr/cobol/salto/mensual

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
