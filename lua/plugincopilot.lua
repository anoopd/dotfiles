local fn = vim.fn



-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
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

  use { 'nvim-lua/popup.nvim', requires = 'nvim-lua/plenary.nvim' }

  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = "require('plugins.bufferline')"
  }

  use 'navarasu/onedark.nvim'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = "require('plugins.nvim-tree')"
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = "require('plugins.telescope')"
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = 'require("plugins.treesitter")'
  }
  use 'haringsrob/nvim_context_vt'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use {
    'm-demare/hlargs.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }

  use 'AndrewRadev/tagalong.vim'
  -- registers
  use "tversteeg/registers.nvim"


  use {
    'yamatsum/nvim-cursorline',
    config = "require('plugins.cursorline')"
  }

  use 'mattn/emmet-vim'

  use 'norcalli/nvim-colorizer.lua'

  use 'sbdchd/neoformat'

  use 'wakatime/vim-wakatime'


  use {
    'windwp/nvim-autopairs',
    config = 'require("plugins.autopairs")'
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = 'require("plugins.lualine")',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

    use {
    "akinsho/toggleterm.nvim",
    config = 'require("plugins.toggleterm")'
  }

  use {
    "folke/trouble.nvim",
    config = 'require("plugins.trouble")'
  }

  use({
    "winston0410/commented.nvim",
    config = 'require("plugins.commented")'
  })




  --  Trying Github Copilot
  --use { 'github/copilot.vim' }

  use {'hrsh7th/nvim-cmp'}

  use {
  "zbirenbaum/copilot.lua",
  event = {"VimEnter"},
  config = function()
    vim.defer_fn(function()
      require("copilot").setup()
    end, 100)
  end,
}

use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
}



end)
