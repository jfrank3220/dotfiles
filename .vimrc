""
"" Basic setup
""
set nocompatible      " be iMproved, required
filetype off          " required
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set expandtab         " Always indent using spaces

""
"" Vundle and Plugins
""
set rtp+=~/.vim/bundle/Vundle.vim "set runtime path
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'L9'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'chrisbra/csv.vim'
Plugin 'christoomey/vim-system-copy'
Plugin 'ervandew/supertab'
Plugin 'garbas/vim-snipmate'
Plugin 'junegunn/fzf.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rvm'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'w0rp/ale'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

""
"" Whitespace
""

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set backspace=indent,eol,start    " backspace through everything in insert mode

""
"" Searching
""

set hlsearch                      " highlight matches
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " ... unless they contain at least one capital letter

""
"" Fzf mappings
""
set rtp+=/usr/local/opt/fzf
nnoremap <silent> <C-p> :FZF<cr>
nnoremap <silent> <Leader>p :FZF<cr>
inoremap <silent> <C-p> <ESC>:FZF<cr>
inoremap <silent> <Leader>p <ESC>:FZF<cr>

""
"" Ale settings
""
let g:ale_set_highlights = 1
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop']
\}
let g:ale_fix_on_save = 0
let g:ale_linters = {
\   'html': ['htmlhint'],
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\   'scss': ['stylelint']
\}

""
"" Fugitive mappings
""
map <Leader>gb :Gblame<Cr>
map <Leader>gs :Gstatus<CR>
map <Leader>gd :Gdiff<CR>

""
"" Cursor display
""

if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\" " Vertical bar in insert mode in Tmux session
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\" " Block in normal mode in Tmux session

""
"" RSpec.vim mappings
""
let g:rspec_command = "!rspec {spec}"
map <Leader>r :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

""
"" Miscellaneous
""

" Open .vimrc with <leader>v
nmap <leader>v :tabedit $MYVIMRC<CR>
" Remap jk to escape
inoremap jk <esc>l
" Copy current file path to clipboard
nnoremap <Leader>c :let @+=expand('%:p')<CR>

""
"" Airline
""
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = '%{@%}'
let g:airline_section_c = airline#section#create(['branch'])
let g:airline#extensions#ale#enabled = 1

""
"" Color
""
if has('gui_running')
  syntax enable
  set background=dark
  set transparency=15
endif

""
"" Wild settings
""

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

""
"" File types
""

" Turn on filetype plugins (:help filetype-plugin)
filetype plugin indent on

""
"" General Mappings (Normal, Visual, Operator-pending)
""

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" Adjust viewports to the same size
map <Leader>= <C-w>=

""
"" NERDCommenter
""
map <Leader>/ <plug>NERDCommenterToggle<CR>

""
"" NERDTree mappings
""

" Default mapping, <leader>n
map <leader>n :NERDTreeToggle<CR>:NERDTreeMirror<CR>

let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
