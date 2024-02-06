vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F6>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F7>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F8>', function() require('dap').step_out() end)
vim.keymap.set('n', '<F4>', function() require('dap').terminate() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
--[[vim.keymap.set('n', '<F5>', function()
    local widgets = require('dap.ui.widgets')
    local my_sidebarsc = widgets.sidebar(widgets.scopes)
    my_sidebarsc.open()
    local my_sidebarsf = widgets.sidebar(widgets.frames)
    my_sidebarsf.open()
end)]]--

