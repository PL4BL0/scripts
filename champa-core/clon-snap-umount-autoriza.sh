/usr/bin/umount -l  /autoriza/home/octrl-m
/usr/bin/umount -l  /autoriza/home/
/usr/bin/umount -l  /autoriza/usr/cobol/tmp
/usr/bin/umount -l  /autoriza/usr/cobol/cod_aut/jpos
/usr/bin/umount -l  /autoriza/usr/cobol/cod_aut/datadog
/usr/bin/umount -l  /autoriza/usr/cobol/


/usr/sbin/vgchange -an autcoboltmpvg
/usr/sbin/vgchange -an autcobolvg
/usr/sbin/vgchange -an autddvg
/usr/sbin/vgchange -an authomectrlvg
/usr/sbin/vgchange -an authomevg
/usr/sbin/vgchange -an autjposvg

/usr/sbin/vgexport autcoboltmpvg
/usr/sbin/vgexport autcobolvg
/usr/sbin/vgexport autddvg
/usr/sbin/vgexport authomectrlvg
/usr/sbin/vgexport authomevg
/usr/sbin/vgexport autjposvg
