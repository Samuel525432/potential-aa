#!/bin/bash
chmod 1777 /dev/shm
for prof in /root/.librewolf/*.default*; do
  [ -d "$prof" ] && cat << 'EOF' >> "$prof/user.js"
user_pref("gfx.webrender.software", true);
user_pref("layers.acceleration.disabled", true);
user_pref("security.sandbox.content.level", 0);
EOF
done

apk info mesa-dri; GDK_SYNCHRONIZE=1 MOZ_X11_EGL=0 librewolf --no-remote