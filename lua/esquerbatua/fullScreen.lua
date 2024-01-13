-- Alternar entre pantalla completa y tamaño original
vim.api.nvim_set_keymap('n', '<leader>ft', [[:lua ToggleFullscreen()<CR>]], { noremap = true, silent = true })

-- Variables globales para almacenar el tamaño y posición original
vim.g.original_width = 0
vim.g.original_height = 0
vim.g.original_topline = 0

-- Función para alternar entre pantalla completa y tamaño original
function ToggleFullscreen()
  if vim.fn.winwidth(0) > 1 then
    -- Guardar el tamaño y posición original
    vim.g.original_width = vim.fn.winwidth(0)
    vim.g.original_height = vim.fn.winheight(0)
    vim.g.original_topline = vim.fn.line('w0')

    -- Poner en pantalla completa
    vim.cmd('resize ' .. vim.o.columns)
    vim.cmd('vertical resize ' .. vim.o.lines)
  else
    -- Restaurar al tamaño y posición original
    vim.cmd('resize ' .. vim.g.original_height)
    vim.cmd('vertical resize ' .. vim.g.original_width)
    vim.fn.cursor(vim.g.original_topline, 1)
  end
end
