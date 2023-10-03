return {
  {
    "simrat39/symbols-outline.nvim",
    event = "BufRead",
    config = function()
      require('symbols-outline').setup({
        highlight_hovered_item = true,
        show_guides = true,
        auto_preview = false,
        position = 'right',
        relative_width = true,
        width = 25,
        auto_close = false,
        show_numbers = false,
        show_relative_numbers = false,
        show_symbol_details = true,
        preview_bg_highlight = 'Pmenu',
        autofold_depth = nil,
        auto_unfold_hover = true,
        fold_markers = { '', '' },
        wrap = false,
        keymaps = {
          -- These keymaps can be a string or a table for multiple keys
          close = { "<Esc>", "q" },
          goto_location = "<Cr>",
          focus_location = "o",
          hover_symbol = "<C-space>",
          toggle_preview = "K",
          rename_symbol = "r",
          code_actions = "a",
          fold = "h",
          unfold = "l",
          fold_all = "W",
          unfold_all = "E",
          fold_reset = "R",
        },
        lsp_blacklist = {},
        symbol_blacklist = {},
        symbols = {
          File = { icon = "", hl = "@text.uri" },
          Module = { icon = "", hl = "@namespace" },
          Namespace = { icon = "", hl = "@namespace" },
          Package = { icon = "", hl = "@namespace" },
          Class = { icon = "𝓒", hl = "@type" },
          Method = { icon = "ƒ", hl = "@method" },
          Property = { icon = "", hl = "@method" },
          Field = { icon = "", hl = "@field" },
          Constructor = { icon = "", hl = "@constructor" },
          Enum = { icon = "ℰ", hl = "@type" },
          Interface = { icon = "ﰮ", hl = "@type" },
          Function = { icon = "", hl = "@function" },
          Variable = { icon = "", hl = "@constant" },
          Constant = { icon = "", hl = "@constant" },
          String = { icon = "𝓐", hl = "@string" },
          Number = { icon = "#", hl = "@number" },
          Boolean = { icon = "⊨", hl = "@boolean" },
          Array = { icon = "", hl = "@constant" },
          Object = { icon = "⦿", hl = "@type" },
          Key = { icon = "🔐", hl = "@type" },
          Null = { icon = "NULL", hl = "@type" },
          EnumMember = { icon = "", hl = "@field" },
          Struct = { icon = "𝓢", hl = "@type" },
          Event = { icon = "🗲", hl = "@type" },
          Operator = { icon = "+", hl = "@operator" },
          TypeParameter = { icon = "𝙏", hl = "@parameter" },
          Component = { icon = "", hl = "@function" },
          Fragment = { icon = "", hl = "@constant" },
        }
      })
    end,
    -- 'jeapostrophe/racket-langserver',
  },
  {
    "sainnhe/sonokai",
    init = function() -- init function runs before the plugin is loaded
      vim.g.sonokai_style = "shusia"
    end,
  },
  {
    "marko-cerovac/material.nvim",
    init = function()
      vim.g.material_style = "lighter"
    end
  },
  {
    "folke/tokyonight.nvim",
    init = function()
      -- local util = require('tokyonight.util')
      local c = require('tokyonight.colors')
      require('tokyonight').setup({
        on_colors = function(colors)
          colors.comment = "#9cacf7"
          colors.terminal_black = "#8b9ade"
        end,
        on_highlights = function(hl, _c)
          hl.Identifier = {
            bg = "#000000",
            fg = "#999999"
          }
          hl['@string'] = {
            bg = "#1a1b26",
            fg = "#8790c8"
          }
          hl.NotifyDEBUGBorder = {
            bg = "#1a1b26",
            fg = "#8790c8"
          }
          CmpGhostText = {
            fg = "#8b9ade"
          }
        end,
      style = "night",
      -- styles = {
      --     comments = { fg = util.blend(c.default.comment, c.default.fg, "00") }
      --   }
      })
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    init = function()
      require('gruvbox').setup()
    end
  },
  "tpope/vim-dotenv",
  {"vimwiki/vimwiki",
   lazy = false
  },
  {"zbirenbaum/copilot.lua",
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function() require('copilot').setup() end,
  },
  {"zbirenbaum/copilot-cmp", config = function () require('copilot_cmp').setup() end },
  -- {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}
