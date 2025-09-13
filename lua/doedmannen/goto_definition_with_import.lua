-- This is to be able to do go to definition, but not stop at an import
-- I did realize that grr (get references) kinda achives the same thing
-- so I'm not sure if I'll use this

-- Function to check if current line is an import/export statement
local function is_import_or_export_line(line)
  return line:match("^%s*import%s") 
    or line:match("^%s*export%s.*from%s") 
    or line:match("^%s*export%s*{.*}%s*from%s")
end

-- Main function - simple chained LSP calls
local function goto_import_source()
  -- First LSP definition call
  vim.lsp.buf.definition()
  
  -- After a short delay, check if we're on an import and call definition again
  vim.defer_fn(function()
    local line = vim.api.nvim_get_current_line()
    if is_import_or_export_line(line) then
      -- We landed on an import/export, call definition again
      vim.lsp.buf.definition()
    end
  end, 150)
end

-- Create commands for both versions
vim.api.nvim_create_user_command('GotoImportSource', goto_import_source, {})

-- Optional keymaps
vim.keymap.set('n', '<leader>gd', goto_import_source, { desc = 'Go to import source' })

return {
  goto_import_source = goto_import_source,
}
