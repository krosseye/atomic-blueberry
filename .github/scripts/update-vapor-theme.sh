#!/usr/bin/env bash
# Pulls only the Vapor theme files out of Valve's steamdeck-kde-presets package into files/system.
set -euo pipefail

MIRROR=https://steamdeck-packages.steamos.cloud/archlinux-mirror/jupiter-main/os/x86_64
PKG=steamdeck-kde-presets
DEST=files/system
NOTICE=$DEST/usr/share/licenses/vapor-theme/NOTICE

PATHS=(
  usr/share/plasma/look-and-feel/com.valve.vapor.desktop
  usr/share/plasma/desktoptheme/Vapor
  usr/share/color-schemes/Vapor.colors
  usr/share/themes/Vapor
  usr/share/konsole/Vapor.colorscheme
  usr/share/konsole/Vapor.profile
)

work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

curl -fsSL -o "$work/db" "$MIRROR/jupiter-main.db"
desc=$(tar -xOf "$work/db" --wildcards "$PKG-[0-9]*/desc")
field() { awk -v k="%$1%" '$0 == k { getline; print; exit }' <<<"$desc"; }
version=$(field VERSION)
filename=$(field FILENAME)
sha=$(field SHA256SUM)
[[ -n $version && -n $filename && -n $sha ]] || { echo "Could not find $PKG in repo database" >&2; exit 1; }
echo "version=$version" >>"${GITHUB_OUTPUT:-/dev/null}"

if [[ -f $NOTICE ]] && grep -qx "Version: $version" "$NOTICE"; then
  echo "Vapor theme already at $version"
  exit 0
fi

curl -fsSL -o "$work/pkg" "$MIRROR/$filename"
echo "$sha  $work/pkg" | sha256sum -c -

for p in "${PATHS[@]}"; do rm -rf "${DEST:?}/$p"; done
mkdir -p "$DEST"
tar --zstd -xf "$work/pkg" -C "$DEST" "${PATHS[@]}"

mkdir -p "$(dirname "$NOTICE")"
cat >"$NOTICE" <<EOF
Vapor theme files from Valve's $PKG package, licensed GPL-2.0 (see each theme's metadata.json).
Source: $MIRROR/$filename
Version: $version
SHA256: $sha
Updated by .github/scripts/update-vapor-theme.sh. Do not edit these files by hand.
EOF

echo "Vapor theme updated to $version"
