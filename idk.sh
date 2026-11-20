#!/bin/bash
chmod 1777 /dev/shm
for prof in /root/.librewolf/*.default*; do
  [ -d "$prof" ] && cat << 'EOF' >> "$prof/user.js"
user_pref("gfx.webrender.software", true);
user_pref("layers.acceleration.disabled", true);
user_pref("security.sandbox.content.level", 0);
EOF
done

MOZ_DISABLE_CONTENT_SANDBOX=1 MOZ_DISABLE_GMP_SANDBOX=1 LIBGL_ALWAYS_SOFTWARE=1 librewolf --safe-mode