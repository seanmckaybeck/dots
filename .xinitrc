#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# gnome-screensaver &
# exec gnome-session

#exec startkde
#exec startxfce4
#exec openbox-session


sxhkd &

~/bin/set_wallpaper.sh &

[[ -z $(pgrep -af mpd) ]] && mpd
start-pulseaudio-x11 &
exec bspwm
