call plug#begin()
" Plug 'joshdick/onedark.vim'
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'Mofiqul/dracula.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'lervag/vimtex'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'KeitaNakamura/tex-conceal.vim'
"Plug 'neoclide/coc-snippets'
Plug 'petRUSHka/vim-sage'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'simrat39/symbols-outline.nvim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Autocompletion Engine
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
" Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lua'

"  Snippets
" Plug 'L3MON4D3/LuaSnip'
" Plug 'rafamadriz/friendly-snippets'
"Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'sirver/ultisnips'

Plug 'github/copilot.vim'
call plug#end()

""" Basic thing-a-ma-bobs
"set termguicolors
" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
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
autocmd InsertEnter * set norelativenumber 
autocmd InsertLeave * set relativenumber
set wildmode=longest,list   " get bash-like tab completions
" set cc=100                   " set an 80 column border for good coding style
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set scrolloff=10
set spelllang=en_us
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
set mouse=a
nnoremap <C-w>h <C-w>s
nnoremap <C-n> :nohl<cr>

" Braces
inoremap {<cr> {<cr>}<c-o>O
inoremap [<cr> [<cr>]<c-o>O
inoremap (<cr> (<cr>)<c-o>O

let g:loaded_perl_provider = 0

""" Terminal colors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" colorscheme onedark
colorscheme dracula

""" Telescope commands
nnoremap <leader>gf <cmd>Telescope find_files<cr>
nnoremap <leader>gg <cmd>Telescope live_grep<cr>
nnoremap <leader>gb <cmd>Telescope buffers<cr>
nnoremap <leader>gh <cmd>Telescope help_tags<cr>
nnoremap <leader>gm <cmd>Telescope man_pages<cr>
nnoremap <leader>gtf <cmd>Telescope git_files<cr>
nnoremap <leader>gtg <cmd>lua require('telescope.builtin').live_grep{ cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }<cr>


nnoremap z1 [d1z=

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
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

nnoremap <leader>erc <cmd>e ~/.vimrc<cr>
nnoremap <leader>el <cmd>e ~/texmf/tex/latex/commonstuff/<cr>
nnoremap <leader>rc <cmd>source ~/.vimrc<cr>

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsEditSplit='horizontal'

":command RefreshSnippets call UltiSnips#RefreshSnippets()<bar>CocRestart

" VimTeX figures
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

" Copilot
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" LSP stuff
lua require('lsp')
