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
    # loginctl terminate-user `whoami`
    echo "logout"
elif [ "$selected_option" == "$shutdown" ]
then
    # mpv ~/Music/alaram/shutdown.mp3 &
    # doas systemctl poweroff
    echo "shutdown"
elif [ "$selected_option" == "$reboot" ]
then
   # doas systemctl reboot
   echo "reboot"
elif [ "$selected_option" == "$sleep" ]
then
    # amixer set Master mute
    # doas systemctl suspend
    echo "sleep"
else
    echo "No match"
fi
