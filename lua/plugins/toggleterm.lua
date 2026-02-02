return {
    'akinsho/toggleterm.nvim', version = "*",
    config = function()
        require("toggleterm").setup({
           persist_mode = false,
           start_in_insert = true,
           shell = vim.o.shell,
        })
    end

}
