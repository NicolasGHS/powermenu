#!/bin/env bash


# rofi -show run
lock=""
logout=""
shutdown=""
# reboot=""
sleep=""


selected_option=$(echo "$lock
$logout
$sleep
$shutdown" | rofi -dmenu\
		-i\
		-p "Power"\
		-theme "~/.config/rofi/themes/powermenu.rasi")

# return based on selected option
if [ "$selected_option" == "$lock" ]
then
    betterlockscreen --lock 
elif [ "$selected_option" == "$logout" ]
then
    loginctl terminate-user `whoami`
elif [ "$selected_option" == "$shutdown" ]
then
    sudo systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
   doas systemctl reboot
elif [ "$selected_option" == "$sleep" ]
then
    amixer set Master mute
    doas systemctl suspend
else
    echo "No match"
fi
