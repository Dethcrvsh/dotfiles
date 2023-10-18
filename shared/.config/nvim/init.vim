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
  Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'karb94/neoscroll.nvim'
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
nnoremap <C-n> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" ================================================================
" ===============|             COC                |===============
" ================================================================

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-sh', 'coc-java', 'coc-markdownlint', 'coc-pyright']

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

# Map enter to autocomplete
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" ================================================================
" ===============|          NEOSCROLL             |===============
" ================================================================

lua require('neoscroll').setup()

" ================================================================
" ===============|          LUALINE               |===============
" ================================================================

lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'pywal',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
END

