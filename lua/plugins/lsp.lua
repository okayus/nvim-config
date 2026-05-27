return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- TypeScript / JavaScript
        ts_ls = {},
        -- Rust
        rust_analyzer = {},
        -- Haskell
        hls = {},
        -- C
        clangd = {},
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "rust-analyzer",
        "haskell-language-server",
        "clangd",
        "prettierd",
        "eslint_d",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "javascript",
        "typescript",
        "tsx",
        "rust",
        "haskell",
        "c",
      })
    end,
  },
}
