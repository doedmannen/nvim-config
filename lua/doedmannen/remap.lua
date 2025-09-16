vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- if not using oil as the explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move line up or down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- yank to OS clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- black hole delete/replace
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set({"n", "v"}, "<leader>c", [["_c]])
-- paste without yanking
vim.keymap.set("x", "<leader>p", [["_dP]])

-- default format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- read diagnostics
vim.keymap.set("n", "<leader>rd", vim.diagnostic.open_float)

-- autocomplete
vim.keymap.set('i', '<C-Space>', '<C-x><C-o>', { desc = 'Omni completion' })

-- join line with next without moving cursor
vim.keymap.set("n", "J", "mzJ`z")

-- move up/down half a page and center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- move to next/previous search and center (and open any folds)
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- quickfix list
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>qfl", vim.diagnostic.setqflist, { desc = "Open diagnostic quickfix list" })

-- code actions aka codefixes (add missing import etc)
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.code_action, { desc = "Suggest code fix" })

