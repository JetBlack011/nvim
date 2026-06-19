local map = vim.keymap.set
local opts = { silent = true }

-- Telescope
map("n", "<leader>gf", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>gg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>gb", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>gh", "<cmd>Telescope help_tags<cr>", opts)
map("n", "<leader>gm", "<cmd>Telescope man_pages<cr>", opts)
map("n", "<leader>gtf", "<cmd>Telescope git_files<cr>", opts)
map("n", "<leader>gtg", "<cmd>lua require('telescope.builtin').live_grep{ cwd = vim.fn.systemlist(\"git rev-parse --show-toplevel\")[1] }<cr>", opts)

-- Spelling correction
map("n", "z1", "[d1z=", opts)

-- Copilot
local copilot_enabled = true
vim.api.nvim_create_user_command("CopilotToggle", function()
    if copilot_enabled then
        vim.cmd("Copilot disable")
        print("Copilot disabled")
    else
        vim.cmd("Copilot enable")
        print("Copilot enabled")
    end
    copilot_enabled = not copilot_enabled
end, {})

map("n", "<leader>cc", "<cmd>CopilotToggle<CR>", opts)
map("i", "<C-j>", "copilot#Accept()", { silent = true, expr = true, noremap = true, replace_keycodes = false })

-- Initialize kernel
vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>")

-- Run current line
vim.keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>")

-- Run visual selection
vim.keymap.set("v", "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>")

-- Run entire cell (if using cell markers like # %%)
vim.keymap.set("n", "<leader>mc", ":MoltenEvaluateOperator<CR>")
