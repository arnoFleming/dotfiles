execute pathogen#infect()
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

" Whitespace
set nowrap                     " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Display line numbers
set number
" Leader key
let mapleader = ','

" Enable mouse in all modes
set mouse=a

" Place backups and swaps outside project directory
set backupdir=~/.vim/backup
set directory=~/.vim/swap

" Display tabs
set list
set listchars=tab:┊\ ,

" Highlight trailing spaces
match ErrorMsg '\s\+$'

" Remove trailing whitespace
" First define a function to remove the trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
" Map it to a key combination
nnoremap <silent> <Leader>rtw :call TrimWhiteSpace()<CR>

" Remove trailing spaces on save
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

autocmd FileType gitcommit setlocal spell textwidth=72
autocmd FileType md,markdown setlocal spell

" Folding
set foldmethod=syntax

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " lets search from our vim path, not relative to our repository
  let g:ctrlp_working_path_mode = ''
  " bind \ (backward slash) to grep shortcut
  command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
endif

" bind K to grep the word under our cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Open the error window automatically when there are errors. And automatically close when there are no errors.
let g:syntastic_auto_loc_list = 1
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_javascript_checkers = ['jshint']

" splits open where most ltr people expect em
set splitbelow
set splitright

map <F3> :tabp<CR>
map <F4> :tabn<CR>

" switch buffers with F5 and numeric keys
:nnoremap <F5> :buffers<CR>:buffer<Space>

map <F2> :NERDTreeToggle<CR>

" Use jsx formating in  jsx and js files alike
let g:jsx_ext_required = 0

" colours and related settings
set colorcolumn=80,100

" Ruby help
map <Leader>p irequire"pry";binding.pry<esc>:w<cr>

" Handle tmux $TERM quirks in vim
if $TERM =~ '^screen-256color'
  map <Esc>OH <Home>
  map! <Esc>OH <Home>
  map <Esc>OF <End>
  map! <Esc>OF <End>
endif

" set t_Co=16
set t_Co=256
set background=light
colorscheme solarized

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
set laststatus=2
