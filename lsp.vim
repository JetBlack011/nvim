" Use <Tab> and <S-Tab> to navigate through popup menu
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <leader>fo <cmd>LspZeroFormat<cr>

nnoremap gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap <leader>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
nnoremap <leader>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nnoremap <leader>D <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap gu <cmd>lua vim.lsp.buf.references()<CR>
nnoremap K <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap [d <cmd>lua vim.diagnostic.goto_prev()<CR><cmd>lua vim.diagnostic.open_float()<CR>
nnoremap ]d <cmd>lua vim.diagnostic.goto_next()<CR><cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <leader>q <cmd>lua vim.diagnostic.setloclist()<CR>
nnoremap <leader>fo", "<cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap gs <cmd>lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

lua << EOF

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
-- 
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
-- 
--   -- Mappings.
--   local opts = { noremap=true, silent=true }
-- 
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
-- --  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
-- --  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
-- --  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- --  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
-- --  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
-- --  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
-- --  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
-- --  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
-- --  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
-- --  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- --	buf_set_keymap('n', '<leader>ca', "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- --  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
-- --  buf_set_keymap('n', 'gu', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
-- --  buf_set_keymap('n', 'K', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
-- --  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR><cmd>lua vim.diagnostic.open_float()<CR>', opts)
-- --  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR><cmd>lua vim.diagnostic.open_float()<CR>', opts)
-- --  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
-- --  buf_set_keymap("n", "<leader>ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
-- --	buf_set_keymap('n', 'gs', "<cmd>lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>", opts)
-- end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.texlab.setup {
	-- cmd = {"texlab", "-vvvvv","--log-file", "/tmp/texlab.log"},
	-- on_attach = on_attach;
	settings = {
		texlab = {
			build = {
				args = {"-pdf"},
				onSave = true,
				forwardSearchAfter = true
			},
			forwardSearch = {
                executable = "zathura",
                args = {"--synctex-forward", "%l:1:%f", "%p"},
                onSave = true;
			}
		}
	}
}

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
}

nvim_lsp.clangd.setup{
    cmd = {
        "clangd",
        "--fallback-style=webkit"
    }
}
require('telescope').setup{
    defaults = { file_ignore_patterns = { "node_modules" }}
}
require("symbols-outline").setup()

local cmp = require('cmp')
require("cmp_nvim_ultisnips").setup{}
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  sources = {
    { name = "ultisnips" },
    { name = 'nvim_lsp' },
  },
  -- recommended configuration for <Tab> people:
  mapping = {
    ["<Tab>"] = cmp.mapping(
      function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        else
          cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
        end
      end,
      { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
    ),
    ["<S-Tab>"] = cmp.mapping(
      function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        else
            cmp_ultisnips_mappings.jump_backwards(fallback)
        end
      end,
      { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
    ),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
}

EOF
