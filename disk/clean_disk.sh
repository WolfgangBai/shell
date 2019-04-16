#!/bin/bash
free=`df -h |grep /data0 |awk '{print $5}'|awk -F '%' '{print $1}'`
if [ $free -gt 90 ] ; then
	find /data0/cores/ -mtime +0
	find /data0/cores/ -mtime +0 -exec rm -rf {} \;
	echo "clening finished"
else 
   echo "no need clean"
fi

