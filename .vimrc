"=====================================================
" Vundle settings
"=====================================================
filetype off 

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

filetype plugin indent on 

" neocomplete.vim
" surround.vim
" vim-autoformat
" vim-easy-align
" vim-gitgutter
" vim-json
" vim-repeat


Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
"Foldering
"Bundle 'plasticboy/vim-markdown.git'
"ZenCodding and more
Bundle 'rstacruz/sparkup'
"Automatic closing of quotes, parenthesis, brackets, etc.
Bundle 'Raimondi/delimitMate'
"Bundle 'Shougo/neocomplcache.vim'
"Useful commenting
Bundle 'tomtom/tcomment_vim'
"Git features
Bundle 'tpope/vim-fugitive'
"Generating tags
Bundle 'szw/vim-tags.git'
"Showing tags in bar
Bundle 'majutsushi/tagbar'
"Syntax checking plugin / also style checking
Bundle 'scrooloose/syntastic'
" vim syntax for LESS
" Bundle 'groenewege/vim-less'
" Open non text files from nerdtree with an appropriate application.
Bundle 'aufgang001/vim-nerdtree_plugin_open'
" Vim plugin to auto reload browser in Linux
" Bundle 'lordm/vim-browser-reload-linux'

" Color schemes
Bundle 'Lokaltog/vim-distinguished'
" Bundle 'nanotech/jellybeans.vim'

Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" NERDTree
let NERDTreeIgnore=['\.sh$'] " do not show *.sh files
map <C-n> :NERDTreeToggle<CR> " open NERDTree by Ctrl-n

" Tagbar
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1 " автофокус на Tagbar при открытии

" Syntastic
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_less_checkers = ['lessc']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_check_on_open = 1 "Check on file open
" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_less_options = "--no-color"

" JsHint
if filereadable("jsHintConfig.json")
  let g:syntastic_javascript_jshint_args = "--config jsHintConfig.json" "  Read config file
endif
" Jump between errors
" nnoremap <C-[> :lprevious<CR>
" nnoremap <C-]> :lnext<CR>


"" JS 
""let g:tagbar_type_javascript = {
""    \ 'ctagsbin' : '/home/ihor/node_modules/javascript-ctags/bin/javascript-ctags'
""	\ }
"
"" CSS
"let g:tagbar_type_css = {
"			\ 'ctagstype' : 'Css',
"    \ 'kinds'     : [
"        \ 'c:classes',
"        \ 's:selectors',
"        \ 'i:identities'
"    \ ]
"	\ }


" Configure NerdtreePluginOpen
let g:nerdtree_plugin_open_cmd = 'gnome-open'

" Airline
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs"

" Other ...

"" Syntax highlighting enables.
"if has("syntax")
"  syntax on
"endif

"Add number of rows
set number

"Width of input field
" set textwidth=80
" set formatoptions+=t

" Allow vim to be colored
set t_Co=256

" Set default color scheme
colorscheme distinguished

" change color of tabline
autocmd TabEnter * hi TabLineSel ctermbg=brown
autocmd TabEnter * hi TabLineSel ctermfg=white

set colorcolumn=80 "Set vertical lene at 80
" change color of text over length (80)
highlight OverLength ctermbg=lightred ctermfg=black
match OverLength /\%81v.\+/  " All characters after 80-s will highlighted

"----------------------------------------------------------------------------
" My old vimrc

"горизонтальная линия
set cursorline
"размер табуляции при нажатии клавиши 'Tab'
set softtabstop=2
set tabstop=2
" size of an indent
"размер табуляции при смещении при помощи 'Shift + >'
set shiftwidth=2


"пробелы вместо табуляции
" set expandtab
"отображение выполняемой команды
set showcmd 
"включение автоотступоов
set cin

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
" map <C-V>       "+gP
map <S-Insert>      "+gP

" cmap <C-V>      <C-R>+
cmap <S-Insert>     <C-R>+

"toggle :set paste
" nnoremap <C-P> :set invpaste paste?<CR>
" set pastetoggle=<C-P>
" set showmode

"Move the tab to the left
map <C-H> :execute "tabmove" tabpagenr() - 2 <CR> 
"Move the tab to the right
map <C-L> :execute "tabmove" tabpagenr() <CR> 

"открывать NERDTree и Tagbar при запуске vim
autocmd vimenter * if !argc() | NERDTree | endif
"autocmd vimenter * TagbarToggle



"restart tomcat
map <F5> :! sh ./bash.sh <CR> 

"rebuild browserapplet
map <F6> :! sh ./updateApi.sh <CR> 

"Compile .less to .css
map <F7> :! sh ./compile-less.sh <CR> 

"по мере набора приближаться к результату поиска
set incsearch

"по нажатию клавиши ; сконструировать запрос на замену слова под курсором
" nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

autocmd BufRead,BufNewFile *.less set filetype=less " it is need for Syntastic ( try :SyntasticInfo )
autocmd BufRead,BufNewFile *.less set syntax=css "  enable css syntax in *.less files

" disable Ex mode
map Q <Nop>


" jump to following tags
"map <C-.> :BreezeJumpF <CR> 

" jump to preceding tags
"map <C-,> :BreezeJumpB <CR> 

" Moving lines up or down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Rename tabs to show tab number
set tabline=%!MyTabLine()
function MyTabLine()
  let s = '' " complete tabline goes here
  " loop through each tab page
  for t in range(tabpagenr('$'))
    " select the highlighting for the buffer names
    if t + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " empty space
    let s .= ' '
    " set the tab page number (for mouse clicks)
    let s .= '%' . (t + 1) . 'T'
    " set page number string
    let s .= t + 1 . ' '
    " get buffer names and statuses
    let n = ''  "temp string for buffer names while we loop and check buftype
    let m = 0 " &modified counter
    let bc = len(tabpagebuflist(t + 1))  "counter to avoid last ' '
    " loop through each buffer in a tab
    for b in tabpagebuflist(t + 1)
      " buffer types: quickfix gets a [Q], help gets [H]{base fname}
      " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
      if getbufvar( b, "&buftype" ) == 'help'
        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
      elseif getbufvar( b, "&buftype" ) == 'quickfix'
        let n .= '[Q]'
      else
        let n .= pathshorten(bufname(b))
        "let n .= bufname(b)
      endif
      " check and ++ tab's &modified count
      if getbufvar( b, "&modified" )
        let m += 1
      endif
      " no final ' ' added...formatting looks better done later
      if bc > 1
        let n .= ' '
      endif
      let bc -= 1
    endfor
    " add modified label [n+] where n pages in tab are modified
    if m > 0
      "let s .= '[' . m . '+]'
      let s.= '+ '
    endif
    " add buffer names
    if n == ''
      let s .= '[No Name]'
    else
      let s .= n
    endif
    " switch to no underlining and add final space to buffer list
    "let s .= '%#TabLineSel#' . ' '
    let s .= ' '
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999XX'
  endif
  return s
endfunction
