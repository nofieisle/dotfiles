### Default working directory
if [[ "$PWD" == "$HOME" ]]; then
  cd ~/workspace
fi

### Prompt ###
git_info() {
  command git rev-parse --is-inside-work-tree &>/dev/null || return
  local branch=$(command git branch --show-current 2>/dev/null)
  [[ -n "$branch" ]] && echo " %F{cyan}(${branch})%f"
}
setopt PROMPT_SUBST
PROMPT='🐱 %F{yellow}%~%f$(git_info) %# '

### Disable START/STOP control ###
stty -ixon

### Alias ###
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='ls -lF'
alias lla='ls -lAF'
alias la='ls -A'
alias l='ls -CF'
alias dot='cd ~/.dotfiles'
alias works='cd ~/workspace'
alias note='cd ~/workspace/_note'
alias cnote='code ~/workspace/_note'

export PATH="$HOME/.local/bin:$PATH"

### nvm
export NVM_DIR="$HOME/.nvm"
nvm() {
  unset -f nvm
  . "$NVM_DIR/nvm.sh"
  nvm "$@"
}

### Added by Antigravity
export PATH="/Users/mac4/.antigravity/antigravity/bin:$PATH"

### fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

