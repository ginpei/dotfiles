" # Requirements
"
" - dein.vim
" - Following variables
"   - `dein_home_path`
"   - `dein_plugin_base_path`
"
" ```
" let dein_home_path = '~/.config/dein.vim/repos/github.com/Shougo/dein.vim'
" let dein_plugin_base_path = '~/.config/dein.vim'
" source $HOME/projects/dotfiles/init.vim
" ```
"
" # File Locations for Windows
"
" - Word file (spell): `$VIM/share/nvim/runtime/spell`
" - Color scheme: `$HOME/.vim/colors`
" - Settings in Windows: `$HOME/AppData\Local\nvim\init.vim`

" ----------------------------------------------------------------
" Setting variables

if !exists('dein_home_path')
	dein_home = ''
endif

if !exists('dein_plugin_base_path')
	dein_home = ''
endif

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
" colorscheme default
colorscheme japanesque

" Foldings
set foldmethod=indent
set foldlevelstart=999
set foldopen-=search

" ----------------------------------------------------------------
" Shortcuts

" Basics
imap <C-@> <C-[>
nnoremap <Space><Space> <Esc>

" Files
nnoremap <Tab> :NERDTreeToggle<CR>
nnoremap <Space><Tab> :NERDTreeFind<CR>
" nnoremap <C-C><C-D> :cd %:h<CR>:NERDTreeCWD<CR>
" nnoremap <C-L><C-C><C-D> :lcd %:h<CR>

" Coding
nnoremap <S-Left> <iB
nnoremap <S-Right> >iB
vnoremap <S-S> :sort<cr>

" Search
nnoremap <C-H> ^
vnoremap <C-H> ^
nnoremap <C-L> $
vnoremap <C-L> $
nnoremap <C-/> :noh<CR>

" Folding
function! ToggleSearchFromFoldings()
	if (index(split(&foldopen, ","), "search") < 0)
		set foldopen+=search
	else
		set foldopen-=search
	endif
endfunction
nnoremap <C-Z> za
nnoremap <S-Z> :call ToggleSearchFromFoldings()<cr>

" Diff
nnoremap <Space><C-D> :diffupdate<CR>
nnoremap <Space><S-D> :diffoff!<CR>
nnoremap <Space>d :diffthis<CR>

" Tabs
nnoremap <C-W><C-T> :tabnew<CR>
nnoremap <C-Tab> :tabnext<CR>
nnoremap <C-S-Tab> :tabprevious<CR>

" Windows
nnoremap <C-N> :!start nvim-qt<CR>
" nnoremap <C-N> :!start nvim-qt --qwindowgeometry 1280x850<CR>
:command! W :set columns=80 lines=25
vnoremap <C-C> "+y

" ----------------------------------------------------------------
" Snippet

augroup filetype_javascript
	autocmd!
	autocmd FileType javascript inoremap <buffer> <C-F><C-L> console.log()<left>
	autocmd FileType javascript inoremap <buffer> <C-F><C-D> console.debug('# ')<left><left>
	autocmd FileType javascript inoremap <buffer> <C-F><C-F> function(
	autocmd FileType javascript inoremap <buffer> <C-F><C-G> ) {<CR>}
	autocmd FileType javascript vnoremap <buffer> <leader>B <esc>`<O{<esc>`>o}<esc>%viB>-i <left>|  " surround with {}
augroup END

" ----------------------------------------------------------------
" dein.vim
" https://github.com/Shougo/dein.vim

if &compatible
  set nocompatible
endif

" Required:
let &runtimepath .= ',' . dein_home_path

" Required:
if dein#load_state(dein_plugin_base_path)
  call dein#begin(dein_plugin_base_path)

  " Let dein manage dein
  " Required:
  call dein#add(dein_home_path)

  " call dein#add('')
  call dein#add('Lokaltog/vim-easymotion')  " jump
  call dein#add('Shougo/deoplete.nvim')  " requires Python3
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('ctrlpvim/ctrlp.vim')  " filer
  call dein#add('digitaltoad/vim-pug')
  call dein#add('editorconfig/editorconfig-vim')  " ?
  call dein#add('itchyny/lightline.vim')  " bottom bar
  call dein#add('itchyny/vim-cursorword')  " underline a word
  call dein#add('mattn/emmet-vim')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('posva/vim-vue')
  call dein#add('scrooloose/nerdtree')  " filer
  call dein#add('tpope/vim-fugitive')  " git
  call dein#add('tyru/caw.vim')  " toggle comment
  call dein#add('tyru/open-browser.vim')  " open URL

  " Required:
  call dein#end()
  call dein#save_state()
else
	echom 'Failed to start dein'
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
" call map(dein#check_clean(), "delete(v:val, 'rf')")

" ----------------------------------------------------------------
" Neosnippet

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Do not turn on followings, or double quotations in JSON hide
"" " For conceal markers.
"" if has('conceal')
""   set conceallevel=2 concealcursor=niv
"" endif

let g:neosnippet#snippets_directory="$HOME/.config/neosnippet.vim"

" ----------------------------------------------------------------
" Ctrlp
" https://github.com/kien/ctrlp.vim

let g:ctrlp_custom_ignore = {
	\ 'dir': 'node_modules\|vendor',
	\ }

" ----------------------------------------------------------------
" deoplete.nvim

call deoplete#enable()

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
let NERDTreeShowBookmarks=0
let g:NERDTreeBookmarksSort=0

" ----------------------------------------------------------------
" Indent Guides
" https://github.com/nathanaelkane/vim-indent-guides
" https://github.com/nathanaelkane/vim-indent-guides/issues/31
let g:indent_guides_enable_on_vim_startup = 1

" ----------------------------------------------------------------
" Indent Guides
" https://github.com/editorconfig/editorconfig-vim

" let g:EditorConfig_exec_path = "C:/Users/ginpei/app/editorconfig/bin/editorconfig.exe"
