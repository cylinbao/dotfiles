" Vundle Setup "
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'easymotion/vim-easymotion'
Plugin 'changyuheng/color-scheme-holokai-for-vim'
Plugin 'vim-scripts/ctags.vim'
"Plugin 'vim-scripts/cscope.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'jvirtanen/vim-octave'
call vundle#end()

filetype plugin indent on

colorscheme holokai

" Set ctags tags file path
set tags=./tags,tags;$Home

" Other Settings "
set autoindent
set ruler
set showmode
set ai
set ru
set cursorline
set noshowmatch
set wildmenu
set laststatus=2 
set sw=2
set tabstop=2
set encoding=utf-8
set mouse=a

set statusline=%<\ [%F]
set statusline+=%m
set statusline+=%=\ {\ \%l,\%c\ \}\ \[\ %P\ \]

syntax on

if v:version >= 703
	set cc=81
	"hi ColorColumn ctermbg=lightgrey ctermfg=grey 
endif

"---------- EasyMotion Settings ----------"
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout

" `s{char}{char}{label}`
"nmap s <Plug>(easymotion-overwin-f2)

" HJKL motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" EasyMotion Searching Settings 
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-bd-t2)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
"---------- End of EasyMotion Settings ----------"

"---------- NERDTree Settings ----------"
map <C-n> :NERDTreeTabsToggle<CR>
