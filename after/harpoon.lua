local harpoon = require("harpoon")
harpoon:setup()

local set = vim.keymap.set

set('n', '<M-a>', function() harpoon:list():append() end)
set('n', '<M-r>', function() harpoon:list():remove() end)
--vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

set('n', '<M-h>', function() harpoon:list():select(1) end)
set('n', '<M-j>', function() harpoon:list():select(2) end)
set('n', '<M-k>', function() harpoon:list():select(3) end)
set('n', '<M-l>', function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
set('n', '<M-o>', function() harpoon:list():prev() end)
set('n', '<M-p>', function() harpoon:list():next() end)

-- basic telescope configuration
local conf = require('telescope.config').values
local function toggle_telescope(harpoon_files)
    --("harpoon_files: ", vim.inspect(harpoon_files), "\n")
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

set("n", "<M-e>", function() toggle_telescope(harpoon:list()) end)
