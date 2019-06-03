#!/bin/bash
/usr/local/bin/traffic_line -s proxy.config.dump_mem_info_frequency -v 1
sleep 3
/usr/local/bin/traffic_line -s proxy.config.dump_mem_info_frequency -v 0
tail -150 /data0/log/trafficserver/traffic.out  |grep "TOTAL" |tail -1| awk '{print $1/1024/1024/1024, $3/1024/1024/1024}'
