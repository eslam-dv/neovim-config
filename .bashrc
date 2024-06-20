###----- EXPORTS -----###
export PATH="$PATH:$HOME/.local/bin/"
export MYVIMRC="$HOME/.config/nvim/"
export XCURSOR_THEME="Capitaine Cursors"

###----- PROMPT -----###
function parse_git_dirty {
  STATUS="$(git status 2> /dev/null)"
  if [[ $? -ne 0 ]]; then printf ""; return; fi
  if echo ${STATUS} | grep -c "renamed:"         &> /dev/null; then printf " "; else printf ""; fi
  if echo ${STATUS} | grep -c "branch is ahead:" &> /dev/null; then printf " !"; else printf ""; fi
  if echo ${STATUS} | grep -c "new file::"       &> /dev/null; then printf " "; else printf ""; fi
  if echo ${STATUS} | grep -c "Untracked files:" &> /dev/null; then printf " ?"; else printf ""; fi
  if echo ${STATUS} | grep -c "modified:"        &> /dev/null; then printf " "; else printf ""; fi
  if echo ${STATUS} | grep -c "deleted:"         &> /dev/null; then printf " "; else printf ""; fi
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

PS1='\e[1;34m\W\e[m\e[1;35m$(parse_git_branch " (%s)")\e[m \n\e[1;32m>\e[m '

###----- HISTROY -----###
export HISTFILESIZE=1000
export HISTCONTROL="erasedups:ignoreboth"
export HISTFILE=~/.bash_history

###----- KEYBINDS -----###
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

###----- ALIASES -----###
alias ls='eza --icons=always'
alias la="ls -la"
alias cd='z'
alias ..="cd ../"
alias ...="cd ../.."
alias star='dwl -s startw'
alias po='poweroff'
alias re='reboot'
alias c='clear'
alias bashrc='nvim ~/.bashrc'
alias src='source ~/.bashrc'
alias vimrc='nvim ~/.config/nvim'

###----- OTHER -----###
eval "$(zoxide init bash)"
eval "$(fzf --bash)"
