set nocompatible "Use Vim settings, rather then Vi settings | should be on very start of this file

" General
set noswapfile "Do not use a swapfile for the buffer of each opened file, keep them in memory
set history=500 "Remember history of commands up to this number

" Performance
set ttyfast "Improves smoothness of redrawing
set lazyredraw "Do not redraw screen  while executing macros

" Search
set ignorecase "Ignore case when search
set smartcase "Ignore case when the pattern contains lowercase letters only
set incsearch "Do incremental searching - to to result once typed
set hlsearch  "Highlight found matches
" Disable search highlighting until the next search (NORMAL MODE)
nnoremap <CR> :noh<CR><CR>

"Load plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Indentation, code look
set tabstop=2 "Number of spaces for <Tab>d
set softtabstop=2 "Number of spaces for <Tab> in isert mode
set shiftwidth=2 "Number of spaces used when >> or << pressed
set shiftround "Round indent to tabstop when >> or << pressed
set nowrap "Long lines will not wrap and only part of long lines will be displayed

function ToggleIndentType() "Toggling between spaces and tabs indentation
  if &expandtab
    set noexpandtab
  else
    set expandtab
  endif
endfunction
nmap <F4> mz:execute ToggleIndentType()<CR>'z

set list listchars=tab:>-,trail:~,nbsp:· "Show tabs and extra whitespace
set cursorline "Highlight the line with the cursor
set number "Print the line number in front of each line.
set relativenumber "Show the line number relative to the line with the cursor
set colorcolumn=120,200 "Show vertical lenes at these points separated by comma
set laststatus=2 " Always show the statusline
set encoding=utf-8 "To show Unicode glyphs"

" Style
let base16colorspace=256  " Access colors present in 256 colorspace"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
colorscheme base16-default
set background=dark
highlight Comment cterm=italic
highlight htmlArg cterm=italic

" change color of tabs
autocmd TabEnter * hi TabLineSel ctermbg=brown
autocmd TabEnter * hi TabLineSel ctermfg=white

" Leader Mappings
map <Space> <leader>
":update is Like ":write", but only write when the buffer has been modified
map <Leader>w :update<CR>
map <Leader>q :qall<CR>

map <Leader>ga :Git add %:p<CR><CR>
map <Leader>gb :Git branch<Space>
map <Leader>gc :Gcommit<CR>
map <Leader>ge :Gedit<CR>
map <Leader>gm :Gmove<Space>
map <Leader>go :Git checkout<Space>
map <Leader>gp :Gpush<CR>
map <Leader>gpl:Git pull -p<CR>
map <Leader>gs :Gstatus<CR>


"Other
set showcmd "Show (partial) command in the last line of the screen.

" Open new split panes to right and bottom, which feels more natural
set splitbelow "Put new split panel below the current one |:split
set splitright "Put new split panel rigth the current one |:vsplit

" Reduce timeout after <ESC> is recvd. This is only a good idea on fast links.
set ttimeout
set ttimeoutlen=20
set notimeout

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"Disable Ex mode; remap it to quit the current window/tab.
map Q :q<CR>

" Auto completion by <Tab> when typing
" will insert tab at beginning of line, will use completion if not at beginning
set wildmode=list:longest,list:full "Completion mode
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-p>

" CTRL-C for Copy (VISUAL MODE)
vnoremap <C-C> "+y
" CTRL-V for Paste (INSERT MODE)
inoremap <C-V> <Esc>"+gpi

" Copy filename to clipboard
noremap <silent> <F8> :let @+=expand("%:t")<CR>
" Copy relative file path to clipboard
noremap <silent> <F7> :let @+=expand("%")<CR>
" Copy full file path to clipboard
noremap <silent> <F6> :let @+=expand("%:p")<CR>

" THINGS TODO ON NEW INSTALL
"
" the_silver_searcher for rking/ag.vim
"
" git clone https://github.com/ggreer/the_silver_searcher.git
" cd the_silver_searcher
" sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
" ./build.sh
" sudo make install
" cd ../
" rm -rf the_silver_searcher

" To Investigate

" Quicker tabs movement
" nnoremap <C-t> :tabnew<CR>
" nnoremap <S-h> :tabprevious<CR>
" nnoremap <S-l> :tabnext<CR>
" nnoremap <C-h> :tabmove -1<CR>
" nnoremap <C-l> :tabmove +1<CR>

" " Auto resize Vim splits to active split
" set winwidth=104
" set winheight=5
" set winminheight=5
" set winheight=999
