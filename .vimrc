if has('win32')
let vimfiles_path = '~/vimfiles'
else
let vimfiles_path = '~/.vim'
end

" ----------------------------------------------------------------
" Basic Settings

" Behaviour
set nobackup
set noswapfile
set noundofile

" Display
set autoindent
set number
set shiftwidth=2
set showtabline=2
set softtabstop=2
set tabstop=2

" Encode and Languages
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set spelllang=en,cjk
set spell

" ----------------------------------------------------------------
" Keyboard Shortcuts

nnoremap <Space><Space> <Esc>
nnoremap <S-Right> >iB
nnoremap <S-Left> <iB
nnoremap <C-C><C-D> :cd %:h<CR>
nnoremap <C-L><C-C><C-D> :lcd %:h<CR>
nnoremap <C-Z> za
nnoremap <S-Z> vaBzf
nnoremap <Space>d :diffthis<CR>
nnoremap <Space><S-D> :diffoff!<CR>
nnoremap <Space><C-D> :diffupdate<CR>
imap <C-@> <C-[>

inoremap <C-F><C-D> <C-R>=strftime('%Y-%m-%d')<CR>
inoremap <C-F><S-F> for (var i=0, l=.length; i<l; i++) {<CR>}<Esc>-15la

nnoremap <C-W><C-R> :browse old<CR>

vnoremap <C-C> "+y

:command! W :set columns=80 lines=25

" ----------------------------------------------------------------
" File Types
augroup vimrc
	autocmd!
	autocmd BufRead * setlocal ts=2 sw=2 noet
	autocmd FileType javascript inoremap <C-F><C-L> console.log();<Esc>hi
	autocmd FileType javascript inoremap <C-F><C-F> function(
	autocmd FileType javascript inoremap <C-F><C-G> ) {<CR>}
	autocmd FileType javascript inoremap <C-F><C-B> .bind(this)
	autocmd FileType javascript inoremap <C-F><C-I> if () {<CR>}<CR>else {<CR>}<Esc>3-wa
	autocmd FileType javascript inoremap <C-F><C-E> try {<CR>}<CR>catch (e) {<CR>}<Esc>kkk
	autocmd BufRead,BufNewFile *.js inoremap <C-F><C-T> setTimeout(function() {<CR>}.bind(this), 1);<Esc>O
	autocmd FileType coffee inoremap <C-F><C-L> console.log <Esc>a
	autocmd FileType coffee inoremap <C-F><C-F> () -><Esc>3hi
	autocmd FileType ruby setlocal et
	autocmd FileType ruby nmap <C-W><C-F> :Unite file file/new<LF>A
	autocmd FileType eruby setlocal et
	autocmd FileType eruby nmap <C-W><C-F> :Unite file file/new<LF>A
	autocmd BufNewFile,BufRead *.hbs set filetype=html
augroup END

" ----------------------------------------------------------------
" NeoBundle

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  exe 'set runtimepath+=' . vimfiles_path . '/bundle/neobundle.vim/'
endif

" Required:
call neobundle#begin(expand(vimfiles_path . '/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'othree/html5.vim'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tyru/caw.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'tpope/vim-rails'
NeoBundle 'leafgarland/typescript-vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" ----------------------------------------------------------------
" Emmet
" https://github.com/mattn/emmet-vim
let g:user_emmet_settings = {
	\ 'lang' : 'ja',
	\ 'html' : {
	\   'indentation' : '	'
	\ },
	\}

" ----------------------------------------------------------------
" https://github.com/Shougo/unite.vim
nmap <C-W><S-W> :Unite file_rec directory_rec file/new<LF>
nmap <C-W><C-W> :Unite file file/new<LF>
nmap <C-W><C-B> :Unite buffer<LF>
nmap <C-W><C-M> :Unite bookmark<LF>
nmap <C-W><C-H> :Unite file_mru<LF>
nmap <C-W><C-G> :Unite register<LF>

" Shougo/unite-outline
nmap <C-W><C-O> :Unite outline<LF>
nmap <C-W><S-O> :Unite -vertical -winwidth=20 outline<LF>

" ----------------------------------------------------------------
" https://github.com/tyru/open-browser.vim
nmap <Leader>o <Plug>(openbrowser-open)

" ----------------------------------------------------------------
" itchyny/lightline.vim
" http://qiita.com/items/ab70f914a6a577e25d70
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\   'right': [ [ 'lineinfo' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
	\ }
	\ }

" ----------------------------------------------------------------
" https://github.com/kchmck/vim-coffee-script
" http://qiita.com/alpaca_taichou/items/fb442cfa78f91634cfaa
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et

" ----------------------------------------------------------------
" Markdown
au BufRead,BufNewFile,BufReadPre *.md set filetype=markdown
autocmd FileType markdown setlocal sw=4 sts=4 ts=4 et
if has('win32')
	:command! Marked :silent !"C:/Program Files (x86)/Google/Chrome/Application/chrome.exe" --profile-directory=Default "%"
else
	:command! Marked :!open -a Marked "%"
endif

" ----------------------------------------------------------------
" EasyMotion
" https://github.com/Lokaltog/vim-easymotion
" http://mba-hack.blogspot.jp/2013/01/vim4.html
let g:Eaotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key=","
let g:EasyMotion_grouping=1
nmap <C-k><C-k> ,b
nmap <C-k><C-j> ,w
nmap <C-j> <Plug>(easymotion-s2)

" ----------------------------------------------------------------
" neo-complete
" https://github.com/Shougo/neocomplete.vim
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" ----------------------------------------------------------------
" encomment
" https://github.com/tyru/caw.vim
nmap <Space>k <Plug>(caw:i:toggle)
vmap <Space>k <Plug>(caw:i:toggle)
" nmap <Space><S-k> <Plug>(caw:wrap:toggle)
" vmap <Space><S-k> <Plug>(caw:wrap:toggle)

" ----------------------------------------------------------------
" Multiple Cursors
" https://github.com/terryma/vim-multiple-cursors
nnoremap <Space>/ :MultipleCursorsFind 
nnoremap <Space>* :MultipleCursorsFind <C-r><C-w><CR>
vnoremap <Space>/ :MultipleCursorsFind 
vnoremap <Space>s :<C-h><C-h><C-h><C-h><C-h>MultipleCursorsFind <C-r><C-w><CR>s
" vnoremap <Space>* viw"xy :MultipleCursorsFind <C-r>x<CR>
vnoremap <Space>v "xy :MultipleCursorsFind <C-r>x<CR>

" ----------------------------------------------------------------
" Indent Guides
" https://github.com/nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
