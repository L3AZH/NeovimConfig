### Requirement

My Neovim verion:
```
NVIM v0.10.0-dev                                                                                                                                                                       
Build type: RelWithDebInfo                                                                                                                                                             
LuaJIT 2.1.0-beta3                                                                                                                                                                     
Run "nvim -V1 -v" for more info
```

Installed `rgrep` (This is for fuzzysearch file plugin)  

Following by this tutorial: [ThePrimeagen - 0 to LSP : Neovim RC From Scratch](https://www.youtube.com/watch?v=w7i4amO_zaE&t=278s)

### How to enable visual mode copy content into the clipboard 

Just add this line into the config in `<your path>/lua/l3azh/set.lua`
```lua
vim.opt.clipboard="unnamedplus"
```


### DAP-Using nvim-dap for debug
Using this packeage [Nvim-dap](https://github.com/mfussenegger/nvim-dap)

Config for `go`:  

1. Get package via `Packer` plugin: `use 'mfussenegger/nvim-dap'`
2. Using `Mason` from the `LSP-zero` plugin to install those packages: `delve`(This package is required for debug), `golangci-lint`, `gopls`, `gotests`
3. Creating a config and a adpater for dap-go:  `<your path>/after/plugin/nvim_dap.lua` as following content:
```lua
local dap = require("dap") 
dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
  }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages 
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  } 
}
```
4. Creating key-maping:
```lua
vim.keymap.set('n', '<F7>', function() require('dap').continue() end)
vim.keymap.set('n', '<F8>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F9>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<F5>', function()
    local widgets = require('dap.ui.widgets')
    local my_sidebarsc = widgets.sidebar(widgets.scopes)
    my_sidebarsc.open()
    local my_sidebarsf = widgets.sidebar(widgets.frames)
    my_sidebarsf.open()
end)
```
5. Done - Formore detail please watch 
[Debugging In Neovim (ft BashBunni)](https://youtu.be/0moS8UHupGc?si=GMBYhpXtjDi0qrqz) 
or read document on [Nvim-dap](https://github.com/mfussenegger/nvim-dap) 



