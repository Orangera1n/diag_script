echo "$1"
echo "Welcome to @_orangera1n's diag_script"
if [ "$1" = 'iPad4' ]; then
    ./ipwnder -p &>/dev/null &
    echo "Pwning device!"
    ./ipwnder -f bootchian/iPad4/iBSS.img3 &>/dev/null &
    echo "Sending iBSS!"
    ./irecovery -f bootchain/ipad4/iBEC.img3 &>/dev/null &
    echo "Sending iBEC!"
    ./irecovery -f bootchain/ipad4/diag.img3 &>/dev/null &
    echo "Sending Diags!"
    ./irecovery -c go &>/dev/null &
    echo "Loading Diags!"
    echo "If the screen is purple now, you may use your DCSD cable to connect with MagicCFG, or use nanokdp to access the command line at usbserial-XXXXXX"
    echo "You can use sn to write a new serial number, make sure its valid"
elif [ "$1" = 'iPad2' ] || [  "$1" = 'iPad2,4' ] || [ "$1" = 'iPad3' ] || [ "$1" = 'iPadMini' ]; then
    echo 'USE AN ARDUINO TO PUT YOUR DEVICE INTO PWNED DFU MODE'
    ./ipwnder -f ./bootchain/"$1"/iBSS.img3
    echo "Sending iBSS!"
    ./irecovery -f ./bootchain/"$1"/iBEC.img3
    echo "Sending iBEC!"
    ./irecovery -f ./bootchain/"$1"/diag.img3
    echo "Sending Diags!"
    ./irecovery -c go
    echo "Loading Diags!"
    echo "If the screen is purple now, you may use your DCSD cable to connect with MagicCFG, or use nanokdp to access the command line at usbserial-XXXXXX"
    echo "You can use sn to write a new serial number in the command line, make sure its valid"
elif [ "$1" = 'iPhone6' ] || [ "$1" = 'iPhone6S' ] || [ "$1" = 'iPad5s' ] || [ "$1" = 'iPadMini4' ]; then
    echo "Pwning Device"
    ./gaster pwn >/dev/null
    ./gaster reset >/dev/null
    echo "Sending iBSS"
    ./irecovery -f bootchain/"$1"/iBSS.img4
    echo "Sending iBEC"
    ./irecovery -f bootchain/"$1"/iBEC.img4
    echo "Sending Diags"
    ./irecovery -f bootchain/"$1"/diag.img4
    echo "Booting Diags"
    ./irecovery -c go
    echo "If the screen is a solid color now, you may use your DCSD cable to connect with MagicCFG, or use nanokdp to access the command line at usbserial-XXXXXX"
elif [ "$1" = 'iPhoneX' ]||[ "$1" = 'iPhone8P' ]||[ "$1" = 'iPad7' ]; then
    echo "Pwning Device"
    ./gaster pwn >/dev/null
    ./gaster reset >/dev/null
    echo "Sending iBSS"
    ./irecovery -f bootchain/"$1"/iBSS.img4
    echo "Sending Diags"
    ./irecovery -f bootchain/"$1"/diag.img4
    echo "Booting Diags"
    ./irecovery -c go
    echo "If the screen is a solid color now, you may use your DCSD cable to connect with MagicCFG, or use nanokdp to access the command line at usbserial-XXXXXX"
elif [ "$1" = 'iPadPro105' ]; then
    echo "Pwning Device"
    ./gaster_A10X pwn >/dev/null
    ./gaster reset >/dev/null
    echo "Sending iBSS"
    ./irecovery -f bootchain/"$1"/iBSS.img4
    echo "Sending Diags"
    ./irecovery -f bootchain/"$1"/diag.img4
    echo "Booting Diags"
    ./irecovery -c go
    echo "If the screen is a solid color now, you may use your DCSD cable to connect with MagicCFG, or use nanokdp to access the command line at usbserial-XXXXXX"
else
    echo "Device Unsupported!" 1>&2
fi
