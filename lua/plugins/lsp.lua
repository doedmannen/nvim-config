return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      automatic_installation = true,
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
      },
    })
  end
}
