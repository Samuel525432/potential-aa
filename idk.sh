#!/bin/bash
cat << 'EOF' > /root/.xinitrc
export GTK_USE_PORTAL=0
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/0}"

picom -b --config /root/.config/picom/picom.conf &

exec dbus-run-session sh -c '
  pipewire &
  sleep 0.5
  pipewire-pulse &
  wireplumber &
  exec dwm
'
EOF