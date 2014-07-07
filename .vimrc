set ai
set nu
set nobackup
set noswapfile
set noundofile
" set clipboard=unnamed

set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix

nnoremap <C-C><C-D> :cd %:h<CR>
nnoremap <C-C><C-S-D> :lcd %:h<CR>
nnoremap <C-Z> za
imap <C-@> <C-[>

inoremap <C-F><C-D> <C-R>=strftime('%Y-%m-%d')<CR>

" ----------------------------------------------------------------
" NeoBundle
" http://qiita.com/items/1c32d3f24cc2919203eb

set nocompatible
filetype off

if has('vim_starting')
	if has('win32')
		set runtimepath+=~/vimfiles/bundle/neobundle.vim
		call neobundle#rc(expand('~/vimfiles/bundle/'))
	else
		set runtimepath+=~/.vim/bundle/neobundle.vim
		call neobundle#rc(expand('~/.vim/bundle/'))
	endif
endif

filetype plugin indent on     " required!
filetype indent on
syntax on

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'

" ----------------------------------------------------------------
" ZenCoding/emmet
NeoBundle 'mattn/emmet-vim'
let g:user_emmet_settings = {
\ 'lang' : 'ja',
\ 'html' : {
\   'indentation' : '	'
\ },
\}

" ----------------------------------------------------------------
" Unite.vim
" https://github.com/Shougo/unite.vim
NeoBundle 'Shougo/unite.vim'
nmap <C-W><C-W> :Unite file file/new<LF>A
nmap <C-W><C-F> :Unite file file/new<LF>A
nmap <C-W><S-F> :Unite file file/new<LF>A
nmap <C-W><S-P> :Unite file -auto-preview<LF>A
nmap <C-W><C-B> :Unite buffer<LF>A
nmap <C-W><S-B> :Unite bookmark<LF>A

NeoBundle 'h1mesuke/unite-outline'
nmap <C-W><C-O> :Unite outline<LF>A
"nmap <C-W><C-O> :Unite -vertical -winwidth=20 outline<LF>kA

" ----------------------------------------------------------------
" open-browser.vim
NeoBundle 'tyru/open-browser.vim'
nmap <Leader>o <Plug>(openbrowser-open)

" ----------------------------------------------------------------
" http://qiita.com/items/ab70f914a6a577e25d70
NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ }
      \ }

" ----------------------------------------------------------------
" http://qiita.com/alpaca_taichou/items/fb442cfa78f91634cfaa
NeoBundle 'kchmck/vim-coffee-script'
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et

" ----------------------------------------------------------------
" Markdown
:command! Marked :!open -a Marked "%"
au BufRead,BufNewFile,BufReadPre *.md set filetype=markdown
autocmd FileType markdown setlocal sw=4 sts=4 ts=4 et

" ----------------------------------------------------------------
" EasyMotion
" http://mba-hack.blogspot.jp/2013/01/vim4.html
NeoBundle 'Lokaltog/vim-easymotion'
let g:Eaotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key=","
let g:EasyMotion_grouping=1
nmap <C-K> ,b
nmap <S-K> H,j
nmap <C-J> ,w

" ----------------------------------------------------------------
" 各言語
augroup vimrc
	autocmd!
	autocmd FileType javascript inoremap <C-F><C-L> console.log();<Esc>hi
	autocmd FileType javascript inoremap <C-F><C-F> function(
	autocmd FileType javascript inoremap <C-F><C-G> ) {<CR>}
	autocmd FileType javascript inoremap <C-F><C-B> .bind(this)
	autocmd FileType javascript inoremap <C-F><C-I> if () {<CR>}<CR>else {<CR>}<Esc>3-wa
	autocmd FileType javascript inoremap <C-F><C-E> try {<CR>}<CR>catch (error) {<CR>}<Esc>2-O
	autocmd FileType javascript inoremap <C-F><C-T> setTimeout(function() {<CR>}.bind(this), 1);<Esc>O<C-I>
	autocmd FileType coffee inoremap <C-F><C-L> console.log <Esc>a
	autocmd FileType coffee inoremap <C-F><C-F> () -><Esc>3hi
	autocmd BufRead * setlocal ts=2 sw=2 noet
	autocmd FileType ruby setlocal et
	autocmd FileType ruby nmap <C-W><C-F> :Unite file file/new<LF>A
	autocmd FileType eruby setlocal et
	autocmd FileType eruby nmap <C-W><C-F> :Unite file file/new<LF>A
augroup END

" ----------------------------------------------------------------
" 諸々
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'vim-scripts/TwitVim'
NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'yuratomo/w3m.vim'
NeoBundle 'editorconfig/editorconfig-vim'
