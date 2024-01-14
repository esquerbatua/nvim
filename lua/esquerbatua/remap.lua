local set = vim.keymap.set
local builtin = require("telescope.builtin")

vim.g.mapleader = ' '

set('n', '<M-f>', vim.cmd.Ex)
set('n', '<F2>', builtin.git_files)
set('n', '<F3>', builtin.find_files)
set('n', '<F4>', builtin.live_grep)
set('n', '<leader>vh', builtin.help_tags, {})

-- Editor
set('i', '<C-Del>', 'X<Esc>lbce')
set('i', '<C-BS>', 'X<Esc>ce')

-- Move cursor over opened splits
set('n', '<leader-Up>', '<C-w>k')
set('n', '<leader-Down>', '<C-w>j')
set('n', '<leader-Left>', '<C-w>h')
set('n', '<leader-Right>', '<C-w>l')

-- Window management
set('n', '<leader>w', '<C-w>v')
set('n', '<leader>q', vim.cmd.quit)
set('n', '-', function() vim.cmd("vertical resize -10") end)
set('n', '+', function() vim.cmd('vertical resize +10') end)

-- Notifications
set('n', '<leader>n', function() require('telescope').extensions.notify.notify() end)

set('v', 'J', ":m '>+1<CR>gv=gv")
--set('v', 'K', ":m '<-2<CR>gv=gv")

--set('n', 'J', 'mzJ`z')
set('n', '<C-d>', '<C-d>zz')
set('n', '<C-u>', '<C-u>zz')
set('n', 'n', 'nzzzv')
set('n', 'N', 'Nzzzv')

set('n', '<leader>vwm', function() require('vim-with-me').StartVimWithMe() end)
set('n', '<leader>svwm', function() require('vim-with-me').StopVimWithMe() end)

-- greatest remap ever
set('x', '<leader>p', [["_dP]])
set({'n', 'v'}, '<leader>y', [["+y]])
set('n', '<leader>Y', [["+Y]])
set({'n', 'v'}, '<leader>d', [["_d]])

--set('n', 'Q', '<nop>')
--set('n', "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
set('n', "<leader>f", vim.lsp.buf.format)

--set('n', "<C-k>", "<cmd>cnext<CR>zz")
--set('n', "<C-j>", "<cmd>cprev<CR>zz")
--set('n', "<leader>k", "<cmd>lnext<CR>zz")
--set('n', "<leader>j", "<cmd>lprev<CR>zz")

set('n', "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--set('n', "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--set('n', "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
--set('n', "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

set('n', "<leader><leader>", vim.cmd.source)
  
