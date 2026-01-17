local map = vim.keymap.set
local opts = { silent = true }

map("n", "<C-w>h", "<C-w>s", opts)
map("n", "<C-n>", ":nohl<CR>", opts)

-- Braces

-- Telescope
map("n", "<leader>gf", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>gg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>gb", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>gh", "<cmd>Telescope help_tags<cr>", opts)
map("n", "<leader>gm", "<cmd>Telescope man_pages<cr>", opts)
map("n", "<leader>gtf", "<cmd>Telescope git_files<cr>", opts)
map("n", "<leader>gtg", "<cmd>lua require('telescope.builtin').live_grep{ cwd = vim.fn.systemlist(\"git rev-parse --show-toplevel\")[1] }<cr>", opts)

map("n", "z1", "[d1z=", opts)
