vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- if not using oil as the explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move line up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- global copy
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- black hole deletion
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set({"n", "v"}, "<leader>c", [["_c]])

-- default format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

