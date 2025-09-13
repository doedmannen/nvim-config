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

-- default format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- show diagnostics
vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float)


