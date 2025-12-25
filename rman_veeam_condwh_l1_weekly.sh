# Ejecucion del backup incremental level 1

export ORACLE_HOME=/orabin/oracle/12.2.0/db/product/dbhome
export ORACLE_SID=condwh1
export PATH=$ORACLE_HOME/bin:$PATH
export BACKUP_PATH=/orabin/oracle/admin/scripts_bkp

fectag=`date +%d%m%Y_%HH%M`
##TAG=incr_condwh_"$fectag";
##cuando se usa keep until el incremental level 1 debe tener el mismo TAG que el full level 0
TAG=$(rman target / <<EOF | grep 'FULL_' | tail -n 1 | awk '{print $10}'
LIST BACKUP OF DATABASE SUMMARY;
EXIT;
EOF
)

$ORACLE_HOME/bin/rman LOG=$BACKUP_PATH/log/rman_condwh_l1_weekly_"$fectag".log <<EOF
connect target /
run {
allocate channel ch1 type sbt_tape parms 'SBT_LIBRARY=/opt/veeam/VeeamPluginforOracleRMAN/libOracleRMANPlugin.so' FORMAT '3fc90592-511f-4200-aedc-48597064f4c8/RMAN_incr_%I_%d_%T_%U.vab';
allocate channel ch2 type sbt_tape parms 'SBT_LIBRARY=/opt/veeam/VeeamPluginforOracleRMAN/libOracleRMANPlugin.so' FORMAT '3fc90592-511f-4200-aedc-48597064f4c8/RMAN_incr_%I_%d_%T_%U.vab';
allocate channel ch3 type sbt_tape parms 'SBT_LIBRARY=/opt/veeam/VeeamPluginforOracleRMAN/libOracleRMANPlugin.so' FORMAT '3fc90592-511f-4200-aedc-48597064f4c8/RMAN_incr_%I_%d_%T_%U.vab';
allocate channel ch4 type sbt_tape parms 'SBT_LIBRARY=/opt/veeam/VeeamPluginforOracleRMAN/libOracleRMANPlugin.so' FORMAT '3fc90592-511f-4200-aedc-48597064f4c8/RMAN_incr_%I_%d_%T_%U.vab';
backup as compressed backupset incremental level 1 section size 20g database TAG=$TAG include current controlfile keep until time 'SYSDATE+7';
backup as compressed backupset archivelog all not backed up delete input TAG=$TAG keep until time 'SYSDATE+7';
release channel ch1;
release channel ch2;
release channel ch3;
release channel ch4;
delete noprompt obsolete;
}
list backup of spfile tag=$TAG;
list backup of controlfile tag=$TAG;
EOF
exit

