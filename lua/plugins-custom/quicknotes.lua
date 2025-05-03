local M = {}

M.config = {
    notes_directory = vim.fn.stdpath('data') .. '/quick_notes/',
}

--Ensure the notes directory exists
local function ensure_notes_directory()
    if vim.fn.isdirectory(M.config.notes_directory) == 0 then
        vim.fn.mkdir(M.config.notes_directory, 'p')
    end
end

-- Create a new note with a simple timestamp filename
function M.create_note()
    ensure_notes_directory()

    -- Use Lua's builtin os.date() to generate timestamp
    local filename = os.date('%Y%m%d_%H%M%S') .. '.txt'
    local full_path = M.config.notes_directory .. filename

    vim.cmd('edit' .. full_path)
end

-- Open a selected note
function M.open_note(base_path)
    -- Get the current line in the notes list buffer
    local current_line = vim.api.nvim_win_get_cursor(0)[1]

    -- Get the filename from the current line
    local filename = vim.api.nvim_buf_get_lines(0, current_line - 1, current_line, false)[1]

    if filename and type(filename) == 'string' then
        local full_path = base_path .. filename

        -- Close notes list window
        vim.api.nvim_win_close(0, true)

        -- Open the selected note
        vim.cmd('edit ' .. full_path)
    else
        print('Error: Unable to retrieve filename')
    end
end

-- Delete a note
function M.delete_note(base_path)
    -- Get the current line in the notes list buffer
    local current_line = vim.api.nvim_win_get_cursor(0)[1]

    -- Get the filename to delete
    local filename = vim.api.nvim_buf_get_lines(0, current_line - 1, current_line, false)[1]

    if filename and type(filename) == 'string' then
        local full_path = base_path .. filename

        local confirm = vim.fn.confirm('Delete note: ' .. filename .. '?', '&Yes\n&No', 2)

        if confirm == 1 then
            -- Attempt to delete file
            local success = os.remove(full_path)

            if success then
                -- Remove the line from the buffer
                vim.api.nvim_buf_set_lines(0, current_line - 1, current_line, false, {})
                print('Note deleted:' .. filename)
            else
                print('Error: Could not delete note')
            end
        end
    else
        print('Error: Unable to retrieve filename')
    end
end

-- Search notes by content
function M.search_notes(query)
    ensure_notes_directory()

    -- Use grep to search note contents
    local grep_cmd = string.format("grep -l '%s' %s*.txt", query:gsub("'", "\\'"), M.config.notes_directory)

    local results = vim.fn.systemlist(grep_cmd)

    if #results > 0 then
        -- Create a new scratch buffer for search results
        local bufnr = vim.api.nvim_create_buf(false, true)

        -- Open a new split window
        vim.cmd('split')
        vim.api.nvim_win_set_buf(0, bufnr)

        -- Set buffer name
        vim.api.nvim_buf_set_name(bufnr, 'Quicknotes Search Results')

        -- Prepare display list (just filenames)
        local display_notes = {}
        for _, note in ipairs(results) do
            -- Extract just the filename from the full path
            local filename = note:match('[^/]+$')
            table.insert(display_notes, filename)
        end

        -- Populate the buffer with note list
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, display_notes)

        -- Set buffer options
        vim.api.nvim_set_option_value('buftype', 'nofile', { buf = bufnr })
        vim.api.nvim_set_option_value('bufhidden', 'wipe', { buf = bufnr })

        -- Create key mappings to open notes
        vim.api.nvim_buf_set_keymap(
            bufnr,
            'n',
            '<CR>',
            string.format(':lua require("custom/quicknotes").open_note("%s")<CR>', M.config.notes_directory),
            { noremap = true, silent = true }
        )
    else
        print('No notes found matching: ' .. query)
    end
end

-- List existing notes
function M.list_notes()
    ensure_notes_directory()

    -- Use vim.fn.glob to get a list of note files
    local notes = vim.fn.glob(M.config.notes_directory .. '*.txt')

    -- Split the glob result into a list
    local note_list = vim.split(notes, '\n')

    -- Create a new scratch buffer for notes list
    local bufnr = vim.api.nvim_create_buf(false, true)

    -- Open a new split window
    vim.cmd('split')
    vim.api.nvim_win_set_buf(0, bufnr)

    -- Set buffer name
    vim.api.nvim_buf_set_name(bufnr, 'QuickNotes List')

    -- Prepare display list (just filenames)
    local display_notes = {}
    for _, note in ipairs(note_list) do
        if note ~= '' then
            -- Extract just the filename from the full path
            local filename = note:match('[^/]+$')
            table.insert(display_notes, filename)
        end
    end

    -- Populate the buffer with note list
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, display_notes)

    -- Make this a special buffer that won't be saved
    vim.api.nvim_set_option_value('buftype', 'nofile', { buf = bufnr })
    vim.api.nvim_set_option_value('bufhidden', 'wipe', { buf = bufnr })

    -- Create key maping to open and delete selected note
    vim.api.nvim_buf_set_keymap(
        bufnr,
        'n',
        '<CR>',
        string.format(':lua require("custom/quicknotes").open_note("%s")<CR>', M.config.notes_directory),
        { noremap = true, silent = true }
    )

    vim.api.nvim_buf_set_keymap(
        bufnr,
        'n',
        'dd',
        string.format(':lua require("custom/quicknotes").delete_note("%s")<CR>', M.config.notes_directory),
        { noremap = true, silent = true }
    )
end

-- Setup for updating or setting config and commands
function M.setup(opts)
    M.config = vim.tbl_deep_extend('force', M.config, opts or {})

    vim.api.nvim_create_user_command('Qn', M.create_note, {})
    vim.api.nvim_create_user_command('Qnl', M.list_notes, {})
    vim.api.nvim_create_user_command('Qns', function(args)
        M.search_notes(args.args)
    end, { nargs = 1 })
end

return M
