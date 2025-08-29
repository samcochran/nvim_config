vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("map <RightMouse> <nop>")
vim.cmd('set ic')
vim.g.mapleader = " "
vim.wo.number = true
vim.wo.relativenumber = true
vim.cmd("set textwidth=0")
vim.cmd("set wrapmargin=0")
vim.cmd("set wrap")
vim.cmd("set linebreak")
vim.keymap.set('n', '<leader>g', ':noh<CR>', {})
-- vim.cmd("set fillchars=vert:▎")
vim.keymap.set('n', '<leader>j', '<C-w>j', {})
vim.keymap.set('n', '<leader>k', '<C-w>k', {})
vim.keymap.set('n', '<leader>h', '<C-w>h', {})
vim.keymap.set('n', '<leader>l', '<C-w>l', {})
vim.keymap.set('n', '<leader>r', '<C-w>r', {})

vim.keymap.set('n', '<F4>', ':ToggleTermToggleAll start_in_insert=true <CR>', {})
vim.keymap.set('n', '<F4>', ':ToggleTerm size=40 direction=float start_in_insert=true <CR>', {})
vim.keymap.set('t', '<F4>', '<C-\\><C-n>:ToggleTermToggleAll<CR>', {})
vim.keymap.set('t', '<esc>', '<C-\\><C-n>', {})
-- vim.keymap.del('i', '<F1>')

vim.keymap.set('n', '<F3>', '<Cmd>Neotree toggle<CR>', {})

vim.keymap.set('n', '<leader>td', function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true })
vim.diagnostic.config({
  virtual_text = {
    -- source = "always",  -- Or "if_many"
    prefix = '●', -- Could be '■', '▎', 'x'
  },
  severity_sort = true,
  float = {
    source = "always",  -- Or "if_many"
  },
})

vim.cmd('set clipboard=unnamedplus')
