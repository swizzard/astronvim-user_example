-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local cmp = require('cmp')
local luasnip = require('luasnip')
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>s"] = { "<cmd>SymbolsOutline<cr>", desc = "Open Symbols Outline" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ['K'] = false,
    ['<leader>k'] = { function() vim.lsp.buf.hover() end, desc = 'Hover symbol details' },
    ['<leader>ha'] = { function()
      require("harpoon.mark").add_file()
    end
    },
    ['<leader>hv'] = { function() require("harpoon.ui").toggle_quick_menu() end },
    ['<leader>ht'] = { function() require("harpoon.tmux").gotoTerminal(1) end },
  },
  t = {
    ["<esc>"] = { "<C-\\><C-n>" },
    ["<leader>a"] = { function() vim.cmd("call search('samraker@columbo', 'bW')") end, desc = "Up to previous prompt" },
  },
}
