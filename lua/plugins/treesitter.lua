return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- Compatibility shim for deprecated ft_to_lang (removed in Neovim 0.11+)
      if not vim.treesitter.language.ft_to_lang then
        vim.treesitter.language.ft_to_lang = vim.treesitter.language.get_lang
      end

      -- New nvim-treesitter API (v1.0+) - much simpler
      require("nvim-treesitter").setup()

      -- Install parsers (use :TSInstall for manual install)
      local parsers = {
        "vimdoc", "javascript", "typescript", "c", "lua", "rust",
        "jsdoc", "bash", "go",
      }

      -- Auto-install missing parsers
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local ft = vim.bo.filetype
          local lang = vim.treesitter.language.get_lang(ft) or ft
          if vim.tbl_contains(parsers, lang) then
            pcall(function()
              if not pcall(vim.treesitter.language.inspect, lang) then
                vim.cmd("TSInstall " .. lang)
              end
            end)
          end
        end,
      })

      -- Treesitter highlighting is now built into Neovim 0.11+
      -- Enable it for buffers with a parser
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buf = vim.api.nvim_get_current_buf()
          local ft = vim.bo[buf].filetype

          -- Skip html
          if ft == "html" then return end

          -- Skip large files
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            vim.notify(
              "File larger than 100KB treesitter disabled for performance",
              vim.log.levels.WARN,
              { title = "Treesitter" }
            )
            return
          end

          -- Start treesitter if parser available
          pcall(vim.treesitter.start, buf)
        end,
      })

      vim.treesitter.language.register("templ", "templ")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    after = "nvim-treesitter",
    config = function()
      require'treesitter-context'.setup{
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        multiwindow = false, -- Enable multiwindow support.
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      }
    end
  }
}
