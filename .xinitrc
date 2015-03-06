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

# start urxvt daemon
urxvtd -q -f -o

# Load Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Start pulseaudio
/usr/bin/start-pulseaudio-x11

# MPD daemon start (if no other instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

# Set wallpapers
sh ~/.fehbg &

exec i3
