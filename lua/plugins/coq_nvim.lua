return {
  "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
  lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
  dependencies = {
    -- main one
    { "ms-jpq/coq_nvim", branch = "coq" },

    -- 9000+ Snippets
    { "ms-jpq/coq.artifacts", branch = "artifacts" },

    -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
    -- Need to **configure separately**
    { 'ms-jpq/coq.thirdparty', branch = "3p" }
    -- - shell repl
    -- - nvim lua api
    -- - scientific calculator
    -- - comment banner
    -- - etc
  },
  init = function()
    -- coq v2 asserts coroutine.running() == nil, which fails on LuaJIT built with
    -- Lua 5.2 compat (main thread returns thread, true). Remove once fixed upstream.
    vim.g.coq_v1 = true
    vim.g.coq_settings = {
        auto_start = 'shut-up', -- if you want to start COQ at startup
        -- Your COQ settings here
    }
  end,
  config = function()
    -- Your LSP settings here
  end,
}
