#!/bin/bash
cp config.h config.h.bak && \
cat << 'EOF' > /tmp/dwm_shot.awk
/static Key keys\[\]/ { in_keys=1 }
in_keys && /^\};/ {
    print "\t{ 0,                            XK_Print,  spawn,          SHCMD(\"mkdir -p ~/Pictures/Screenshots && import -window root ~/Pictures/Screenshots/$(date +%s).png\") },"
    print "\t{ ShiftMask,                    XK_Print,  spawn,          SHCMD(\"import png:- | xclip -selection clipboard -t image/png\") },"
    print "\t{ MODKEY,                       XK_Print,  spawn,          SHCMD(\"mkdir -p ~/Pictures/Screenshots && import ~/Pictures/Screenshots/$(date +%s).png\") },"
    in_keys=0
}
{ print }
EOF
awk -f /tmp/dwm_shot.awk config.h > config.h.tmp && mv config.h.tmp config.h && rm /tmp/dwm_shot.awk