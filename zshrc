### Prompt ###
git_info() {
  command git rev-parse --is-inside-work-tree &>/dev/null || return
  local branch=$(command git branch --show-current 2>/dev/null)
  [[ -n "$branch" ]] && echo " %F{cyan}(${branch})%f"
}
setopt PROMPT_SUBST
PROMPT='🐱 %F{yellow}%~%f$(git_info) %# '

### disable START/STOP control ###
stty -ixon

### alias ###
alias ll='ls -lF'
alias lla='ls -lAF'
alias la='ls -A'
alias l='ls -CF'
alias cdw='cd workspace/'

export PATH="$HOME/.local/bin:$PATH"

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Added by Antigravity
export PATH="/Users/mac4/.antigravity/antigravity/bin:$PATH"
