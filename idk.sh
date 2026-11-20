#!/bin/bash
rm -rf /root/.config/librewolf /root/.librewolf
mkdir -p /root/.config/librewolf/default
cat << 'EOF' > /root/.config/librewolf/profiles.ini
[General]
StartWithLastProfile=1

[Profile0]
Name=default
IsRelative=1
Path=default
Default=1
EOF
cat << 'EOF' > /root/.config/librewolf/default/user.js
user_pref("gfx.webrender.software", true);
user_pref("layers.acceleration.disabled", true);
EOF

grep -q "GTK_USE_PORTAL" /root/.xinitrc || sed -i.bak '1i export GTK_USE_PORTAL=0' /root/.xinitrc
