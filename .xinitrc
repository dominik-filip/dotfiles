# Executed by startx

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# start urxvt daemon
urxvtd -q -f -o

# load Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# start pulseaudio
/usr/bin/start-pulseaudio-x11

# MPD daemon start
mpd

# set wallpapers
sh ~/.fehbg &

# start window manager
exec i3
