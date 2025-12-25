online_datadog
online_disk2
online_disk4
online_home
online_home_octrlm
online_home_srvtcp_log
online_respaldo_cobol_borrados
online_usr_cobol
online_usr_cobol_salto_historico
online_usr_cobol_salto_listados
online_usr_cobol_salto_mensual
online_usr_cobol_tmp

snapmirror create -source-path fsx_virginia:online_tn -destination-path fsx:online_tn_ohio -vserver fsx -throttle unlimited -type XDP -policy MirrorAllSnapshots -schedule hourly
snapmirror create -source-path fsx_virginia:online_datadog -destination-path fsx:online_datadog_ohio -vserver fsx -throttle unlimited -type XDP -policy MirrorAllSnapshots -schedule hourly
snapmirror create -source-path fsx_virginia:online_disk2 -destination-path fsx:online_disk2_ohio -vserver fsx -throttle unlimited -type XDP -policy MirrorAllSnapshots -schedule hourly
snapmirror create -source-path fsx_virginia:online_disk4 -destination-path fsx:online_disk4_ohio -vserver fsx -throttle unlimited -type XDP -policy MirrorAllSnapshots -schedule hourly
snapmirror create -source-path fsx_virginia:online_home -destination-path fsx:online_home_ohio -vserver fsx -throttle unlimited -type XDP -policy MirrorAllSnapshots -schedule hourly
snapmirror create -source-path fsx_virginia:online_home_octrlm -destination-path fsx:online_home_octrlm_ohio -vserver fsx -throttle unlimited -type XDP -policy MirrorAllSnapshots -schedule hourly
snapmirror create -source-path fsx_virginia:online_home_srvtcp_log -destination-path fsx:online_home_srvtcp_log_ohio -vserver fsx -throttle unlimited -type XDP -policy MirrorAllSnapshots -schedule hourly
snapmirror create -source-path fsx_virginia:online_usr_cobol -destination-path fsx:online_usr_cobol_ohio -vserver fsx -throttle unlimited -type XDP -policy MirrorAllSnapshots -schedule hourly
snapmirror create -source-path fsx_virginia:online_usr_cobol_salto_historico -destination-path fsx:online_usr_cobol_salto_historico_ohio -vserver fsx -throttle unlimited -type XDP -policy MirrorAllSnapshots -schedule hourly
snapmirror create -source-path fsx_virginia:online_usr_cobol_salto_listados -destination-path fsx:online_usr_cobol_salto_listados_ohio  -vserver fsx -throttle unlimited -type XDP -policy MirrorAllSnapshots -schedule hourly
snapmirror create -source-path fsx_virginia:online_usr_cobol_salto_mensual -destination-path fsx:online_usr_cobol_salto_mensual_ohio -vserver fsx -throttle unlimited -type XDP -policy MirrorAllSnapshots -schedule hourly
snapmirror create -source-path fsx_virginia:online_usr_cobol_tmp -destination-path fsx:online_usr_cobol_tmp_ohio -vserver fsx -throttle unlimited -type XDP -policy MirrorAllSnapshots -schedule hourly
