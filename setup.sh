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

# global agent instructions: one file, read by each tool from its own path
link "$DOTFILES_DIR/agents/AGENTS.md" "$HOME/.claude/CLAUDE.md"
link "$DOTFILES_DIR/agents/AGENTS.md" "$HOME/.codex/AGENTS.md"
link "$DOTFILES_DIR/agents/AGENTS.md" "$HOME/.gemini/AGENTS.md"

# secrets: machine-local, never committed
SECRETS="$HOME/.config/zsh/secrets.zsh"
if [ ! -e "$SECRETS" ]; then
  mkdir -p "$(dirname "$SECRETS")"
  cp "$DOTFILES_DIR/secrets.zsh.example" "$SECRETS"
  chmod 600 "$SECRETS"
  echo "Created $SECRETS from the template; fill in your keys"
fi

# git
git config --global user.name "Suraj Geddam"
git config --global user.email "suraj.geddam@gmail.com"
echo "Set git global user to Suraj Geddam <suraj.geddam@gmail.com>"

echo "Done!"
