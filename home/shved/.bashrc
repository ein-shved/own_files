#!/bin/bash
export WINEARCH=win32
export WINEPREFIX=/home/shved/.wine32
export MANPATH="$MANPATH":"$HOME/.cabal/share/doc":"/usr/share/doc":"$HOME"/Projects/usr/share/man
export PATH="$HOME/.cabal/bin":"$HOME/usr/bin":"$PATH"
export PATH="/usr/lib/colorgcc/bin":"$PATH"
export EDITOR=vim
export QTCURVE_CONFIG_FILE=/usr/share/themes/Lucidity/qtc_lucidity.themerc

if [ $UID -ne 0 ]; then
# Privileged access
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudo vim'
    alias root='sudo -s'
    alias reboot='sudo systemctl reboot'
    alias poweroff='sudo systemctl poweroff'
    alias update='sudo pacman -Su'
    alias systemctl='sudo systemctl'
    alias pacman='sudo pacman'
    alias mount='sudo mount'
    alias umount='sudo umount'

#network management aliases
    alias netctl='sudo netctl'
    alias netctl-auto='sudo netctl-auto'
    alias wifimenu='sudo wifi-menu'
    alias dhcpcd='sudo dhcpcd'
    alias iw='sudo iw'
    alias iwconfig='sudo iwconfig'
    alias ip='sudo ip'
    alias ifconfig='sudo ifconfig'
    alias brctl='sudo brctl'

#kernel management aliases
    alias modprobe='sudo modprobe'
#other
    alias ..='cd ../'
    alias vim_stop='killall -SIGINT gvim'
    alias arccn='cd $HOME/Projects/arccn'
fi

source $HOME/Projects/build_args
export QTCURVE_CONFIG_FILE=$HOME/usr/share/themes/Lucidity/qtc_lucidity.themerc
export XDG_RUNTIME_DIR=$HOME/usr/xdg

if [ "$DISPLAY" != "" ];
then
    xhost + shvedPC > /dev/null 2> /dev/null;
fi
export GCC_COLORS=y

