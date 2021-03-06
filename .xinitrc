#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# import DISPLAY and XAUTHORITY vars for systemd user applications
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# start gnome-keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)

# SSH agent lock
export SSH_AUTH_SOCK

if [[ "$(hostname)" == "arrakis" ]]; then
  # HiDPI scaling settings
  export GDK_SCALE=2
  export GDK_DPI_SCALE=0.5
  export QT_AUTO_SCREEN_SET_FACTOR=0
  export QT_SCALE_FACTOR=2
  export QT_FONT_DPI=96

  # graphics drivers for desktop
  export LIBVA_DRIVER_NAME=iHD
  export VDPAU_DRIVER=va_gl
fi

# swap control and escape
setxkbmap -option caps:swapescape

# turn on numlock
numlockx &

# launch wm
exec i3
