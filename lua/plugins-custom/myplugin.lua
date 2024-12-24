local M = {}

function M.say_hello()
    print('Hello, Neovim!')
end

function M.setup()
    vim.api.nvim_create_user_command('Hello', function()
        M.say_hello()
    end, {})
end

return M
