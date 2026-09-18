set -euo pipefail

connection="Runflare"

usage() {
  echo "Usage: vpn [status|on|off|toggle]" >&2
  exit 1
}

is_active() {
  nmcli -t -f NAME connection show --active | grep -qx "$connection"
}

cmd_status() {
  if is_active; then
    echo "$connection: connected"
    return 0
  fi
  echo "$connection: disconnected"
  return 1
}

cmd_on() {
  if is_active; then
    echo "$connection: already connected"
    notify-send "VPN" "$connection already connected" || true
    return 0
  fi
  nmcli connection up "$connection"
  notify-send "VPN" "$connection connected" || true
}

cmd_off() {
  if ! is_active; then
    echo "$connection: already disconnected"
    notify-send "VPN" "$connection already disconnected" || true
    return 0
  fi
  nmcli connection down "$connection"
  notify-send "VPN" "$connection disconnected" || true
}

cmd_toggle() {
  if is_active; then
    cmd_off
  else
    cmd_on
  fi
}

case "${1:-toggle}" in
  status | st) cmd_status ;;
  on | up | connect) cmd_on ;;
  off | down | disconnect) cmd_off ;;
  toggle) cmd_toggle ;;
  -h | --help | help) usage ;;
  *) usage ;;
esac
