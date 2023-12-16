oscheck=$(uname)
deviceid=$("$oscheck"/irecovery -q | grep MODEL | sed 's/MODEL: //')
cpid=$("$oscheck"/irecovery -q | grep CPID | sed 's/CPID: //')

if [ ! -e "$oscheck"/gaster ]; then
    curl -sLO https://nightly.link/verygenericname/gaster/workflows/makefile/main/gaster-"$oscheck".zip
    unzip gaster-"$oscheck".zip
    mv gaster "$oscheck"/
    rm -rf gaster gaster-"$oscheck".zip
    chmod 777 "$oscheck"/gaster
fi


if [ "$cpid" = '0x8955' ]; then
    ./"$oscheck"/ipwnder -p &>/dev/null &
    echo "Pwning device"
    ./$oscheck/ipwnder -f bootchian/"$deviceid"/iBSS.img3
    echo "Sending iBSS"
    ./$oscheck/irecovery -f bootchain/"$deviceid"/iBEC.img3
    echo "Sending iBEC"
    ./$oscheck/irecovery -f bootchain/"$deviceid"/diag.img3
    echo "Sending Diags"
    ./$oscheck/irecovery -c go &>/dev/null &
    echo "Loading Diags"
    echo "If the screen is purple now, you may use your DCSD cable to connect with MagicCFG, or use nanokdp to access the command line at usbserial-XXXXXX"
    echo "You can use sn to write a new serial number, make sure its valid"

elif [ "$cpid" = '0x8940' ] || [  "$cpid" = '0x8942' ] || [ "$1" = '0x8945' ]; then
    echo 'USE AN ARDUINO TO PUT YOUR DEVICE INTO PWNED DFU MODE'
    ./$oscheck/ipwnder -f ./bootchain/"$deviceid"/iBSS.img3
    echo "Sending iBSS"
    ./$oscheck/irecovery -f ./bootchain/"$deviceid"/iBEC.img3
    echo "Sending iBEC"
    ./$oscheck/irecovery -f ./bootchain/"$deviceid"/diag.img3
    echo "Sending Diags"
    ./$oscheck/irecovery -c go
    echo "Loading Diags"
    echo "If the screen is purple now, you may use your DCSD cable to connect with MagicCFG, or use nanokdp to access the command line at usbserial-XXXXXX"
    echo "You can use sn to write a new serial number in the command line, make sure its valid"
    
elif [ "$cpid" = '0x8960' ]; then
    echo "Pwning Device"
    ./$oscheck/ipwnder2 -p >/dev/null
    ./$oscheck/gaster reset >/dev/null
    echo "Sending iBSS"
    ./$oscheck/irecovery -f bootchain/"$deviceid"/iBSS.img4
    ./$oscheck/irecovery -f bootchain/"$deviceid"/iBSS.img4
    echo "Sending iBEC"
    ./$oscheck/irecovery -f bootchain/"$deviceid"/iBEC.img4
    echo "Sending Diags"
    ./$oscheck/irecovery -f bootchain/"$deviceid"/diag.img4
    echo "Booting Diags"
    ./$oscheck/irecovery -c go
    echo "If the screen is a solid color now, you may use your DCSD cable to connect with MagicCFG, or use nanokdp to access the command line at usbserial-XXXXXX"
    
elif [ "$cpid" = '0x7000' ] || [  "$cpid" = '0x7001' ] || [ "$cpid" = '0x8000' ] || [ "$cpid" = '0x8001' ] || [ "$cpid" = '0x8001' ] || [ "$cpid" = '0x8003' ]; then
    echo "Pwning Device"
    ./$oscheck/gaster pwn >/dev/null
    ./$oscheck/gaster reset >/dev/null
    echo "Sending iBSS"
    ./$oscheck/irecovery -f bootchain/"$deviceid"/iBSS.img4
    echo "Sending iBEC"
    ./$oscheck/irecovery -f bootchain/"$deviceid"/iBEC.img4
    echo "Sending Diags"
    ./$oscheck/irecovery -f bootchain/"$deviceid"/diag.img4
    echo "Booting Diags"
    ./$oscheck/irecovery -c go
    echo "If the screen is a solid color now, you may use your DCSD cable to connect with MagicCFG, or use nanokdp to access the command line at usbserial-XXXXXX"
elif [ "$cpid" = '0x8010' ] || [  "$cpid" = '0x8011' ] || [ "$cpid" = '0x8012' ] || [ "$cpid" = '0x8015' ]; then
    echo "Pwning Device"
    ./$oscheck/gaster pwn >/dev/null
    ./$oscheck/gaster reset >/dev/null
    echo "Sending iBSS"
    ./$oscheck/irecovery -f bootchain/"$deviceid"/iBSS.img4
    echo "enabling USBSerial"
    ./$oscheck/irecovery -c "setenv boot-args usbserial=enabled"
    ./$oscheck/irecovery -c "saveenv"
    echo "Sending Diags"
    ./$oscheck/irecovery -f bootchain/"$deviceid"/diag.img4
    echo "Booting Diags"
    ./$oscheck/irecovery -c go
    echo "If the screen is a solid color now, you may use your DCSD cable to connect with MagicCFG, or use nanokdp to access the command line at usbserial-XXXXXX, since usbserial was enabled here, the device is also avaible at usbmodem-XXXXX"
else
    echo "Device Unsupported!" 1>&2
fi
