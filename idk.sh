#!/bin/sh
cp config.h config.h.bak
awk '
/XK_q,.*quit/ {
    print "\t{ MODKEY,                       XK_s,      spawn,          SHCMD(\"mkdir -p ~/Pictures/Screenshots && import -window root ~/Pictures/Screenshots/$(date +%s).png\") },"
    print "\t{ MODKEY|ShiftMask,             XK_s,      spawn,          SHCMD(\"import png:- | xclip -selection clipboard -t image/png\") },"
    print "\t{ MODKEY|ControlMask,           XK_s,      spawn,          SHCMD(\"mkdir -p ~/Pictures/Screenshots && import ~/Pictures/Screenshots/$(date +%s).png\") },"
}
{ print }
' config.h > config.h.tmp && mv config.h.tmp config.h
EOF
sh idk.sh