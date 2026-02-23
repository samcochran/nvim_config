return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "neovim/nvim-lspconfig" },
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter")

        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "heex", "javascript", "html", "python", "bash" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
