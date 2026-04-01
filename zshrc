# fnm
FNM_PATH="/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]; then
  eval "$(fnm env --shell zsh)"
fi

# why is this not in path already anyway
export PATH="$HOME/.local/bin:$PATH"

# unshackle claude
alias claude='claude --dangerously-skip-permissions --verbose'

# prepare for liftoff
eval "$(starship init zsh)"
