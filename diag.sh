echo "$1"
echo "Welcome to @_orangera1n's diag_script"
oscheck=$(uname)

if [ "$1" = 'iPad4' ]; then
    ./"$oscheck"/ipwnder -p &>/dev/null &
    echo "Pwning device!"
    ./$oscheck/ipwnder -f bootchian/iPad4/iBSS.img3 &>/dev/null &
    echo "Sending iBSS!"
    ./$oscheck/irecovery -f bootchain/ipad4/iBEC.img3 &>/dev/null &
    echo "Sending iBEC!"
    ./$oscheck/irecovery -f bootchain/ipad4/diag.img3 &>/dev/null &
    echo "Sending Diags!"
    ./$oscheck/irecovery -c go &>/dev/null &
    echo "Loading Diags!"
    echo "If the screen is purple now, you may use your DCSD cable to connect with MagicCFG, or use nanokdp to access the command line at usbserial-XXXXXX"
    echo "You can use sn to write a new serial number, make sure its valid"
elif [ "$1" = 'iPad2' ] || [  "$1" = 'iPad2,4' ] || [ "$1" = 'iPad3' ] || [ "$1" = 'iPadMini' ]; then
    echo 'USE AN ARDUINO TO PUT YOUR DEVICE INTO PWNED DFU MODE'
    ./$oscheck/ipwnder -f ./bootchain/"$1"/iBSS.img3
    echo "Sending iBSS!"
    ./$oscheck/irecovery -f ./bootchain/"$1"/iBEC.img3
    echo "Sending iBEC!"
    ./$oscheck/irecovery -f ./bootchain/"$1"/diag.img3
    echo "Sending Diags!"
    ./$oscheck/irecovery -c go
    echo "Loading Diags!"
    echo "If the screen is purple now, you may use your DCSD cable to connect with MagicCFG, or use nanokdp to access the command line at usbserial-XXXXXX"
    echo "You can use sn to write a new serial number in the command line, make sure its valid"
elif [ "$1" = 'iPhone6' ] || [ "$1" = 'iPhone6P' ] || [ "$1" = 'iPadAir2' ] || [ "$1" = 'iPhone6S' ] || [ "$1" = 'iPhone6St' ] || [ "$1" = 'iPad5s' ] || [ "$1" = 'iPadMini4' ]; then
    echo "Pwning Device"
    ./$oscheck/gaster pwn >/dev/null
    ./$oscheck/gaster reset >/dev/null
    echo "Sending iBSS"
    ./$oscheck/irecovery -f bootchain/"$1"/iBSS.img4
    echo "Sending iBEC"
    ./$oscheck/irecovery -f bootchain/"$1"/iBEC.img4
    echo "Sending Diags"
    ./$oscheck/irecovery -f bootchain/"$1"/diag.img4
    echo "Booting Diags"
    ./$oscheck/irecovery -c go
    echo "If the screen is a solid color now, you may use your DCSD cable to connect with MagicCFG, or use nanokdp to access the command line at usbserial-XXXXXX"
elif [ "$1" = 'iPhoneX' ]||[ "$1" = 'iPhone8P' ]||[ "$1" = 'iPhone8' ]||[ "$1" = 'iPad7' ]||[ "$1" = 'iPhone7P' ]||[ "$1" = 'iPhone7' ]; then
    echo "Pwning Device"
    ./$oscheck/gaster pwn >/dev/null
    ./$oscheck/gaster reset >/dev/null
    echo "Sending iBSS"
    ./$oscheck/irecovery -f bootchain/"$1"/iBSS.img4
    echo "enabling USBSerial"
    ./$oscheck/irecovery -c "setenv boot-args usbserial=enabled"
    ./$oscheck/irecovery -c "saveenv"
    echo "Sending Diags"
    ./$oscheck/irecovery -f bootchain/"$1"/diag.img4
    echo "Booting Diags"
    ./$oscheck/irecovery -c go
    echo "If the screen is a solid color now, you may use your DCSD cable to connect with MagicCFG, or use nanokdp to access the command line at usbserial-XXXXXX, since usbserial was enabled here, the device is also avaible at usbmodem-XXXXX"
elif [ "$1" = 'iPadPro105' ]; then
    echo "Pwning Device"
    ./$oscheck/gaster_A10X pwn >/dev/null
    ./$oscheck/gaster reset >/dev/null
    echo "Sending iBSS"
    ./$oscheck/irecovery -f bootchain/"$1"/iBSS.img4
    echo "Sending Diags"
    ./$oscheck/irecovery -f bootchain/"$1"/diag.img4
    echo "Booting Diags"
    ./$oscheck/irecovery -c go
    echo "If the screen is a solid color now, you may use your DCSD cable to connect with MagicCFG, or use nanokdp to access the command line at usbserial-XXXXXX"
else
    echo "Device Unsupported!" 1>&2
fi
