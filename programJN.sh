#!/bin/sh

#SCLK HIGH
echo 103 > /sys/class/gpio/export 
echo in > /sys/class/gpio/gpio103/direction 
 
sleep 1
#MISO LOw
echo 106 > /sys/class/gpio/export
/unit_tests/memtool IOMUXC.SW_MUX_CTL_PAD_I2C2_SCL.MUX_MODE=0x5
echo out > /sys/class/gpio/gpio106/direction 
echo 0 > /sys/class/gpio/gpio106/value 

sleep 1

#RESET/
echo out > /sys/class/gpio/gpio33/direction
echo 0 > /sys/class/gpio/gpio33/value
echo 1 > /sys/class/gpio/gpio33/value

sleep 1

echo $1

/home/root/JennicModuleProgrammer -s /dev/ttymxc5 -v -I 38400 -P 38400 -f $1
