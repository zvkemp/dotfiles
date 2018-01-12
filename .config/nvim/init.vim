set mouse=""
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

set number

set encoding=utf-8

set hlsearch
set incsearch
"set ignorecase
"set smartcase

map <CR> :nohl<cr>

" fixes slow/flickery scrolling issue
set lazyredraw

"set cursorline
set title

call plug#begin('~/.config/nvim/plugged')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1
    " use tab for completion
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

  Plug 'sheerun/vim-polyglot'

  Plug '/Users/zach/workspace/molokai'
  Plug 'neomake/neomake'
    " Run Neomake when I save any buffer
    augroup localneomake
      autocmd! BufWritePost * Neomake
    augroup END
    " Don't tell me to use smartquotes in markdown ok?
    let g:neomake_markdown_enabled_makers = []
    let g:neomake_elixir_enabled_makers = ['mix', 'credo']

  Plug 'tpope/vim-projectionist'
  " Plug 'c-brenn/phoenix.vim'

  " elixir/erlang docs
  Plug 'slashmili/alchemist.vim'
  Plug 'powerman/vim-plugin-AnsiEsc'

  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-eunuch'
  Plug 'bronson/vim-trailing-whitespace'

  " Plug 'ctrlpvim/ctrlp.vim'
  Plug 'mileszs/ack.vim'
  Plug 'scrooloose/nerdtree'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'mattn/emmet-vim'

call plug#end()

set background=dark
syntax enable
colorscheme molokai

" http://damien.lespiau.name/blog/2009/03/18/per-project-vimrc/
set exrc " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc files

syntax on
filetype plugin indent on

set ruler
set showcmd
set laststatus=2
set t_Co=256
set modeline

" let g:ctrlp_show_hidden = 1
" let g:ctrlp_match_window = 'max:15,results:15'
" let g:ctrlp_root_markers = ['.ctrlp']
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$|\public$\|\bundle$\|\tmp$',
"   \ 'file': '\.exe$\|\.so$\|\.dat$'
"   \ }

" Turn backup off:
set nobackup
set nowb
set noswapfile

set wildmenu
set wildmode=full

" disable arrows
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

noremap <C-C> :w !pbcopy<CR><CR>

exe 'syn keyword rubyKeyword let'


let g:gitgutter_sign_removed = '<<'
let g:gitgutter_sign_added = '>>'
let g:gitgutter_sign_modified = '<>'
let g:gitgutter_sign_modified_removed = '><'

autocmd BufWritePre *.rb,*.coffee,*.exs,*.ex,*.haml,*.erb,*.js :%s/\s\+$//e

au BufRead,BufNewFile *.arb setfiletype=ruby

hi Modified guibg=darkcyan guifg=black ctermbg=darkcyan ctermfg=black
" set statusline+=%#Modified#
" set statusline+=%{fugitive#statusline()}
" set statusline+=%*

map <C-n> :NERDTreeToggle<CR>

" Use the_silver_searcher for Ack
let g:ackprg = 'ag --nogroup --nocolor --column'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/admin_assets/*,*.png,bundle/*,*/bundle*/*,*/public/resources/*
" let g:ctrlp_user_command = 'ag %s --nocolor --smart-case --nogroup --hidden
"       \ --ignore .git
"       \ --ignore .svn
"       \ --ignore .DS_Store
"       \ --ignore "**/*.swf"
"       \ --ignore "**/*.png"
"       \ --ignore bundle
"       \ -g ""'
let g:jsx_ext_required = 0

let g:vim_json_syntax_conceal = 0

let g:ruby_indent_assignment_style = 'variable'
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#wordcount#enabled = 0

" Mapping selecting mappings
" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab> <plug>(fzf-maps-o)
" export FZF_DEFAULT_COMMAND='ag -g ""'
nnoremap <c-p> :FZF<cr>
nnoremap <c-o> :Ag<cr>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

map <ESC><ESC> :w<CR>

:highlight NeomakeErrorMsg ctermfg=227 ctermbg=237
let g:neomake_warning_sign={'text': '⚠', 'texthl': 'NeomakeErrorMsg'}
:highlight NeomakeError ctermfg=225 ctermbg=160
let g:neomake_error_sign={'text': '✖', 'texthl': 'NeomakeError'}
:highlight NeomakeWarning cterm=underline
