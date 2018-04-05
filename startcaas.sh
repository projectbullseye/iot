#!/bin/sh
#/etc/init.d/startcaas.sh
### BEGIN INIT INFO
# Provides:          startcaas.sh
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start daemon at boot time
# Description:       Enable service provided by daemon.
### END INIT INFO
/home/pi/iot-master/str2str -in serial://ttyACM0:230400:N:1#ubx -out tcpsvr://:5019#rtcm3>> /home/pi/stream.log &
/home/pi/RTKLIB-master/app/rtkrcv/gcc/rtkrcv -s -p 6060 -o rtkrcv.conf -t 5 &
java -jar iotclient.jar 127.0.0.1 5019 https://www.mapquestapi.com/oauth/token RDtHEggbxGd3gWUx7o4sV1ZQxzXvMpYF k2PHauma2cx4llUr mapquest 71.115.19.60 2300 true 71.115.19.60 2400 PP >> /home/pi/iot.log &

