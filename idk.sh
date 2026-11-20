#!/bin/bash
[ -d /root/.config/librewolf ] && mv /root/.config/librewolf /root/.config/librewolf.corrupt.bak
mkdir -p /tmp/lw-test
cat << 'EOF' > /tmp/lw-test/user.js
user_pref("gfx.webrender.software", true);
user_pref("layers.acceleration.disabled", true);
EOF
GTK_USE_PORTAL=0 librewolf --no-remote --profile /tmp/lw-test &
emote --profile /tmp/lw-test