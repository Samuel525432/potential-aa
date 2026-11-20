#!/bin/bash
chmod 1777 /dev/shm
for prof in /root/.librewolf/*.default*; do
  [ -d "$prof" ] && cat << 'EOF' >> "$prof/user.js"
user_pref("gfx.webrender.software", true);
user_pref("layers.acceleration.disabled", true);
user_pref("security.sandbox.content.level", 0);
EOF
done

GTK_USE_PORTAL=0 MOZ_USE_XINPUT2=0 librewolf --no-remote --profile /tmp/lw-test