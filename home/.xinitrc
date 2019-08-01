#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# use us layout with altgr magic
setxkbmap us altgr-intl

# allow composition via menu, disable caps
# setxkbmap -option caps:lshift,compose:menu us

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


# set type repetition speed
xset r rate 200 80


# dell latetude e5470 specific stuff

#xinput set-prop "ImPS/2 BYD TouchPad" "Evdev Wheel Emulation" 1
#xinput set-prop "ImPS/2 BYD TouchPad" "Evdev Wheel Emulation Button" 2
#xinput set-prop "ImPS/2 BYD TouchPad" "Evdev Wheel Emulation Timeout" 200
#xinput set-prop "ImPS/2 BYD TouchPad" "Evdev Wheel Emulation Axes" 6 7 4 5

id=$(xinput --list | awk -v search="DualPoint Stick" '$0 ~ search {match($0, /id=[0-9]+/);\
                  if (RSTART) \
                    print substr($0, RSTART+3, RLENGTH-3)\
                }')

# slow down as much as acceptable
# xinput set-prop $id 280 -0.75

id_pad=$(xinput --list | awk -v search="DualPoint TouchPad" '$0 ~ search {match($0, /id=[0-9]+/);\
                  if (RSTART) \
                    print substr($0, RSTART+3, RLENGTH-3)\
                }')


## libinput settings for touchpad
# side scrolling
# xinput set-prop $id_pad 293 1
xinput set-prop $id_pad "libinput Horizontal Scroll Enabled" 1

# do not disable touhpad when typing
# xinput set-prop $id_pad 302 0
xinput set-prop $id_pad "libinput Disable While Typing Enabled" 0

# enable tap to click
#xinput set-prop $id_pad 294 1
xinput set-prop $id_pad "libinput Tapping Enabled" 1

# increase accel for touchpad
# feelsbadman
#xinput set-prop $id_pad 280 1
xinput set-prop $id_pad "libinput Accel Speed" 1


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

exec i3 -c $HOME/.i3/config >> $HOME/.i3/i3.log
# exec startxfce4
