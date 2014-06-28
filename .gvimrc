" ----------------------------------------------------------------
" Font
" https://github.com/Lokaltog/powerline-fonts/tree/master/SourceCodePro
set guifont=Source\ Code\ Pro\ Medium:h12,Source\ Code\ Pro\ for\ Powerline:h12,MS_Gothic:h12
set guifontwide=MS_Gothic:h12,ヒラギノ丸ゴ\ Pro:h12  " あいうえお

" ----------------------------------------------------------------
" Coloring
" https://github.com/tomasr/molokai
let g:molokai_original=1
colorscheme molokai

highlight Visual guibg=#666633
highlight Search guifg=#666600 guibg=#CCCC99
highlight Comment guifg=#66CC99

" highlight ZenkakuSpace guibg=darkgray
" match ZenkakuSpace /　/
highlight EndSpace guibg=darkgray
match EndSpace /\s\+$/

" ----------------------------------------------------------------
" Tab
set guioptions-=T
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT

" ----------------------------------------------------------------
" Window
if has("win32")
	nnoremap <C-N> :!start gvim<CR>
endif

" ----------------------------------------------------------------
" Indent Guids
" https://github.com/nathanaelkane/vim-indent-guides
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1

