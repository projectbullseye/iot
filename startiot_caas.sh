#!/bin/sh
STATE="error"

while [ $STATE == "error" ]
do
    #do a ping and check that its not a default message or change to grep for something else
    STATE=$(ping -q -c3 google.com > /dev/null && echo ok || echo error)

    #sleep for 2 seconds and try again
    sleep 2
 done

/home/pi/start_at_boot/rtkrcv -s -p 6060 -o /home/pi/start_at_boot/rtkrcv.conf -t 5
