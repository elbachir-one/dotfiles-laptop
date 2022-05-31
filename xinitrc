setxkbmap fr &
alacritty &
clipmenud &

~/.screenlayout/d.sh &
#
feh --bg-scale ~/Wallpaper/23.jpg &
picom &
#~/Scripts/dwm_status &
#
while xsetroot -name "`cat /sys/class/power_supply/BAT1/capacity` `date` `uptime | sed 's/.*,//'`"
do
	sleep 2
done &
#
while true; do
	dwm >/dev/null 2>&1
done
#
exec dwm
