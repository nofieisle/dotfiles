### Prompt ###
git_info() {
  git rev-parse --is-inside-work-tree &>/dev/null || return
  local user branch
  user=$(git config user.name 2>/dev/null)
  branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  [[ -n "$user" && -n "$branch" ]] && echo " %F{cyan}(${user}:${branch})%f"
}
setopt PROMPT_SUBST
PROMPT='🐱 %F{yellow}%~%f$(git_info) %# '

### alias ###
alias ll='ls -lF'
alias lla='ls -lAF'
alias la='ls -A'
alias l='ls -CF'
alias cc='claude'

### disable flow control ###
stty -ixon

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
load-nvm() {
  unset -f node npm npx nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}
node() { load-nvm; node "$@"; }
npm() { load-nvm; npm "$@"; }
npx() { load-nvm; npx "$@"; }
nvm() { load-nvm; nvm "$@"; }

export PATH="$HOME/.local/bin:$PATH"

export PATH="/usr/local/opt/util-linux/bin:$PATH"
export PATH="/usr/local/opt/util-linux/sbin:$PATH"
