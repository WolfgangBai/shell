#!/bin/bash
used=`free |awk '/-/{print $3;}'`;slab=`sudo cat /proc/meminfo |grep Slab|awk '{print $4}'`;pss=`sudo grep ^Pss /proc/[1-9]*/smaps 2>/dev/null| awk '{total+=$2}; END {print total}'`;less=$((used-slab-pss));if [ $less -ge 30 ]; then echo "内存丢失: "$((less/1024/1024)) "GB  " `uname -r` `hostname`;fi
