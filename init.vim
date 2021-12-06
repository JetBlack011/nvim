call plug#begin()
" Plug 'joshdick/onedark.vim'
Plug 'Mofiqul/dracula.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'sirver/ultisnips'
Plug 'neoclide/coc-snippets'
call plug#end()

""" Basic thing-a-ma-bobs
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase              " case insensitive
set hlsearch                " highlight search
" set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set breakindent
set number norelativenumber
autocmd InsertEnter * set relativenumber
autocmd InsertLeave * set norelativenumber
set wildmode=longest,list   " get bash-like tab completions
" set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set spelllang=en_us
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

""" Terminal colors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" colorscheme onedark
colorscheme dracula

""" Telescope commands
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ft <cmd>Telescope git_files<cr>
nnoremap <leader>ftg <cmd>lua require('telescope.builtin').live_grep{ cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }<cr>

""" LaTeX config
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_compiler_method='latexmk'
let g:vimtex_quickfix_mode=0
" set conceallevel=1
" let g:tex_conceal='abdmg'
" let g:tex_conceal='abdmg'
" hi Conceal ctermbg=none
setlocal spell

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsEditSplit='horizontal'

:command RefreshSnippets call UltiSnips#RefreshSnippets()<bar>CocRestart
