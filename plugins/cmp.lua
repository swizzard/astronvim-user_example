return {
    { -- override nvim-cmp plugin
      "hrsh7th/nvim-cmp",
      dependencies = {
        'hrsh7th/cmp-nvim-lsp-document-symbol',
        'ray-x/cmp-treesitter',
        'zbirenbaum/copilot-cmp'
      },
      -- override the options table that is used in the `require("cmp").setup()` call
      opts = function(_, opts)
        -- opts parameter is the default options table
        -- the function is lazy loaded so cmp is able to be required
        local cmp = require "cmp"
        -- local cpp = require 'copilot_cmp.comparators'
        local function has_words_before()
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
        end
        -- modify the sources part of the options table
        opts.sources = cmp.config.sources {
          { name = "copilot", priority = 1000 },
          { name = "nvim_lsp", priority = 900 },
          { name = 'treesitter', priority = 800 },
          { name = "luasnip", priority = 750 },
          {
            name = "buffer",
            priority = 700,
            option = {
              get_bufnrs = function() return vim.api.nvim_list_bufs() end,
            },
          },
          { name = 'nvim_lsp_document_symbol', priority = 600 },
          { name = "path", priority = 500 },
      }
      -- opts.mapping = cmp.config.mapping {
      --     ["<Tab>"] = vim.schedule_wrap(function(fallback)
      --           if cmp.visible() and has_words_before() then
      --             cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      --           else
      --             fallback()
      --           end
      --         end),
      -- }
      -- 
      -- opts.sorting = {
      --   cpp.prioritize,
      --   cmp.config.compare.offset,
      --   cmp.config.compare.exact,
      --   cmp.config.compare.score,
      --   cmp.config.compare.recently_used,
      --   cmp.config.compare.locality,
      --   cmp.config.compare.kind,
      --   cmp.config.compare.sort_text,
      --   cmp.config.compare.length,
      --   cmp.config.compare.order
      -- }

        -- return the new table to be used
        return opts
      end,
    },
  };
