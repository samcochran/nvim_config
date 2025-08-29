return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
    -- fill any relevant options here
        window = {width=34}
    }
    -- config = function()
    --     vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>')
    -- end
}

