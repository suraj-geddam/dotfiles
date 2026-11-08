# dotfiles

zsh, [Ghostty](https://ghostty.org), and [Starship](https://starship.rs) config for macOS.

```bash
git clone git@github.com:suraj-geddam/dotfiles.git ~/Projects/dotfiles
~/Projects/dotfiles/setup.sh
```

`setup.sh` symlinks the configs into place (backing up anything already there as `*.bak`) and sets the global git identity.

## Secrets

API keys and tokens don't go in `zshrc`. They live in `~/.config/zsh/secrets.zsh`, which `zshrc` sources when it exists. `setup.sh` creates that file from [`secrets.zsh.example`](secrets.zsh.example) with `chmod 600`; fill in the values there. Add new keys to that file, and their names (no values) to the example.
