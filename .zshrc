# Zap setup
ZAP_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zap"

if [ ! -d "$ZAP_DIR" ]; then
  mkdir -p "$(dirname $ZAP_DIR)"
  git clone https://github.com/zap-zsh/zap.git "$ZAP_DIR"
fi

# Source/Load Zap
source "${ZAP_DIR}/zap.zsh"

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Stop Beep Noise
unsetopt beep

# Install zsh plugins
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-autosuggestions"
plug "Aloxaf/fzf-tab"

# Load Completions
autoload -U compinit && compinit

# Keybindings
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls="eza --icons=always"
alias la="ls -la"
alias ..="cd ../"
alias ...="cd ../.."
alias cl="clear"
alias zc="nvim ~/dotfiles/.zshrc"
alias vc="nvim ~/dotfiles/.config/nvim/"
alias cd="z"

# Integration
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# fzf tokyonight theme
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--color=fg:#c0caf5,bg:#1a1b26,hl:#ff9e64 \
--color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 \
--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff \
--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"

# Environment Variables
export UV_USE_IO_URING=0 # yarn
export MYVIMRC=~/dotfiles/.config/nvim/

# Git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:*' unstagedstr ''
zstyle ':vcs_info:*' stagedstr ''
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats 'on %F{red}%f %F{cyan}%b%f %F{yellow}%c%f%F{red}%u%f '

NL=$'\n'
precmd() { print "" }
PROMPT="%F{blue}%1~%f \$vcs_info_msg_0_ ${NL}%(?.%F{green}.%F{red})❯%f "
