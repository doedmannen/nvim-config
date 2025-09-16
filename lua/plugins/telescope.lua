local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Find in Git files' })

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      defaults = {
        -- Set vertical layout
        layout_strategy = 'vertical',
        layout_config = {
          vertical = {
            prompt_position = "bottom",
            preview_height = 0.3,
            mirror = false,
          },
          width = 0.9,
          height = 0.9,
          preview_cutoff = 20,
        },
        sorting_strategy = "ascending",
        dynamic_preview_title = true,

        -- Smart path display configuration
        path_display = { "smart" },
      },
    })
  end
}
