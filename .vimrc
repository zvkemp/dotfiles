execute pathogen#infect()
set backspace=indent,eol,start
" set clipboard=unnamed

" http://damien.lespiau.name/blog/2009/03/18/per-project-vimrc/
set exrc " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc files
" nmap <F8> :TagbarToggle<CR>

syntax on
filetype plugin indent on
" set background=dark
" colorscheme solarized
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/treetop.vim
set runtimepath^=~/.vim/bundle/colorv.vim


" use spaces instead of tabs
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
" set scrolloff=999

set ruler
set showcmd
set incsearch

set laststatus=2

set t_Co=256

set number

colorscheme molokai

set modeline

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction

:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" let g:ctrlp_custom_ignore = 'uploads\|thumbnails'

let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'max:15,results:15'
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$|\public$\|\bundle$\|\tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

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

set hlsearch

set nocompatible
runtime macros/matchit.vim

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
let g:ctrlp_user_command = 'ag %s --nocolor --smart-case --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .DS_Store
      \ --ignore "**/*.swf"
      \ --ignore "**/*.png"
      \ --ignore bundle
      \ -g ""'
let g:jsx_ext_required = 0

