###----- EXPORTS -----###
export PATH="$PATH:$HOME/.local/bin/"
export MYVIMRC="$HOME/.config/nvim/"

###----- PROMPT -----###
function parse_git_dirty {
  STATUS="$(git status 2> /dev/null)"
  if [[ $? -ne 0 ]]; then printf ""; return; fi
  if echo ${STATUS} | grep -c "renamed:"         &> /dev/null; then printf " 󰜴"; else printf ""; fi
  if echo ${STATUS} | grep -c "branch is ahead:" &> /dev/null; then printf " !"; else printf ""; fi
  if echo ${STATUS} | grep -c "new file::"       &> /dev/null; then printf " "; else printf ""; fi
  if echo ${STATUS} | grep -c "Untracked files:" &> /dev/null; then printf " ?"; else printf ""; fi
  if echo ${STATUS} | grep -c "modified:"        &> /dev/null; then printf " "; else printf ""; fi
  if echo ${STATUS} | grep -c "deleted:"         &> /dev/null; then printf " "; else printf ""; fi
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

# change prompt color depending on the exit status of last command
function set_prompt {
    if [ $? -eq 0 ]; then
        PS1="\e[1;34m\W\e[m\e[1;35m$(parse_git_branch " (%s)")\e[m \e[1;32m󰄾\e[m "
    else
        PS1="\e[1;34m\W\e[m\e[1;35m$(parse_git_branch " (%s)")\e[m \e[1;31m󰄾\e[m "
    fi
}

PROMPT_COMMAND=set_prompt

###----- HISTROY -----###
export HISTFILESIZE=1000
export HISTCONTROL="erasedups:ignoreboth"
export HISTFILE=~/.bash_history

###----- KEYBINDS -----###
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

###----- ALIASES -----###
alias ls='eza --icons=always'
alias ll='ls -l'
alias la="ls -a"
alias cd='z'
alias ..="cd ../"
alias ...="cd ../.."
alias start='dbus-run-session dwl -s startw'
alias po='poweroff'
alias re='reboot'
alias c='clear'
alias bashrc='nvim ~/.bashrc'
alias src='source ~/.bashrc'
alias vimrc='nvim ~/.config/nvim'
alias ff='fastfetch'

###----- OTHER -----###
eval "$(zoxide init bash)"
eval "$(fzf --bash)"
