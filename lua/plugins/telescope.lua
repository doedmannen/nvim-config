return {
  'nvim-telescope/telescope.nvim',
  branch = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
  },
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

    require('telescope').load_extension('live_grep_args')

    -- Keymaps must be set AFTER telescope is loaded
    local builtin = require('telescope.builtin')
    local lga = require('telescope').extensions.live_grep_args
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', lga.live_grep_args, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Find in Git files' })
    vim.keymap.set('n', '<leader>fl', builtin.resume, { desc = 'Open latest search' })
    vim.keymap.set('n', '<leader>fe', function()
      builtin.find_files({
        prompt_title = "Find .env files",
        find_command = { 'rg', '--files', '--glob', '*.env*', '--glob', '.github/**', '--glob', '.jest/**' },
        hidden = true,
      })
    end, { desc = 'Find .env files' })
  end
}
