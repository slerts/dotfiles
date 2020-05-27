" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Themes
    Plug 'joshdick/onedark.vim'
    Plug 'kaicataldo/material.vim'
    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Ranger
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    " FZF (fuzzy file finder)
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Vim rooter
    Plug 'airblade/vim-rooter'
    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'
    " Rainbow Parenetheses
    Plug 'junegunn/rainbow_parentheses.vim'
    " Startify
    Plug 'mhinz/vim-startify'
    " Signify
    Plug 'mhinz/vim-signify'
    " Fugitive
    Plug 'tpope/vim-fugitive'
    " Rhubarb
    Plug 'tpope/vim-rhubarb'
    " gv
    Plug 'junegunn/gv.vim'
    " sneak
    Plug 'justinmk/vim-sneak'
    " which-key
    Plug 'liuchengxu/vim-which-key'
    " snippits
    Plug 'honza/vim-snippets'
    " quickscope
    Plug 'unblevable/quick-scope'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
