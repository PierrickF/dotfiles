# Permanently set ~/.bin to the PATH.
# i3 will only check this here, not in .bashrc
[[ -d $HOME/.bin ]] && export PATH=$HOME/.bin:$PATH
. "$HOME/.cargo/env"

# Activate capslock remap
setxkbmap -layout us -variant intl -option ctrl:swapcaps

# Set mouse speed
# Also set in .i3/config
xinput set-prop "Logitech USB Receiver" "libinput Accel Speed" -0.7
