-- ~/nvim/lua/slydragonn/plugins/cmp.lua

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path", -- source for file system paths
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            -- install jsregexp (optional!).
            build = "make install_jsregexp",
        },
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim", -- vs-code like pictograms
    },
    config = function()
        local cmp = require("cmp")
        -- local lspkind = require("lspkind")
        local luasnip = require("luasnip")
        local has_words_before = function()
          unpack = unpack or table.unpack
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
        end


        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            -- mapping = cmp.mapping.preset.insert({
            --     -- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            --     -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
            --     ["<C-Space>"] = cmp.mapping.complete(),
            --     ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            --     ["<C-e>"] = cmp.mapping.close(),
            --     ["<CR>"] = cmp.mapping.confirm({
            --         behavior = cmp.ConfirmBehavior.Replace,
            --         select = true,
            --     }),
            mapping = {
                ["<C-e>"] = cmp.mapping.close(),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
                ['<C-Space>'] = cmp.mapping.confirm {
                  behavior = cmp.ConfirmBehavior.Insert,
                  select = true,
                },
                ['<Tab>'] = function(fallback)
                  if not cmp.select_next_item() then
                    if vim.bo.buftype ~= 'prompt' and has_words_before() then
                      cmp.complete()
                    else
                      fallback()
                    end
                  end
                end,
                ['<S-Tab>'] = function(fallback)
                  if not cmp.select_prev_item() then
                    if vim.bo.buftype ~= 'prompt' and has_words_before() then
                      cmp.complete()
                    else
                      fallback()
                    end
                  end
                end,
              },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
        })

        vim.cmd([[
      set completeopt=menuone,noinsert,noselect
      highlight! default link CmpItemKind CmpItemMenuDefault
    ]])
    end,
}

