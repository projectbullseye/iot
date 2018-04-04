#!/bin/sh
sudo -b nohup ./str2str -in serial://ttyACM0:230400:N:1#ubx -out tcpsvr://:5019#rtcm3 >> stream.log
