# dotfiles

zsh, [Ghostty](https://ghostty.org), and [Starship](https://starship.rs) config for macOS, plus global instructions for coding agents.

```bash
git clone git@github.com:suraj-geddam/dotfiles.git ~/Projects/dotfiles
~/Projects/dotfiles/setup.sh
```

`setup.sh` symlinks the configs into place (backing up anything already there as `*.bak`) and sets the global git identity.

## Secrets

API keys and tokens don't go in `zshrc`. They live in `~/.config/zsh/secrets.zsh`, which `zshrc` sources when it exists. `setup.sh` creates that file from [`secrets.zsh.example`](secrets.zsh.example) with `chmod 600`; fill in the values there. Add new keys to that file, and their names (no values) to the example.

## Agent instructions

[`agents/AGENTS.md`](agents/AGENTS.md) holds the global instructions for coding agents. `setup.sh` links it into each tool's global path: `~/.claude/CLAUDE.md` (Claude Code), `~/.codex/AGENTS.md` (Codex) and `~/.gemini/AGENTS.md` (Antigravity). Edit the file here; editing through a link can replace the link with a plain copy, so check with `ls -l` afterwards.
