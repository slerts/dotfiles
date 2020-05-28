# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# shell history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# path
# typeset prevents path from taking on duplicate entries
typeset -U path
path=($path[@])

# vim keybindings for zsh
bindkey -v

# autocomplete
zstyle :compinstall filename '/home/nick/.zshrc'
autoload -Uz compinit
compinit

# theme
#ZSH_THEME=michelebologna
ZSH_THEME="powerlevel10k/powerlevel10k"

# plugins
plugins=(
	archlinux
	colored-man-pages
	colorize
	copyfile
	cp
	git
	gitfast
	history-substring-search
	safe-paste
	tmux
	zsh-completions
	zsh-autosuggestions
)

# options
# enable autocomplete for aliases
setopt COMPLETE_ALIASES

# mass renaming of files
autoload -Uz zmv

# enable autocomplete for priv env
zstyle ':completion::complete:*' gain-privileges 1

# aliases
alias vim='nvim'
alias ls='ls --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

if [[ "$(hostname)" == "nick-Latitude-E7450" ]]; then
  alias alacritty='alacritty --config-file ~/.config/alacritty/alacritty-laptop.yml'
fi

#fzf keybinds
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# trigger oh-my-zsh
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
