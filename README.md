# smartisan_oscar_twrp


twrp version: 3.3.1-20190731.23


## Usage

### Original Smartisan OS

1. Install `adb` on your computer, such as `sudo apt install adb` on Debian.

3. Unplug the USB cable and turn off the phone.

3. While connecting the EDL cable to the phone, press and hold the EDL switch and the power and volume keys on the phone until the phone flashes the red indicator light and release. 

   Note: The port may not be able to read and write if you only press the EDL switch to enter 9008 mode. 

4. Run `edl-flash.sh` with root permissions.



### Not Smartisan OS

1. Install `adb` on your computer, such as `sudo apt install adb` on Debian.
2. You can start `adb` debugging and run `edl-flash.sh` directly with root permissions.



For more information, you can refer to [ https://bbs.mokeedev.com/t/topic/8343]( https://bbs.mokeedev.com/t/topic/8343)

Thank XiNGRZ