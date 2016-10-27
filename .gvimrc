" ----------------------------------------------------------------
" Font
" https://github.com/Lokaltog/powerline-fonts/tree/master/SourceCodePro
set guifont=Source\ Code\ Pro\ Medium:h12,Source\ Code\ Pro\ for\ Powerline:h12,MS_Gothic:h12
set guifontwide=MS_Gothic:h12,ヒラギノ丸ゴ\ Pro:h12  " あいうえお

" ----------------------------------------------------------------
" Coloring

" Scheme
"" let g:molokai_original=1
"" colorscheme molokai  " https://github.com/tomasr/molokai
colorscheme japanesque

" remove some japanesque's colors which I don't like
highlight Conceal guibg=NONE

" ----------------------------------------------------------------
" Tab
set guioptions-=T
nnoremap <C-W><C-T> :tabnew<LF>
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT

" ----------------------------------------------------------------
" Window
set columns=80
set lines=25
if has("win32")
	nnoremap <C-N> :!start gvim<CR>
endif

" ----------------------------------------------------------------
" Indent Guids
" https://github.com/nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1

