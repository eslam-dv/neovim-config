# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zap setup
ZAP_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zap"

if [ ! -d "$ZAP_DIR" ]; then
  mkdir -p "$(dirname $ZAP_DIR)"
  git clone https://github.com/zap-zsh/zap.git "$ZAP_DIR"
fi

# Source/Load Zap
source "${ZAP_DIR}/zap.zsh"

# Install Powerlevel10k
plug "romkatv/powerlevel10k"
# Install zsh plugins
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-autosuggestions"
plug "Aloxaf/fzf-tab"

# Load Completions
autoload -U compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

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
source /usr/share/fzf/shell/key-bindings.zsh # fzf
eval "$(zoxide init zsh)"
# fzf tokyonight theme
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--color=fg:#c0caf5,bg:#1a1b26,hl:#ff9e64 \
--color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 \
--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff \
--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"
