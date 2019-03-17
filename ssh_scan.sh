#!/bin/bash

#export LC_ALL=UTC
SCANNER=$( tm=$(date -d '10 minutes ago' +"%h %e %H") && \
	awk -v tm="$tm" '$0 ~ tm && /Failed password/ && /ssh2/ { print $(NF-3) ; } ' /var/log/auth.log \
	| sort \
	| uniq -c \
	| awk '{print $1"="$2;}' \
	)
for i in $SCANNER
do 
	IP=`echo $i|awk -F= '{print $2}'`
	NUM=`echo $i|awk -F= '{print $1}'`

	if [ $NUM -gt 8 ]
	then
		iptables -vnL | grep DROP | grep $IP &>/dev/null
		[ $? -eq 0 ] || /sbin/iptables -I INPUT -s $IP -j DROP
		echo "`date` $IP($NUM)" >> /var/log/scanner.log
		#echo "`date` $IP($NUM)"
	fi
done
