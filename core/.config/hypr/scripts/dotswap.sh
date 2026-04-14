#!/usr/bin/env bash
set -euo pipefail

STOWTARGET="$HOME"
COREPKG="core"
RELOADSCRIPT="$HOME/.dotfiles/core/.config/hypr/scripts/reload.sh"

STOWDIR="$HOME/.dotfiles"
THEMESDIR="$STOWDIR/themes"

#SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
#STOWDIR="$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel 2>/dev/null || true)"
#[[ -z "$STOWDIR" ]] && STOWDIR="$HOME/.dotfiles"
#

#THEMESDIR="$STOWDIR/themes"

themes="$(
    find "$THEMESDIR" -mindepth 1 -maxdepth 1 -type d ! -name '.*' -printf '%f\n' 2>/dev/null | sort
)"

[[ -z "$themes" ]] && echo "No themes found in $THEMESDIR" && exit 1

if [[ "${1:-}" = "init" ]]; then
    selection="$(echo "$themes" | head -n 1)"
else
    selection="$(echo "$themes" | rofi -dmenu -i -p "theme" 2>/dev/null)"
fi

[[ -z "$selection" ]] && echo "No selection, exiting..." && exit 0

# Ensure stow can address the theme as a package in $STOWDIR
if [[ ! -e "$STOWDIR/$selection" ]]; then
    ln -s "themes/$selection" "$STOWDIR/$selection"
fi

echo "$selection has been selected, switching now..."

# Unstow all themes (packages are at repo root via symlink)
for theme in $themes; do
    [[ -e "$STOWDIR/$theme" ]] || continue
    stow --dir "$STOWDIR" --target "$STOWTARGET" --no-folding --delete "$theme"
done

stow --dir "$STOWDIR" --target "$STOWTARGET" --no-folding --stow "$selection"
stow --dir "$STOWDIR" --target "$STOWTARGET" --no-folding --restow "$COREPKG"

"$RELOADSCRIPT" >/dev/null
echo "Success! Exiting..."
