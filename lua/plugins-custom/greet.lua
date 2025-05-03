local M = {}

M.config = {
    name = 'Developer',
}

function M.setup(opts)
    M.config = vim.tbl_deep_extend('force', M.config, opts or {})

    vim.api.nvim_create_user_command('Greet', function()
        M.show_greeting()
    end, {})
end

local function create_floating_window(content)
    local buf = vim.api.nvim_create_buf(false, true) -- Creates a scratch buffer
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)

    local width = vim.o.columns
    local height = vim.o.lines

    local win_width = math.ceil(width * 0.3)
    local win_height = 3

    local row = math.ceil((height - win_height) / 2) -- Center row
    local col = math.ceil((width - win_width) / 2) -- Center col

    vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = win_width,
        height = win_height,
        row = row,
        col = col,
        style = 'minimal',
        border = 'rounded',
    })
end

function M.show_greeting()
    local name = M.config.name
    local greeting = 'Hello, ' .. name .. '!'
    create_floating_window({ greeting })
end

return M
