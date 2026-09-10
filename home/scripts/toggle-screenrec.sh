set -euo pipefail

unit="wl-screenrec"
outdir="$HOME/Videos/Recordings"
mkdir -p "$outdir"

if systemctl --user is-active --quiet "$unit.service"; then
  systemctl --user stop "$unit.service"
  notify-send "Screen recording" "Stopped" || true
else
  systemctl --user reset-failed "$unit.service" 2>/dev/null || true
  outfile="$outdir/Recording $(date '+%Y-%m-%d %H-%M-%S').mp4"
  systemd-run --user \
    --unit="$unit" \
    --collect \
    --setenv=PATH="$PATH" \
    --setenv=WAYLAND_DISPLAY="$WAYLAND_DISPLAY" \
    --setenv=XDG_RUNTIME_DIR="$XDG_RUNTIME_DIR" \
    --setenv=LIBVA_DRIVER_NAME=iHD \
    wl-screenrec -f "$outfile"
  notify-send "Screen recording" "Started" || true
fi
