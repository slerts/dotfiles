# oh-my-zsh
if [[ "$(hostname)" == "arrakis" ]]; then
  export ZSH=/usr/share/oh-my-zsh/
else
  export ZSH=$HOME/.oh-my-zsh/
  export PATH=/snap/bin:$PATH
fi

export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# locale
export LC_ALL=en_US.UTF-8

# defaults
export TERMINAL=alacritty
export PAGER=less
export VISUAL=nvim
export TERM="xterm-256color"
export GPG_TTY=$(tty)
export EDITOR='nvim'
export RANGER_LOAD_DEFAULT_RC=FALSE

# less
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# local bin used for user scripts and pip installations
export PATH=$HOME/.local/bin:$PATH

# aliases
alias vim='nvim'
alias ls='ls --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

if [[ "$(hostname)" == "nick-Latitude-E7450" ]]; then
  alias alacritty='alacritty --config-file ~/.config/alacritty/alacritty-laptop.yml'
fi


