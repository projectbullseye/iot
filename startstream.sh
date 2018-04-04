#!/bin/sh
nohup sudo ./str2str -in serial://ttyACM0:230400:8:N:1#ubx -out tcpsvr://:5019#rtcm3 >> stream.log
