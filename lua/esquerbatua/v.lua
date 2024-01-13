local set = vim.keymap.set

vim.g.mapleader = ' '


set('n', '<leader>tv', ':!v -stats test .<CR>')

--[[
function on_file_change()
    local new_tick = vim.fn.getftime(buffer)
    --vim.notify('buffer: ' .. buffer .. 'file tick: ' .. new_tick .. ', current tick: ' .. current_tick)

    if new_tick ~= current_tick then
        current_tick = new_tick
        local file = io.open(buffer, "r")
        if file then
            local contents = file:read("*a")
            vim.notify(contents, 'info', { timeout = 5000 })
            file:close()
        end
    end
end

set('n', '<leader>t', function()
    buffer = vim.fn.tempname()
    current_tick = vim.fn.getftime(buffer)

    vim.api.nvim_exec([[
        augroup FileChangedAutocmd
        autocmd!
        autocmd FocusGained * lua on_file_change()
        autocmd CursorHold,CursorHoldI * lua on_file_change()
        augroup END
    , false)
    vim.notify('Running tests...', 'info', { timeout = 1000 })
    local res = vim.fn.system('v -stats test . 2>&1 > ' .. buffer)
    --vim.notify('new tick: ' .. current_tick)
    --vim.notify(res)
end)
]]--
