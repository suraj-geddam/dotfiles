# secrets: API keys and tokens live outside this repo (see secrets.zsh.example)
[[ -r "$HOME/.config/zsh/secrets.zsh" ]] && source "$HOME/.config/zsh/secrets.zsh"

# fnm
FNM_PATH="/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]; then
  eval "$(fnm env --shell zsh)"
fi

# why is this not in path already anyway
export PATH="/opt/homebrew/bin:$HOME/.local/bin:$PATH"

# unshackle claude
alias claude='claude --dangerously-skip-permissions --verbose'

# prepare for liftoff
eval "$(starship init zsh)"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

# opencode
export PATH="$HOME/.opencode/bin:$PATH"
