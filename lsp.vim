" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

lua << EOF
require('telescope').setup{
    defaults = { file_ignore_patterns = { "node_modules" }}
}
require("symbols-outline").setup()
-- require('lsp')
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
}
local lsp = require('lsp-zero')
lsp.preset('recommended')
-- lsp.configure('texlab', {
-- 	-- cmd = {"texlab", "-vvvvv","--log-file", "/tmp/texlab.log"},
-- 	settings = {
-- 		texlab = {
-- 			build = {
-- 				args = {"-pdf"},
-- 				onSave = true,
-- 				forwardSearchAfter = true
-- 			},
-- 			forwardSearch = {
--                 executable = "zathura",
--                 args = {"--synctex-forward", "%l:1:%f", "%p"},
--                 onSave = true;
-- 			}
-- 		}
-- 	}
-- })
lsp.setup()

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
