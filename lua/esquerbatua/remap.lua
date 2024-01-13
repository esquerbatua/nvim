local set = vim.keymap.set
local builtin = require("telescope.builtin")

vim.g.mapleader = ' '

set('n', '<M-f>', vim.cmd.Ex)
set('n', '<F2>', builtin.git_files)
set('n', '<F3>', builtin.find_files)
set('n', '<F4>', builtin.live_grep)
set('n', '<leader-q>', vim.cmd.quit)
set('n', '<leader>vh', builtin.help_tags, {})


--Move cursor over opened splits
set('n', '<leader><Up>', '<C-w><C-k>')
set('n', '<leader><Down>', '<C-w><C-j>')
set('n', '<leader><Left>', '<C-w><C-h>')
set('n', '<leader><Right>', '<C-w><C-l>')

set('n', '<leader>w', '<C-w>v')
set('n', '-', function() vim.cmd("vertical resize -10") end)
set('n', '+', function() vim.cmd('vertical resize +10') end)

set('n', '<leader>n', function()
    require('telescope').extensions.notify.notify()
end)

set('v', 'J', ":m '>+1<CR>gv=gv")
set('v', 'K', ":m '<-2<CR>gv=gv")

set('n', 'J', 'mzJ`z')
set('n', '<C-d>', '<C-d>zz')
set('n', '<C-u>', '<C-u>zz')
set('n', 'n', 'nzzzv')
set('n', 'N', 'Nzzzv')

set('n', '<leader>vwm', function()
    require('vim-with-me').StartVimWithMe()
end)

set('n', '<leader>svwm', function()
    require('vim-with-me').StopVimWithMe()
end)

-- greatest remap ever
set("x", "<leader>p", [["_dP]])
set({"n", "v"}, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])

set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
--set("i", "<C-c>", "<Esc>")

set("n", "Q", "<nop>")
set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
set("n", "<leader>f", vim.lsp.buf.format)

set("n", "<C-k>", "<cmd>cnext<CR>zz")
set("n", "<C-j>", "<cmd>cprev<CR>zz")
set("n", "<leader>k", "<cmd>lnext<CR>zz")
set("n", "<leader>j", "<cmd>lprev<CR>zz")

set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
--set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

set("n", "<leader><leader>", vim.cmd.source)

-- Zen mode
--[[
set("n", "<leader>zz", function()
    require("zen-mode").setup {
        window = {
            width = 100,
            options = { }
        },
    }
    require("zen-mode").toggle()
--  vim.wo.wrap = false
--  vim.wo.number = true
    vim.wo.rnu = true
--    ColorMyPencils()
end)


set("n", "<leader>zZ", function()
    require("zen-mode").setup {
        window = {
            width = 80,
            options = { }
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = false
    vim.wo.rnu = false
    vim.opt.colorcolumn = "0"
    ColorMyPencils()
end)
]]--

