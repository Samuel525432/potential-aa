#!/bin/bash
cat << 'EOF' > /tmp/dwm_shot.awk
/XK_q,.*quit/ {
    print "\t{ MODKEY,                       XK_s,      spawn,          SHCMD(\"mkdir -p ~/Pictures/Screenshots && import -window root ~/Pictures/Screenshots/$(date +%s).png\") },"
    print "\t{ MODKEY|ShiftMask,             XK_s,      spawn,          SHCMD(\"import png:- | xclip -selection clipboard -t image/png\") },"
    print "\t{ MODKEY|ControlMask,           XK_s,      spawn,          SHCMD(\"mkdir -p ~/Pictures/Screenshots && import ~/Pictures/Screenshots/$(date +%s).png\") },"
}
{ print }
EOF
awk -f /tmp/dwm_shot.awk config.h > config.h.tmp && mv config.h.tmp config.h && rm /tmp/dwm_shot.awk
v config.h.tmp config.h && rm /tmp/dwm_shot.awk

sed -i '/XK_q,.*quit/i \	{ MODKEY,                       XK_s,      spawn,          SHCMD("mkdir -p ~/Pictures/Screenshots && import -window root ~/Pictures/Screenshots/$(date +%s).png") },\n\t{ MODKEY|ShiftMask,             XK_s,      spawn,          SHCMD("import png:- | xclip -selection clipboard -t image/png") },\n\t{ MODKEY|ControlMask,           XK_s,      spawn,          SHCMD("mkdir -p ~/Pictures/Screenshots && import ~/Pictures/Screenshots/$(date +%s).png") },' config.h