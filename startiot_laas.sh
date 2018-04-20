#!/bin/bash
#!/bin/sh

STATE="error"

while [ $STATE == "error" ]
do
    #do a ping and check that its not a default message or change to grep for something else
    STATE=$(ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null && echo ok || echo error)

    #sleep for 2 seconds and try again
    sleep 2
 done

java -jar /home/pi/start_at_boot/iotclient.jar 127.0.0.1 5019 https://www.mapquestapi.com/oauth/token RDtHEggbxGd3gWUx7o4sV1ZQxzXvMpYF k2PHauma2cx4llUr mapquest dev.caas.hyperlocation.io 2300 true 54.204.225.205 2400 testuser >>/tmp/bullseyelogs/iot.log

