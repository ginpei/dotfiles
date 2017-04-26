" ----------------------------------------------------------------
" Basic Settings

" Editor
set autoindent
set ignorecase
set number
set shiftwidth=2
set smartcase
set tabstop=2

" Languages
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set fileformats=unix,dos,mac
set spell
set spelllang=en,cjk

" Colours
colorscheme default

" ----------------------------------------------------------------
" Shortcuts

imap <C-@> <C-[>
nnoremap <Space><Space> <Esc>

" Files
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-C><C-D> :cd %:h<CR>:NERDTreeCWD<CR>
nnoremap <C-L><C-C><C-D> :lcd %:h<CR>
nnoremap <C-p>p :Denite file_rec<CR>
nnoremap <C-p>m :Denite file_mru<CR>
nnoremap <C-p>g :DeniteCursorWord grep<CR>
nnoremap <C-p>y :Denite neoyank<CR>
nnoremap <C-p>b :Denite buffer<CR>

" Coding
inoremap <C-F><C-G> ) {<CR>}
nnoremap <S-Left> <iB
nnoremap <S-Right> >iB

" Folding
nnoremap <C-Z> za
nnoremap <S-Z> vaBzf

" Diff
nnoremap <Space><C-D> :diffupdate<CR>
nnoremap <Space><S-D> :diffoff!<CR>
nnoremap <Space>d :diffthis<CR>

" Tabs
nnoremap <C-Tab> :tabnext<CR>
nnoremap <C-S-Tab> :tabprevious<CR>

" Windows
:command! W :set columns=80 lines=25

" ----------------------------------------------------------------
" dein.vim
" https://github.com/Shougo/dein.vim

if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=/Users/ginpei/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/ginpei/.config/nvim/dein')
  call dein#begin('/Users/ginpei/.config/nvim/dein')

  " Required:
  call dein#add('/Users/ginpei/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  " vvv My plugins
  call dein#add('Lokaltog/vim-easymotion')  " jump
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neoyank.vim')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('itchyny/lightline.vim')  " bottom bar
  call dein#add('itchyny/vim-cursorword')  " underline a word
  call dein#add('mattn/emmet-vim')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tyru/caw.vim')  " toggle comment
  call dein#add('tyru/open-browser.vim')  " open URL
  " call dein#add('')
  " ^^^ My plugins

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

" ----------------------------------------------------------------
" EasyMotion
" https://github.com/Lokaltog/vim-easymotion
" http://mba-hack.blogspot.jp/2013/01/vim4.html
" let g:Eaotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" let g:EasyMotion_leader_key=","
" let g:EasyMotion_grouping=1
" nmap <C-k><C-k> ,b
" nmap <C-k><C-j> ,w
nmap <C-j> <Plug>(easymotion-sn)

" ----------------------------------------------------------------
" encomment
" https://github.com/tyru/caw.vim
nmap <Space>k <Plug>(caw:hatpos:toggle)
vmap <Space>k <Plug>(caw:hatpos:toggle)
nmap <Space><S-k> <Plug>(caw:wrap:toggle)
vmap <Space><S-k> <Plug>(caw:wrap:toggle)


" ----------------------------------------------------------------
" https://github.com/tyru/open-browser.vim
nmap <Leader>o <Plug>(openbrowser-open)

" ----------------------------------------------------------------
" https://github.com/scrooloose/nerdtree
let NERDTreeShowBookmarks=1

" ----------------------------------------------------------------
" Indent Guides
" https://github.com/nathanaelkane/vim-indent-guides
" https://github.com/nathanaelkane/vim-indent-guides/issues/31
let g:indent_guides_enable_on_vim_startup = 1
