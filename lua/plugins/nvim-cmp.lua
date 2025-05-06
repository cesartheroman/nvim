return {
    -- See `:help cmp`
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        {
            'L3MON4D3/LuaSnip',
            build = (function()
                -- Build Step is needed for regex support in snippets.
                -- This step is not supported in many windows environments.
                -- Remove the below condition to re-enable on windows.
                if vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0 then
                    return
                end
                return 'make install_jsregexp'
            end)(),
            dependencies = {
                -- `friendly-snippets` contains a variety of premade snippets.
                --    See the README about individual language/framework/plugin snippets:
                --    https://github.com/rafamadriz/friendly-snippets
                {
                    'rafamadriz/friendly-snippets',
                    config = function()
                        require('luasnip.loaders.from_vscode').lazy_load()
                    end,
                },
            },
        },
        'saadparwaiz1/cmp_luasnip',

        -- Adds LSP completion capabilities.
        -- nvim-cmp does not ship with all sources by default. They are split
        -- into multiple repos for maintenance purposes.
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer', -- source for text in buffer
        'hrsh7th/cmp-path', -- source for file system paths

        -- vs-code like pictograms
        'onsails/lspkind.nvim',
    },
    config = function()
        -- See `:help cmp`
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        local lspkind = require('lspkind')

        luasnip.config.setup({})

        cmp.setup({
            completion = {
                completeopt = 'menu,menuone,preview,noselect',
            },
            -- configure how nvim-cmp interacts with snippet engine
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            -- For an understanding of why these mappings were
            -- chosen, you will need to read `:help ins-completion`
            --
            -- No, but seriously. Please read `:help ins-completion`, it is really good!
            mapping = cmp.mapping.preset.insert({
                -- Select the next item
                ['<C-j>'] = cmp.mapping.select_next_item(),
                -- Select the previous item
                ['<C-k>'] = cmp.mapping.select_prev_item(),

                -- Scroll the documentation window [b]ack / [f]orward
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),

                -- Accept (enter) the completion.
                --  This will auto-import if your LSP supports it.
                --  This will expand snippets if the LSP sent a snippet.
                -- ['<C-y>'] = cmp.mapping.confirm { select = true },
                ['<CR>'] = cmp.mapping.confirm({ select = false }),

                -- Manually trigger a completion from nvim-cmp.
                --  Generally you don't need this, because nvim-cmp will display
                --  completions whenever it has completion options available.
                ['<C-Space>'] = cmp.mapping.complete({}),

                -- close completion window
                ['<C-e>'] = cmp.mapping.abort(),

                -- Think of <TAB> as moving to the right of your snippet expansion.
                --  So if you have a snippet that's like:
                --  function $name($args)
                --    $body
                --  end
                --
                -- <Tab> will move you to the right of each of the expansion locations.
                -- <S-Tab> is similar, except moving you backwards.
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),

            -- sources for autocompletion
            sources = cmp.config.sources({
                { name = 'nvim_lsp', priority = 1000 },
                { name = 'buffer', priority = 750 }, -- text within current buffer
                { name = 'path', priority = 500 }, -- file system paths
                { name = 'luasnip', priority = 250 }, -- snippets
            }),

            -- configure lspkind for vs-code like pictograms in completion menu
            formatting = {
                format = function(entry, item)
                    local lspkind_opts = {
                        mode = 'symbol_text',
                        maxwidth = 50,
                        ellipsis_char = '...',
                    }

                    if vim.bo.filetype == 'ruby' and (item.kind == 'Method') then
                        local paren_pos = string.find(item.abbr, '(', 1, true)

                        if paren_pos then
                            item.abbr = string.sub(item.abbr, 1, paren_pos - 1)
                            item.abbr = item.abbr:gsub('%s+$', '')
                        end

                        lspkind_opts = {
                            mode = 'symbol_text',
                            maxwidth = 25,
                            ellipsis_char = '...',
                        }
                    end

                    return lspkind.cmp_format(lspkind_opts)(entry, item)
                end,
            },

            window = {
                documentation = {
                    border = 'rounded',
                    winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,Search:None',
                },
            },
        })
    end,
}
