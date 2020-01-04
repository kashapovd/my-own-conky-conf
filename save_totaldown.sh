#!/bin/bash

currd=`cat /sys/class/net/wlp4s0/statistics/rx_bytes`
prevd=`cat /home/yaroslav/projects/repos/my-own-conky-conf/t_prevsn`
sumd=$(($currd + $prevd))
echo $sumd > /home/yaroslav/projects/repos/my-own-conky-conf/t_prevsn
