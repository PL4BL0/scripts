# luego de la ejecucion de snap desde controlm se debe eliminar la retencion de las 12hs de los volumenes 
# que se eliminaron del dia anterior y luego ejecutar el script elimino-snap-ant.sh, los pasos y cmd serian

1 - ejecucion por controlm /home/control-m/scripts/clon-snap-autoriza.sh 
2 - elimnar la retencion en ontap de los volumenes de clonado anteriores
	ssh fsxadmin@intercluster.fs-0d992867cb0825b74.fsx.us-east-1.amazonaws.com / Ontap.2024!
	set advance (confirmar)
	volume recovery-queue  show
	volume recovery-queue  purge-all

3 - ejecutar el script /home/control-m/scripts/elimino-snap-ant.sh

TODO SE DEBE REALIZAR CON EL USUARIO control-m
