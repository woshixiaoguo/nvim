-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Simple plugins can be specified as strings
  -- use '9mm/vim-closer'

  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  -- use {
	--		'w0rp/ale',
	--		ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
	--		cmd = 'ALEEnable',
	--		config = 'vim.cmd[[ALEEnable]]'
	--	}

  -- Plugins can have dependencies on other plugins
  -- use {
  --  'haorenW1025/completion-nvim',
  --  opt = true,
  --  requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  -- }

  -- Plugins can also depend on rocks from luarocks.org:
  -- use { 'my/supercoolplugin', rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}} }

  -- You can specify rocks in isolation
  -- use_rocks 'penlight'
  -- use_rocks {'lua-resty-http', 'lpeg'}

  -- Local plugins can be included
  -- use '~/projects/personal/hover.nvim'

  -- Plugins can have post-install/update hooks
  -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Post-install/update hook with call of vimscript function with argument
  --use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- Use specific branch, dependency and run lua file after load
  -- use {
  --   'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }

  -- Use dependency and run lua function after load
  -- use {
  -- 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
  --  config = function() require('gitsigns').setup() end
  --}

  -- You can specify multiple plugins in a single call
  --use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

  -- You can alias plugin names
  -- use {'dracula/vim', as = 'dracula'}

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
