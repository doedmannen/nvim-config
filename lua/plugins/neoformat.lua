return {
  'sbdchd/neoformat',
  config = function()
    -- Enable trying node executables first
    vim.g.neoformat_try_node_exe = 1
    -- Optional: Enable verbose output for debugging
    --vim.g.neoformat_verbose = 1

    -- Auto format on save (optional)
    vim.api.nvim_create_augroup("fmt", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = "fmt",
      pattern = "*",
      callback = function()
        -- Skip formatting for certain file types
        local excluded_filetypes = {"gitcommit", "gitrebase", "help", "markdown"}
        if vim.tbl_contains(excluded_filetypes, vim.bo.filetype) then
          return
        end
        vim.cmd("undojoin | Neoformat")
      end,
    })
    -- Keymaps (optional)
    vim.keymap.set('n', '<leader>fmt', ':Neoformat<CR>', { desc = 'Format buffer' })
  end,
}
