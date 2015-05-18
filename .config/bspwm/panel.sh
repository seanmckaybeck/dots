#!/bin/bash
#
# panel.sh - panel for my desktop
#

FOLDER="/home/sean/.config/bspwm"
pkill -f "dzen2 -p -dock -title-name panel"*

statusbar() {
    desk() {
        DESKTOP=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
        case $DESKTOP in
            0)  echo "^fg(#8c4c4c)""^i($FOLDER/term.xbm)"  "^fg(#484542)""^i($FOLDER/www.xbm)"  "^fg(#484542)""^i($FOLDER/media.xbm)"  "^fg(#484542)""^i($FOLDER/misc.xbm)"
                ;;
            1)  echo "^fg(#484542)""^i($FOLDER/term.xbm)"  "^fg(#8c4c4c)""^i($FOLDER/www.xbm)"  "^fg(#484542)""^i($FOLDER/media.xbm)"  "^fg(#484542)""^i($FOLDER/misc.xbm)"
                ;;
            2)  echo "^fg(#484542)""^i($FOLDER/term.xbm)"  "^fg(#484542)""^i($FOLDER/www.xbm)"  "^fg(#8c4c4c)""^i($FOLDER/media.xbm)"  "^fg(#484542)""^i($FOLDER/misc.xbm)"
                ;;
            3)  echo "^fg(#484542)""^i($FOLDER/term.xbm)"  "^fg(#484542)""^i($FOLDER/www.xbm)"  "^fg(#484542)""^i($FOLDER/media.xbm)"  "^fg(#8c4c4c)""^i($FOLDER/misc.xbm)"
                ;;
            *)  echo "error"
        esac
    }
    
    clock() {
        time=$(date "+%H:%M %d/%m/%y")
        echo "^fg(#746c48)^i($FOLDER/clock.xbm) ^fg(#bea492)$time"
    }

    mpd() {
        cur=$(mpc current)
        echo "^fg(#907245)^i($FOLDER/note.xbm) ^fg(#bea492)$cur"
    }
    
    weather() {
        URL='http://www.accuweather.com/en/us/baltimore-md/21202/weather-forecast/348707'
        w=$(wget -w 3600 -q -O- "$URL" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print ""$14", "$12"°F" }'| head -1)
        echo "^fg(#4c626d)^i($FOLDER/temp.xbm) ^fg(#bea492)$w"
    }

    pac() {
        pac=$(checkupdates | wc -l)
        echo "^fg(#604c5f)^i($FOLDER/pac.xbm) ^fg(#bea492)$pac"
    }

    load() {
        load=$(uptime | awk -F'average:' '{print ($2 + $3 + $4)*10}')
        echo "^fg(#4b5e55)^i($FOLDER/cpu.xbm) ^fg(#bea492)$load%"
    }

    battery() {
        cmd=$(acpi -b | sed 's/.*[ \t][ \t]*\([0-9][0-9]*\)%.*/\1/')
        if (( $cmd >= 90 ))
        then
            echo "^fg(#00e600)^i($FOLDER/battery_full.xbm) ^fg(#bea492)$cmd%"
        elif (( $cmd < 90 && $cmd >= 75 ))
        then
            echo "^fg(#00e600)^i($FOLDER/battery_75.xbm) ^fg(#bea492)$cmd%"
        elif (( $cmd < 75 && $cmd >= 50 ))
        then
            echo "^fg(#00e600)^i($FOLDER/battery_half.xbm) ^fg(#bea492)$cmd%"
        elif (( $cmd < 50 && $cmd >= 25 ))
        then
            echo "^fg(#00e600)^i($FOLDER/battery_quarter.xbm) ^fg(#bea492)$cmd%"
        elif (( $cmd < 25 ))
        then
            echo "^fg(#00e600)^i($FOLDER/battery_ten.xbm) ^fg(#bea492)$cmd%"
        fi
    }

    vol() {
        volume=$(amixer get Master | egrep -o "[0-9]+%" | head -1)
        echo "^fg(#ae5d5d)^i($FOLDER/vol.xbm) ^fg(#bea492)$volume"
    }

    echo "$(desk) ^fg(#282522)| $(clock) ^fg(#282522)| $(mpd) ^fg(#282522)| $(weather) ^fg(#282522)| $(pac) ^fg(#282522)| $(load) ^fg(#282522)| $(battery) ^fg(#282522)| $(vol) ^fg(#282522)"
}

while true; do
      echo "$(statusbar)"
      sleep 0.8
done | dzen2 -p -dock -title-name panel -e 'button2=;' -bg '#181512' -fn 'M+\ 1m-12' -w 1900 -h 25 -x 10 -y 10 -ta c -sa c &

