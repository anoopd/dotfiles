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


  -- using packer.nvim
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
    'neovim/nvim-lspconfig',
    -- config = 'require("plugins.lspconfig")'
  }
  use 'williamboman/nvim-lsp-installer'

  use {
    'junnplus/nvim-lsp-setup',
    requires = {
      'neovim/nvim-lspconfig',
      'williamboman/nvim-lsp-installer',
    },
    config = 'require("plugins.lspsetup")'
  }

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

  use {
    'L3MON4D3/LuaSnip',
    after = 'nvim-cmp',
    config = "require('plugins.luasnip')"
  }
  use { 'saadparwaiz1/cmp_luasnip' }

  use "rafamadriz/friendly-snippets"

  use 'folke/lsp-colors.nvim'
  use {
    "ray-x/lsp_signature.nvim",
  }

  -- use { 'SirVer/ultisnips',
  -- requires = { { 'honza/vim-snippets', rtp = '.' } },
  -- config = function()
  -- vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
  -- vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
  -- vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
  -- vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
  -- vim.g.UltiSnipsRemoveSelectModeMappings = 0
  -- end
  -- }
  -- use 'quangnguyen30192/cmp-nvim-ultisnips'


  use {
    'windwp/nvim-autopairs',
    config = 'require("plugins.autopairs")'
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = 'require("plugins.lualine")',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }


  use 'kdheepak/lazygit.nvim'

  use 'f-person/git-blame.nvim'

  use 'lewis6991/gitsigns.nvim'

  use 'SidOfc/mkdx'
  use { "ellisonleao/glow.nvim" }
  use { 'alexpearce/nvim-follow-markdown-links' }

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

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = "require('plugins.todo')"
  }

  -- Debugger
  use {
    "mfussenegger/nvim-dap",
    config = "require('plugins.dap')"
  }
  use {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    config = "require('plugins.dap-ui')"
  }
  use { 'nvim-telescope/telescope-dap.nvim' }
  use {
    'theHamsta/nvim-dap-virtual-text',
    config = "require('plugins.dap-virtual')"
  }


  use {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
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
