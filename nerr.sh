N_time=`date "+%F %H:%M:%S" -d '-1 minute'`

tail -10000 $1 |grep "$N_time" |grep -ic "ERROR"
