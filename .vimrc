execute pathogen#infect()
" set backspace=indent,eol,start
" set clipboard=unnamed

set nocompatible
"jset runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
"j
"jif dein#load_state('~/.vim/dein/')
"j  call dein#begin('~/.vim/dein/')
"j  call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')
"j  call dein#add('Shougo/deoplete.nvim')
"j  call dein#add('elixir-lang/vim-elixir')
"j  call dein#local('~/.vim/bundle')
"j  call dein#end()
"j  call dein#save_state()
"jendif

" http://damien.lespiau.name/blog/2009/03/18/per-project-vimrc/
set exrc " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc files
" nmap <F8> :TagbarToggle<CR>

syntax on
filetype plugin indent on
" set background=dark
" colorscheme solarized
set runtimepath^=~/.vim/bundle/ctrlp.vim
" set runtimepath^=~/.vim/bundle/treetop.vim
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

noremap <C-C> :w !pbcopy<CR><CR>

set hlsearch

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

let g:vim_json_syntax_conceal = 0

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

let g:ruby_indent_assignment_style = 'variable'
let g:airline_powerline_fonts = 1
let g:deoplete#enable_at_startup = 1

let g:airline#extensions#wordcount#enabled = 0
