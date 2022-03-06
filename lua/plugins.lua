local fn = vim.fn


-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end,
      prompt_border = "single",
    }
  }
)


return packer.startup(function(use)

	-- Packer can manage itself
	use 'wbthomason/packer.nvim'



	use 'lewis6991/impatient.nvim'

	use {'nvim-lua/popup.nvim', requires='nvim-lua/plenary.nvim'}

	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	-- using packer.nvim
	use {
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = "require('plugins.bufferline')"
	}

	use { 'joshdick/onedark.vim' }

	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
	}


	use {
		'nvim-telescope/telescope.nvim',
		requires = 'nvim-lua/plenary.nvim'
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}


	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use 'onsails/lspkind-nvim'

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'

	-- Installation
	use {
		"hrsh7th/nvim-cmp",
		config = 'require("plugins.cmp")'
	}

	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'



	--	use 'hrsh7th/cmp-vsnip'
	--	use 'hrsh7th/vim-vsnip'

	use 'windwp/nvim-autopairs'

	use 'mfussenegger/nvim-dap'

	use 'kdheepak/lazygit.nvim'

	use 'SidOfc/mkdx'
	use {"ellisonleao/glow.nvim"}
	use {'alexpearce/nvim-follow-markdown-links'}

end)
