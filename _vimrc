"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim

colorscheme pablo

"set nocompatible
set smartcase
set autoread 
set ignorecase 
set tabstop=3
set shiftwidth=3
set expandtab "use spaces instead of tabulators
set smarttab
set wildmode=list:longest
set history=50 "keep 50 lines of command line history
set ruler "show cursor position everytime
set path+=.
set nobackup
set backupdir=$VIMRUNTIME/backup
set autoindent " auto tab
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set directory=$VIMRUNTIME/temp
set incsearch
set hidden " allow to switch buffers without saving


cd H:\vim_docs

"Folding
set foldtext=getline(v:foldstart).'...[+'.(v:foldend-v:foldstart).'lines]...'
set fillchars=fold:-

filetype plugin indent on
syntax on

"Scroll page down and up in normal mode
nmap <C-j> <PageDown>
nmap <C-k> <PageUp>

"Jumping through history in cmd line mode
cmap <C-j> <Down>
cmap <C-k> <Up>

"Previous buffer in normal mode
nmap <C-h> <Esc>:bp<CR>

"Next buffer in normal mode
nmap <C-l> <Esc>:bn<CR>

"F2 is Save file
noremap <F2> <Esc>:update<CR>
vnoremap <F2> <Esc>:update<CR>
inoremap <F2> <Esc>:update<CR>
cmap <F2> <Esc>:w<CR>

"F3 is Quick Fix list
nmap <F3> <Esc>:copen<CR>

"F5 is diff between backup and current version of file
nmap <F5> <Esc>:vert diffsplit expand("%:p").'~'

"F7 is making tags for current file folder
nmap <F7> <Esc>:call MakeTags()<CR>

"F8 is list of matched tags
nmap <F8> <Esc>:ts <C-r><C-w><CR>

"F9 removes search highlighting
map <F9> <Esc>:call SwitchHighlight()<CR>

"F10 is to change current dir according to file is currently opened
map <F10> <Esc>:lcd %:p:h<CR>

"F11 is Show/Hide line number
map <F11> <Esc>:set invnumber<CR> 

" F12 on/off menu
nmap <F12> <ESC>:call ToggleMenu()<CR>

" Ctrl-n, Ctrl-p is next and previous item in Quick Fix list
nmap <C-n> <Esc>:cnext<CR>
nmap <C-p> <Esc>:cprevious<CR>

" CTRL-C is Copy
vnoremap <C-C> "+y

" CTRL-V is Paste
map <C-V> "+gP

"Consolas font:
"http://www.microsoft.com/downloads/details.aspx?familyid=22e69ae4-7e40-4807-8a86-b3d36fab68d3&displaylang=en 
set guifont=Consolas:h10:cRUSSIAN
autocmd BufEnter *.txt set guifont=Courier\ New:h10:cRUSSIAN

highlight Folded term=standout ctermfg=11 ctermbg=8 guifg=Black guibg=DarkGrey
highlight FoldColumn guibg=Black guifg=Yellow 
highlight DiffDelete guifg=Yellow guibg=#6A0000
highlight DiffAdd guibg=#00006A
highlight DiffChange guibg=#700070
highlight DiffText guibg=Yellow guifg=Black
highlight Title guibg=Black guifg=Magenta term=standout
highlight IncSearch guibg=Red guifg=Black 
highlight Special guifg='light blue' 
highlight LineNr guifg=#006070
highlight Pmenu guibg=#6A0000

highlight Note guibg='light blue' guifg='black'
highlight Blue guibg='blue' guifg='white'
highlight Green guibg='green' guifg='black'
highlight Red guibg='red' guifg='yellow'

"Alt+1 show matches as Note
nmap <A-1> <Esc>:1match Note /<C-r><C-w>/<CR>

"Alt+2 show matches as Note
nmap <A-2> <Esc>:2match Blue /<C-r><C-w>/<CR>

"Alt+3 show matches as Note
nmap <A-3> <Esc>:3match Green /<C-r><C-w>/<CR>

"Alt+3 show matches as Note
nmap <A-4> <Esc>:3match Red /[1-9]\d*\serror(s)/<CR>

"Alt+f shows the current function name in C-proggram
nmap <C-k> <Esc>:call ()<CR>

" Cursor blinking off
highlight Cursor gui=NONE guifg='black' guibg='dark gray'
set guicursor+=a:blinkon0 

"VIM window
winsize 120 40
winpos 120 60

set guioptions-=T "No toolbar
set guioptions-=m "No menu
set guioptions-=r "No scrollbar

let g:dbext_default_buffer_lines = 15
let g:dbext_default_use_sep_result_buffer = 0

" register SSPTestTool script file type as python file
au BufNewFile,BufRead *.ssp set filetype=python
au BufNewFile,BufRead *.bdc set filetype=python

" highlight wrong spelled comments and strings in python and c++ files  
au BufNewFile,BufRead *.py setlocal spell 
au BufNewFile,BufRead *.ssp setlocal spell 
au BufNewFile,BufRead *.h setlocal spell 
au BufNewFile,BufRead *.cpp setlocal spell 

" Turn off/on menu.
function ToggleMenu()
    let old_guioptions = &guioptions
    if stridx(old_guioptions, 'm') != -1
        set guioptions-=m
    else
        set guioptions+=m
    endif
endfunction

function SwitchHighlight()
    exe "set invhlsearch"
    exe "match"
endfunction

"exe 'call ShowLongLines(100)'
