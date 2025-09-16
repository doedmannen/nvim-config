vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
--vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
--vim.opt.undofile = true

vim.opt.hlsearch = true -- highlight search
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes" -- always keep sign column open
vim.opt.isfname:append("@-@") -- allow @ in file names

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- start show inline diagnostics:
vim.diagnostic.config({
  virtual_text = true,  -- Shows diagnostics as virtual text at end of line
  signs = true,         -- Shows signs in sign column
  underline = true,     -- Underlines problematic text
  update_in_insert = false,  -- Don't update while typing
})
-- end show inline diagnostics

-- start split visibility improvements
vim.opt.fillchars = {
  horiz = '━',     -- Horizontal split line (thick)
  horizup = '┻',   -- Horizontal line going up
  horizdown = '┳', -- Horizontal line going down
  vert = '┃',      -- Vertical split line (thick)
  vertleft = '┫',  -- Vertical line going left
  vertright = '┣', -- Vertical line going right
  verthoriz = '╋', -- Vertical and horizontal crossing
}
vim.api.nvim_set_hl(0, 'WinSeparator', {
  fg = '#E06C75',    -- Light blue - change to your preference
  bg = 'NONE'
})
vim.opt.laststatus = 3  -- Global statusline (shows splits better)
-- end split visibility improvements

