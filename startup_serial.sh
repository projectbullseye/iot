
#!/bin/bash
set -x

#Clone BUllseye Repo
git clone https://github.com/projectbullseye/iot.git /home/pi/bullseye/

#Create holding folders
mkdir /home/pi/start_at_boot/
mkdir /tmp/bullseyelogs/

#Copy necessary files from git repo to folders
cp /home/pi/bullseye/iotstream_serial.service /etc/systemd/system/
cp /home/pi/bullseye/iotlaas.service /etc/systemd/system/
cp /home/pi/bullseye/iotcaas.service /etc/systemd/system/
cp /home/pi/bullseye/startiot_stream_serial.sh /home/pi/start_at_boot/
cp /home/pi/bullseye/startiot_laas.sh /home/pi/start_at_boot/
cp /home/pi/bullseye/startiot_caas.sh /home/pi/start_at_boot/
cp /home/pi/bullseye/str2str /home/pi/start_at_boot/
cp /home/pi/bullseye/rtkrcv /home/pi/start_at_boot/
cp /home/pi/bullseye/iotclient.jar /home/pi/start_at_boot/
cp /home/pi/bullseye/rtkrcv.conf /home/pi/start_at_boot/


#Mod permissions to files for execution
chmod 755 /home/pi/start_at_boot/str2str
chmod 755 /home/pi/start_at_boot/rtkrcv
chmod 755 /home/pi/start_at_boot/iotclient.jar
chmod 755 /home/pi/start_at_boot/startiot_stream_serial.sh
chmod 755 /home/pi/start_at_boot/startiot_laas.sh
chmod 755 /home/pi/start_at_boot/startiot_caas.sh
chmod 755 /home/pi/start_at_boot/rtkrcv.conf
 

#Create services to start on boot.
systemctl enable iotstream_serial
systemctl enable iotlaas
systemctl enable iotcaas

#Start services
systemctl start iotstream_serial
systemctl start iotlaas
systemctl start iotcaas

#Disable console on serial port
systemctl stop serial-getty@ttyS0.service
systemctl disable serial-getty@ttyS0.service

