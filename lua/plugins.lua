-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  	-- 基础插件
  use "rcarriga/nvim-notify" -- notify

	use 'mg979/vim-visual-multi'  --多光标
	use 'YacineDo/mc.nvim'
  -- 欢迎页
  use "goolord/alpha-nvim"
  -- 文件管理器
  use { 'nvim-tree/nvim-tree.lua', requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  -- 标签页
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

  -- UI
  use{ "catppuccin/nvim", as = "catppuccin" }

  -- 状态栏
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- 搜索栏
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
	-- telescope fzf 扩展
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	use  "ahmedkhalf/project.nvim"

	-- tree-siter 
	use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
					local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
					ts_update()
			end,
	}

	-- lsp 
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
	}

	-- dap
	use 'mfussenegger/nvim-dap'
  use	"jayp0521/mason-nvim-dap.nvim"

	-- 补全引擎
	use("hrsh7th/nvim-cmp")
	-- snippet 引擎
	use("hrsh7th/vim-vsnip")
	-- 补全源
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
	use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
	use("hrsh7th/cmp-path") -- { name = 'path' }
	use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

	-- 常见编程语言代码段
	use("rafamadriz/friendly-snippets")


 use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

 use {'jbyuki/one-small-step-for-vimkind', module = "osv"} -- lua debugger

 -- dap ui
 use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
 use 'theHamsta/nvim-dap-virtual-text'
end)
