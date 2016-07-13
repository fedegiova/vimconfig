set nocompatible
filetype off

"Enable the 16 colors mode
set t_Co=16
runtime ftplugin/man.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
noremap <leader>g :YcmCompleter GoToImprecise<CR>

Plugin 'fholgado/minibufexpl.vim'
let g:miniBufExplBuffersNeeded = 0
let g:miniBufExplUseSingleClick = 1 " If you would like to single click on tabs rather than double clicking on them to goto the selected buffer. 
let g:miniBufExplTabWrap = 1

Plugin 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:100'

Plugin 'junegunn/vim-easy-align'
Plugin 'digitaltoad/vim-jade'
Plugin 'tpope/vim-dispatch'
Plugin 'altercation/vim-colors-solarized'
Plugin 'freitass/todo.txt-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs.git'
" Consider RTAGS for indexing


if has('gui_running')
let g:airline_powerline_fonts = 1
else
let g:airline_powerline_fonts = 0
endif

let g:airline#extensions#tabline#enabled = 0 " NOTE: When you open lots of buffers and typing text, it is so slow.
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'

Plugin 'rking/ag.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set tabstop=4
set shiftwidth=4
set smarttab
"Use only tabs for python
autocmd FileType python set expandtab

autocmd BufNewFile,BufReadPost *.bb set filetype=bitbake
autocmd BufNewFile,BufReadPost *.bbappend set filetype=bitbake
autocmd BufNewFile,BufReadPost *.bbclass set filetype=bitbake
autocmd BufNewFile,BufReadPost *.shtemplate set filetype=sh
autocmd BufNewFile,BufReadPost *.qml set filetype=qml
autocmd BufNewFile,BufReadPost *.rst set filetype=rst

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
set guifont=Source\ Code\ Pro\ Regular\ 11

"see: http://stevelosh.com/blog/2010/09/coming-home-to-vim/

set encoding=utf8
set tabstop=4
set shiftwidth=4
set smarttab
set number
set expandtab
set undofile

" configure search {
set ignorecase
set smartcase
set gdefault
set hlsearch
"}

if filereadable("_vimrc")
	source _vimrc
endif


if &term =~ '^screen'
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
set t_ut=


nnoremap <tab> % "tab match braces
vnoremap <tab> %

" make jk move by screen line instead of file line {
nnoremap j gj
nnoremap k gk
"}

nnoremap ; :
inoremap jj <ESC>
imap <C-space> <Esc>

nmap H :MBEbp<cr>
nmap L :MBEbn<cr>
map <A-Left> :MBEbp<cr>
map <A-Right> :MBEbn<cr>
map <C-Left> :MBEbp<cr>
map <C-Right> :MBEbn<cr>
map <Leader>c :MBEbd<cr>
nmap @sè <i{
nmap @s+ >i{
nmap <leader>s :%s/\(<c-r>=expand("<cword>")<cr>\)/
nmap <leader>g :Ag <c-r>=expand("<cword>")<cr>
"map <Leader>e :MBEOpen<cr>
"map <Leader>t :MBEToggle<cr>
"map <A-Left> :MBEbf<cr>
"map <A-Right> :MBEbb<cr>
nmap <leader>r :silent! execute '!ssh 172.31.4.4 /sw/Project/artifacts/bin/ProcessControl restart-all' \| :redraw!<cr> 

inoremap <silent> <Up> <ESC><Up>
inoremap <silent> <Down> <ESC><Down>
inoremap <silent> <Left> <ESC><Left>
inoremap <silent> <Right> <ESC><Right>
" imap j <Down>
" imap k <Up>
" imap l <Right>
" imap h <Left>
" nmap j <Down>
" nmap k <Up>
" nmap l <Right>
" nmap h <Left>

map  <Leader>f <Plug>(easymotion-bd-f)


set completeopt=menuone
set exrc
"set secure

set background=dark
colorscheme solarized

let g:ctrlp_max_files=0
set wildignore +=tags

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar


" if has("python")
"   " let python figure out the path to pydoc
"   python << EOF
" import sys
" import vim
" vim.command("let s:pydoc_path=\'" + sys.prefix + "/lib/pydoc.py\'")
" EOF
" else
"   " manually set the path to pydoc
"   let s:pydoc_path = "/path/to/python/lib/pydoc.py"
" endif
" 
" nnoremap <buffer> K :<C-u>let save_isk = &iskeyword \|
"     \ set iskeyword+=. \|
"     \ execute "Pyhelp " . expand("<cword>") \|
"     \ let &iskeyword = save_isk<CR>
" command! -nargs=1 -bar Pyhelp :call ShowPydoc(<f-args>)
" function! ShowPydoc(what)
"   " compose a tempfile path using the argument to the function
"   let path = $TEMP . '/' . a:what . '.pydoc'
"   let epath = shellescape(path)
"   let epydoc_path = shellescape(s:pydoc_path)
"   let ewhat = shellescape(a:what)
"   " run pydoc on the argument, and redirect the output to the tempfile
"   call system(epydoc_path . " " . ewhat . (stridx(&shellredir, '%s') == -1 ? (&shellredir.epath) : (substitute(&shellredir, '\V\C%s', '\=epath', ''))))
"   " open the tempfile in the preview window
"   execute "pedit" fnameescape(path)
" endfunction
