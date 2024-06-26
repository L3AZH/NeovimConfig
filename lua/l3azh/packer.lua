-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
--vim.cmd[[colorscheme tokyonight]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use "folke/tokyonight.nvim"
  use {
      'nvim-treesitter/nvim-treesitter',
      tag = 'v0.9.2',
      --{run = ':TSUpdate'}
  }
  use "tpope/vim-fugitive"
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment the two plugins below if you want to manage the language servers from neovim
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }
  use 'rstacruz/vim-closer'
  use 'mfussenegger/nvim-dap'
  use 'mfussenegger/nvim-jdtls'
  use { 
      "rcarriga/nvim-dap-ui", 
      requires = {
          {"mfussenegger/nvim-dap"},
          {"nvim-neotest/nvim-nio"}, 
      }
  }	
end)
