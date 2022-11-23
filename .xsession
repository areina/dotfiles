# configure external monitor
xrandr --output DP-1 --mode 1920x1080 --primary --left-of eDP-1

# load xmodmap to configure the keyboard
[[ -f ~/.Xmodmap ]] && Xmodmap ~/.xmodmap

# set fallback pointer
xsetroot -cursor_name left_ptr

exec stumpwm
