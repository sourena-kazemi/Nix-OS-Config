set -euo pipefail

cliphist list |
  fuzzel --dmenu --with-nth 2 |
  cliphist decode |
  wl-copy
