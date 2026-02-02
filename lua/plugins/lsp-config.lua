return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pylsp" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Using new vim.lsp.config API (nvim 0.11+)
            vim.lsp.config.lua_ls = {}
            vim.lsp.config.pylsp = {}

            vim.lsp.enable('lua_ls')
            vim.lsp.enable('pylsp')
            -- vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}
