#/usr/sbin/pvscan
#/usr/sbin/vgscan
#/usr/sbin/lvscan

/usr/sbin/vgchange -an autcobolvg
/usr/sbin/vgchange -an authomevg
/usr/sbin/vgchange -an authomectrlvg
/usr/sbin/vgchange -an autddvg
/usr/sbin/vgchange -an autjposvg
/usr/sbin/vgchange -an autcoboltmpvg

/usr/sbin/vgexport autcobolvg
/usr/sbin/vgexport authomevg
/usr/sbin/vgexport authomectrlvg
/usr/sbin/vgexport autddvg
/usr/sbin/vgexport autjposvg
/usr/sbin/vgexport autcoboltmpvg

/usr/sbin/vgimport autcobolvg
/usr/sbin/vgimport authomevg
/usr/sbin/vgimport authomectrlvg
/usr/sbin/vgimport autddvg
/usr/sbin/vgimport autjposvg
/usr/sbin/vgimport autcoboltmpvg

/usr/sbin/vgchange -ay autcobolvg
/usr/sbin/vgchange -ay authomevg
/usr/sbin/vgchange -ay authomectrlvg
/usr/sbin/vgchange -ay autddvg
/usr/sbin/vgchange -ay autjposvg
/usr/sbin/vgchange -ay autcoboltmpvg

xfs_repair -L /dev/mapper/autcobolvg-autcobollv

/usr/bin/mount /dev/mapper/autcobolvg-autcobollv /autoriza/usr/cobol/
/usr/bin/mount /dev/mapper/authomevg-authomelv /autoriza/home
/usr/bin/mount /dev/mapper/authomectrlvg-authomectrllv /autoriza/home/octrl-m
/usr/bin/mount /dev/mapper/autjposvg-autjposlv /autoriza/usr/cobol/cod_aut/jpos
/usr/bin/mount /dev/mapper/autddvg-autddlv /autoriza/usr/cobol/cod_aut/datadog
/usr/bin/mount /dev/mapper/autcoboltmpvg-autcoboltmplv /autoriza/usr/cobol/tmp

