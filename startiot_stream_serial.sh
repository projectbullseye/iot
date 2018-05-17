#!/bin/bash
STATE="error"

while [ $STATE == "error" ]
do
    #do a ping and check that its not a default message or change to grep for something else
    STATE=$(ping -q -c3 google.com > /dev/null && echo ok || echo error)

    #sleep for 2 seconds and try again
    sleep 2
 done

/home/pi/start_at_boot/str2str -in serial://ttyS0:115200:N:1#ubx -out tcpsvr://127.0.0.1:5019#rtcm3 >>/tmp/bullseyelogs/stream.log
