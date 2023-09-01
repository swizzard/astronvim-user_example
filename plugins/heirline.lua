return {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
        local status = require "astronvim.utils.status"

        opts.statusline = {
            -- statusline
            hl = { fg = "fg", bg = "bg" },
            status.component.mode(),
            status.component.git_branch(),
            status.component.file_info({
                -- Set relative path name
                filename = { modify = ":~:.", priority = 1 },
                -- Only show filename when its file, not neotree, telescope, etc
                -- Not sure how to disable for lazygit
            }),
            status.component.diagnostics(),
            status.component.fill(),
            status.component.lsp(),
            status.component.treesitter(),
            status.component.nav(),
        }

        return opts
    end,
}
