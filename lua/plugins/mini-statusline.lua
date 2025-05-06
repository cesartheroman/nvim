return {
    'echasnovski/mini.statusline',
    event = 'VeryLazy',
    config = function()
        require('mini.statusline').setup({ use_icons = vim.g.have_nerd_font })
        ---@diagnostic disable-next-line: duplicate-set-field
        require('mini.statusline').section_location = function()
            return '%2l:%-2v'
        end
        ---@diagnostic disable-next-line: duplicate-set-field
        require('mini.statusline').section_filename = function()
            local filename = vim.fn.expand('%:t')
            local parent_dir = vim.fn.expand('%:h:t')
            return parent_dir .. '/' .. filename
        end
        ---@diagnostic disable-next-line: duplicate-set-field
        require('mini.statusline').inactive = function()
            local filename = vim.fn.expand('%:t')
            local parent_dir = vim.fn.expand('%:h:t')
            return parent_dir .. '/' .. filename
        end
    end,
}
