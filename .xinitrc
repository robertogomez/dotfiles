#!/bin/sh
#
#~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Source startup scripts
if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Start pulseaudio
/usr/bin/start-pulseaudio-x11

# Load X resources settings
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Set gtk2rc file
export GTK2_RC_FILES="/etc/gtk-2.0/gtkrc:$HOME/.gtkrc-2.0"

# Set preferences for X
# For system bell
xset b off
# For screen saver
xset s noexpose
# Source alternate fonts location for fonts like Terminus
xset +fp /usr/share/fonts/local
xset fp rehash

# Set numlock state
numlockx &

# Start udiskie for auto-mounting of removable media
udiskie &

# Start window manager
exec awesome

