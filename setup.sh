#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -e "$dst" ]; then
    echo "Backing up existing $dst to $dst.bak"
    mv "$dst" "$dst.bak"
  fi
  ln -s "$src" "$dst"
  echo "Linked $dst -> $src"
}

link "$DOTFILES_DIR/zshrc"         "$HOME/.zshrc"
link "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"
link "$DOTFILES_DIR/starship.toml"  "$HOME/.config/starship.toml"

echo "Done!"
