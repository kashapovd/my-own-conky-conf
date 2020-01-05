#!/bin/bash

## take total download in bytes for current session
currd=`cat /sys/class/net/wlp4s0/statistics/rx_bytes`
## take total download in bytes for previos session
dir=`dirname $0`
prevd=`cat $dir/t_prevsn`
totald=$((($currd+$prevd)/1048576)) 
if [ $(echo "$totald >= 2^20" | bc) -eq 1 ]; then
    totald=$(echo "scale=1;$totald / 2^20" | bc)' T' ## in terabyte
elif [ $(echo "$totald >= 2^10" | bc) -eq 1 ]; then
    totald=$(echo "scale=1;$totald / 2^10" | bc)' G' ## in gigabyte
else
    totald=$(echo $totald)' M' ## in megabyte
fi
echo $totald
