#!/usr/bin/env bash
#
# launch-vesktop.sh
# Launches /usr/bin/vesktop only if today's date is 2026-08-26 or later.

set -euo pipefail

TARGET_DATE="2026-08-26"
TODAY=$(date +%Y-%m-%d)
MESSAGE="Not yet time. Vesktop unlocks on $TARGET_DATE (today is $TODAY)."

if [[ "$TODAY" > "$TARGET_DATE" || "$TODAY" == "$TARGET_DATE" ]]; then
    exec /usr/bin/vesktop
fi

# Launched via Rofi (or similar) has no terminal attached, so open one
# to show the message. Respects $TERMINAL if set, otherwise tries
# common terminal emulators in order until one is found.
CMD="echo \"$MESSAGE\"; read -n 1 -s -r -p 'Press any key to close...'"

if [[ -n "${TERMINAL:-}" ]] && command -v "$TERMINAL" &>/dev/null; then
    exec "$TERMINAL" -e bash -c "$CMD"
fi

for term in kitty alacritty foot xterm konsole gnome-terminal xfce4-terminal urxvt st; do
    if command -v "$term" &>/dev/null; then
        case "$term" in
            gnome-terminal)
                exec "$term" -- bash -c "$CMD"
                ;;
            *)
                exec "$term" -e bash -c "$CMD"
                ;;
        esac
    fi
done

# Last resort: no terminal emulator found, send a desktop notification instead.
if command -v notify-send &>/dev/null; then
    notify-send "Vesktop" "$MESSAGE"
fi
exit 1
