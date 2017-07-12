#!/bin/sh
#
logdiscovery() {
log=` ps aux|grep -oP '(?<=DLOG_DIR=)[^ ]+' |grep -vP "^\)"  |while read line;do ls -tlr $line 2>/dev/null |tail -1 |awk -v a=$line '{print a"/"$NF}';done`
            printf '{\n'
            printf '\t"data":[\n'
               for key in $log
                   do
                          printf '\t {\n'
                          printf "\t\t\t\"{#CHECKLOG}\":\"${key}\"},\n"
               done |sed '$s/,$//'
                          printf '\t ]\n'
                          printf '}\n'

}

case "$1" in
logdiscovery)
    logdiscovery
    ;;
*)
    echo "Usage: $0 {logdiscovery}"
    ;;
esac
