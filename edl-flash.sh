#!/bin/sh
# Make sure you phone can "adb reboot edl" to edl mode
# or enter edl mode by yourself.

adb devices |  sed -n 2p | grep device > /dev/null
if [ $? = 0 ]; then
    adb reboot edl
    sleep 2
fi

loop_time=0
lsusb | grep 'QDL mode'
while [ $? != 0 ]
do
    echo "wait for COM(9008)"
    sleep 2
    loop_time=$(expr $loop_time + 1)
    if [ $loop_time = 10 ]; then
        echo "###################################"
        echo "######   No Device Found!!   ######"
        echo "###################################"
        exit 1
    fi
    lsusb | grep 'QDL mode'
done

port_num=$(ls /sys/bus/usb-serial/drivers/qcserial/ | grep tty)

script_dir=`dirname "$0"`

$script_dir/apps/QSaharaServer -p /dev/$port_num -s 13:prog_emmc_firehose_8953_ddr.mbn

$script_dir/apps/fh_loader --port=/dev/$port_num --noprompt --showpercentagecomplete --zlpawarehost=0 --sendxml=rawprogram_unsparse.xml --memoryname=eMMC

# $script_dir/apps/fh_loader --port=/dev/$port_num --noprompt --showpercentagecomplete --zlpawarehost=0 --sendxml=patch0.xml --memoryname=eMMC

$script_dir/apps/fh_loader --port=/dev/$port_num --noprompt --showpercentagecomplete --zlpawarehost=0 --memoryname=eMMC --setactivepartition=0 --reset

echo "###################################"
echo "######  EDL Flash Done!!!  ########"
echo "###################################"
