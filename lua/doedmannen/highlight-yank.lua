vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    pcall(function() -- protected call suppresses errors for highlighting on delete yanks
      vim.highlight.on_yank({
        higroup = 'IncSearch',     -- highlight group to use
        timeout = 300,          -- how long to show highlight (ms)
      })
    end)
  end,
})

