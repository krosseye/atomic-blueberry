#!/usr/bin/env bash
set -oue pipefail

sed -i '/^LOGO=/d' /usr/lib/os-release
echo 'LOGO=atomic-blueberry' >>/usr/lib/os-release

REPO=https://github.com/Krosseye/atomic-blueberry
VERSION_ID=$(. /usr/lib/os-release && echo "$VERSION_ID")
sed -i \
  -e 's|^NAME=.*|NAME="Atomic Blueberry"|' \
  -e "s|^PRETTY_NAME=.*|PRETTY_NAME=\"Atomic Blueberry $VERSION_ID\"|" \
  -e "s|^HOME_URL=.*|HOME_URL=\"$REPO\"|" \
  -e "s|^BUG_REPORT_URL=.*|BUG_REPORT_URL=\"$REPO/issues\"|" \
  /usr/lib/os-release

gtk-update-icon-cache -f /usr/share/icons/hicolor
