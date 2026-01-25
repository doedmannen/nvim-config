-- Shim for Neovim 0.11+ compatibility (ft_to_lang was removed)
if not vim.treesitter.language.ft_to_lang then
  vim.treesitter.language.ft_to_lang = vim.treesitter.language.get_lang
end

require("doedmannen.lazy")
require("doedmannen.keymappings")
require("doedmannen.set")
require("doedmannen.quick-open-pr")
require("doedmannen.goto-definition-with-import")
require("doedmannen.highlight-yank")

vim.lsp.enable('ts_ls')
vim.lsp.enable('svelte')
