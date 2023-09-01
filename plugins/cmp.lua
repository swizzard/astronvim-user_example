return {
    { -- override nvim-cmp plugin
      "hrsh7th/nvim-cmp",
      dependencies = {
        'hrsh7th/cmp-nvim-lsp-document-symbol',
        'ray-x/cmp-treesitter'
      },
      -- override the options table that is used in the `require("cmp").setup()` call
      opts = function(_, opts)
        -- opts parameter is the default options table
        -- the function is lazy loaded so cmp is able to be required
        local cmp = require "cmp"
        local luasnip = require "luasnip"
        -- modify the sources part of the options table
        opts.sources = cmp.config.sources {
          { name = "nvim_lsp", priority = 1000 },
          {
            name = "buffer",
            priority = 750,
            option = {
              get_bufnrs = function() return vim.api.nvim_list_bufs() end,
            },
          },
          { name = 'treesitter', priority = 700 },
          { name = 'nvim_lsp_document_symbol', priority = 600 },
          { name = "path", priority = 500 },
          { name = "luasnip", priority = 250 },
      }

        -- return the new table to be used
        return opts
      end,
    },
  };
