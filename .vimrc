set nocompatible
filetype off

set runtimepath+=$HOME/.vim/plugin

" installing vundle on fresh machine
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone git@github.com:gmarik/vundle.git ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'

" MY BUNDLES 

" c lang completion
" Plugin 'Valloric/YouCompleteMe' 
" python completion
Plugin 'davidhalter/jedi-vim' 
" supertab!
Plugin 'ervandew/supertab'
" git plugin
Plugin 'tpope/vim-fugitive' 
" easy comments
Plugin 'tpope/vim-commentary' 
" easy movement through file. highlights char searched for
Plugin 'Lokaltog/vim-easymotion' 
" like pastebin
"Plugin 'chilicuil/vim-sprunge' 
" for use with gist-vim
Plugin 'mattn/webapi-vim' 
" for posting gists
Plugin 'mattn/gist-vim' 
" tabman! easily manage tabs and their panes
Plugin 'kien/tabman.vim'
" vimux to ease running cmds quickly
Plugin 'benmills/vimux'
" startify!!!!
Plugin 'mhinz/vim-startify'
" for an awesome statusline
Plugin 'bling/vim-airline'
" blink search result
Plugin 'ivyl/vim-bling'
" LaTeXBox
Plugin 'LaTeX-Box-Team/LaTeX-Box'
" NERDTree file explorer
Plugin 'scrooloose/nerdtree'
" distinguished colorscheme
Plugin 'Lokaltog/vim-distinguished'
" easy surrounding of text
Plugin 'tpope/vim-surround'
" how you want . to work, even though it doesn't
Plugin 'tpope/vim-repeat'
" java completion
Plugin 'javacomplete'
" tmux completion
Plugin 'wellle/tmux-complete.vim'
" syntastic (Lint code checking)
Plugin 'scrooloose/syntastic'

call vundle#end()

" on fresh install will autorun the bundleinstall command
if iCanHazVundle == 0
    echo "Installing bundles...ignore key map error message"
    echo ""
    :PluginInstall
endif

filetype plugin indent on

" colorschemes
syntax enable
set t_Co=256
colorscheme distinguished
set background=dark

if has("autocmd")
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
endif

" always show statusline
set laststatus=2

" smart scroll!
set so=7

" turn on line numbers
set number

" ignore case when searching unless contains a capital letter
set ignorecase
set smartcase
set hlsearch

set showtabline=2
set ic
set showcmd " show incomplete cmds at bottom
set showmode " show cur mode at bottom
set showmatch " show matching parens

" be intelligent
set smartindent
" tab == 4 spaces
set softtabstop=4
set shiftwidth=4
" use spaces instead of tab
set expandtab
set autoindent

" take care of line wrapping stuff
set wrap linebreak nolist

" key bindings
:let mapleader = ','
"map <F2> :sh<CR>
map <F3> :tabnew 
map <F7> :wall<CR>
map <F8> <Plug>Sprunge<CR>
" set pastetoggle=<F9>
map <F12> :Gist<CR>
map <C-o> :NERDTreeToggle<CR>
" for buffers
map <leader>n :bn<CR>
map <leader>p :bp<cr>
" for split panes
map <C-w>1 :sp 
map <C-w>2 :vsp 
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" easy leave insert mode. better hope you never need two i in a row!!
imap jk <Esc>
" folding commands
set foldmethod=marker
set foldcolumn=3
nnoremap <space> za
set foldmethod=syntax
" if &ft == 'python'
"     set foldmethod=indent
"     set foldnestmax=2
" endif

" toggle spell checking
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_us

" can delete a tab by pressing backspace once instead of
" 4 times, one for each space
set backspace=indent,eol,start

" disable them nasty arrow keys
" encourages proper VIm movement
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

" for the truly bold, unbind arrow keys in
" insert mode as well. forces uses of normal mode
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

" bindings and such for sessions
" dont store global & local vals in session
" set ssop-=options

" vimux bindings
let g:VimuxUseNearestPane = 1
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vl :VimuxRunLastCommand<CR>

" startify me cap'n!
map <Leader><Leader>sl :SLoad 
map <Leader><Leader>ss :SSave 
map <Leader><Leader>sd :SDelete 
let g:startify_session_dir = '~/.vim/session'
" could also use 'bookmarks'
let g:startify_list_order = ['files', 'dir', 'sessions']
let g:startify_bookmarks = [ ]
let g:startify_files_number = 5
let g:startify_session_persistence = 1 " auto update session before exiting vim
let g:startify_session_detection = 1 " show session at top when Session.vim is found in current directory
let g:startify_session_autoload = 0 " opening directories with a Session.vim file will have it auto loaded
let g:startify_change_to_dir = 1 " when opening file or bookmark, change to its directory
let g:startify_custom_indices = ['f', 'g', 'h'] " shortcut keys. don't use beiqsv, navigation keys
let g:startify_custom_header = [
            \ '__        __   _                            _         __     ___           _ ',
            \ '\ \      / /__| | ___ ___  _ __ ___   ___  | |_ ___   \ \   / (_)_ __ ___ | |',
            \ ' \ \ /\ / / _ \ |/ __/ _ \| ''_ ` _ \ / _ \ | __/ _ \   \ \ / /| | ''_ ` _ \| |',
            \ '  \ V  V /  __/ | (_| (_) | | | | | |  __/ | || (_) |   \ V / | | | | | | |_|',
            \ '   \_/\_/ \___|_|\___\___/|_| |_| |_|\___|  \__\___/     \_/  |_|_| |_| |_(_)',
            \ '',
            \ '',
            \]

" open vimrc in a new tab
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
" source the vimrc after changes
nnoremap <leader>sv :source $MYVIMRC<cr>
" abbrev for my sig
" iabbrev sig -- <cr>Sean
"             \ Beck<cr>seanmckaybeck@gmail.com<cr>github.com/ThaWeatherman
            
" append closing character mappings
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap { {}<Esc>i
" inoremap " ""<Esc>i
" inoremap ' ''<Esc>i
" inoremap ( ()<Esc>i
" inoremap [ []<Esc>i
" inoremap < <><Esc>i

" latex specific commands
let g:tex_flavor='latex'
augroup latexsettings
    autocmd FileType tex set spell
    set spelllang=en
augroup END

let g:LatexBox_Folding=1
let g:LatexBox_quickfix=2

:map <F2> :w !detex \| wc -w<CR>

let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_autoclose_preview_window_after_insertion=1

if has("autocmd")
    " syntax of languages is fussy and poopy about tabs vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    " my own customizations
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
endif

function! <SID>StripThemWhities()
    " save position in file
    let _s=@/
    let l=line(".")
    let c=col(".")
    " delete trailing whitespaces
    %s/\s\+$//e
    " restore location
    let @/=_s
    call cursor(l, c)
endfunction

nnoremap <silent> <Leader>stw :call <SID>StripThemWhities()<CR>

" Syntastic basic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint2']
