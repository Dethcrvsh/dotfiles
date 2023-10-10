" ================================================================
" ===============|           VIM PLUG             |===============
" ================================================================

" Automatically install vim plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'preservim/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin'
  " Icons for files in NerdTree
  Plug 'ryanoasis/vim-devicons'
  " Colors for different files in NerdTree
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'dylanaraps/wal.vim'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'airblade/vim-gitgutter'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" ================================================================
" ===============|         CUSTOMIZATIONS         |===============
" ================================================================

colorscheme wal
set number

" Used to make GitGutter more responsive
set updatetime=100
" Always add the gutter
set scl=yes

" Remember folds between sessions
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

" Move between windows/create new ones
func! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfu
 
nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :call WinMove('l')<cr>

" ================================================================
" ===============|           NERDTREE             |===============
" ================================================================

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" ================================================================
" ===============|             COC                |===============
" ================================================================

let g:coc_global_extensions = ['coc-json', 'coc-git']

