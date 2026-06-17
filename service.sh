#!/system/bin/sh

until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 2
done

sleep 15
/system/bin/app_cloner_tweaks > /dev/null 2>&1 &

exit 0