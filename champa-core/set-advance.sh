SET='set -privilege advanced -confirmations off -units KB -rows 99 -showseparator "\,"'
SHOW=`volume recovery-queue show`
USER="vsadmin"
SVMSVR=172.24.87.234

case $1 in
'SVMSVR')
	ssh USER@$SVMSVR "$SET;$SHOW"
;;
*)
esac
exit
