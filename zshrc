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
