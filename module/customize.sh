#!/system/bin/sh

#=============================================
# App Cloner Tweaks v3.0.2
# Developer: Abdullah Al Mamun 🇧🇩 (@A2MBD3)
# For: Realme UI 1.0 | Android 10
#=============================================

MODPATH=${0%/*}
DEVICE=$(getprop ro.product.model 2>/dev/null || echo "Unknown")
ROM=$(getprop ro.build.version.opporom 2>/dev/null || echo "Unknown")
ANDROID=$(getprop ro.build.version.release 2>/dev/null || echo "Unknown")

ui_print ""
ui_print "   📱 App Cloner Tweaks v3.0.2"
ui_print "   🔧 Realme UI Edition"
ui_print ""
ui_print "   Developer: Abdullah Al Mamun 🇧🇩"
ui_print "   Telegram/GitHub/Facebook: @A2MBD3"
ui_print ""
ui_print "   Device : $DEVICE"
ui_print "   ROM    : $ROM"
ui_print "   Android: $ANDROID"
ui_print ""

# Device Check
ui_print "── Checking compatibility..."

IS_REALME=false
getprop ro.product.brand 2>/dev/null | grep -qi "realme" && IS_REALME=true
getprop ro.product.manufacturer 2>/dev/null | grep -qi "realme" && IS_REALME=true

if [ "$IS_REALME" = false ]; then
    ui_print "   [✗] Not a Realme device!"
    ui_print "   [✗] Realme exclusive module"
    ui_print ""
    ui_print "   ❌ INSTALLATION FAILED"
    ui_print "   This module is for Realme devices only."
    ui_print ""
    exit 1
fi

if ! pm list packages 2>/dev/null | grep -q "com.coloros.oppomultiapp"; then
    ui_print "   [✗] App Cloner not found!"
    ui_print "   [✗] Enable App Cloner first"
    ui_print ""
    ui_print "   ❌ INSTALLATION FAILED"
    ui_print "   Clone any app once before installing."
    ui_print ""
    exit 1
fi

if [ ! -d "/data/oppo/coloros/multiapp" ]; then
    ui_print "   [✗] Config directory missing!"
    ui_print "   [✗] Clone any app first"
    ui_print ""
    ui_print "   ❌ INSTALLATION FAILED"
    ui_print "   Enable App Cloner & clone an app first."
    ui_print ""
    exit 1
fi

ui_print "   [✓] Realme device"
ui_print "   [✓] App Cloner found"
ui_print "   [✓] Config directory found"
ui_print ""

# Setup
ui_print "── Setting permissions..."
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm $MODPATH/service.sh 0 0 0755
set_perm $MODPATH/action.sh 0 0 0755
set_perm $MODPATH/system/bin/app_cloner_tweaks 0 0 0755
ui_print "   [✓] Done"
ui_print ""

# Done
ui_print "── ✅ Installation Complete"
ui_print ""
ui_print "   Systemless - Safe & Reversible"
ui_print "   Auto-runs on every reboot"
ui_print "   Detects new app installs"
ui_print ""
ui_print "   Manual: Magisk Action button"
ui_print "   Terminal: su -c app_cloner_tweaks"
ui_print ""

exit 0