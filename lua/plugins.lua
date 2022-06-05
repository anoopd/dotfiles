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

  -- Look and Feel
  use 'navarasu/onedark.nvim'
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = "require('plugins.bufferline')"
  }
  use {
    'nvim-lualine/lualine.nvim',
    config = 'require("plugins.lualine")',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Fuzzy Finding and File Explorer
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = "require('plugins.telescope')"
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = "require('plugins.nvim-tree')"
  }

  -- Treesitter Highlighting and more .....
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = 'require("plugins.treesitter")'
  }
  use {
    'm-demare/hlargs.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }
  use 'haringsrob/nvim_context_vt'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- General Utilities
  use "lukas-reineke/indent-blankline.nvim"
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use "tversteeg/registers.nvim"
  use {
    'yamatsum/nvim-cursorline',
    config = "require('plugins.cursorline')"
  }
  use 'mattn/emmet-vim'
  use 'norcalli/nvim-colorizer.lua'
  use {
    'windwp/nvim-autopairs',
    config = 'require("plugins.autopairs")'
  }
  use 'wakatime/vim-wakatime'
  use {
    "akinsho/toggleterm.nvim",
    config = 'require("plugins.toggleterm")'
  }
use {
    "williamboman/nvim-lsp-installer",
    {
        "neovim/nvim-lspconfig",
        config = 'require("plugins.lsp-installer")'    }
}
  -- LSP Config, Install and Cmp
  use  'hrsh7th/cmp-nvim-lsp'
  use  'hrsh7th/cmp-buffer'
  use  'hrsh7th/cmp-path'
  use  'hrsh7th/cmp-cmdline'
  use  {'hrsh7th/nvim-cmp', config='require("plugins.cmp")'}

  -- Snippet & Snippets
  use {
    'L3MON4D3/LuaSnip',
    config = 'require("plugins.luasnip")'
  }
  use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets"

  -- Git Copilot in Lua
  use 'github/copilot.vim'
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


-- Git Related
  use {
  'lewis6991/gitsigns.nvim',
    config = function()
    require('gitsigns').setup()
  end
}

-- Debugging and Related
  use {
    'mfussenegger/nvim-dap',
    config = "require('plugins.dap')"
  }
  use {
    "rcarriga/nvim-dap-ui",
    requires = {"mfussenegger/nvim-dap"},
    config = "require('plugins.dap-ui')"
  }
  use { "nvim-telescope/telescope-dap.nvim",
    requires ={ "mfussenegger/nvim-dap","nvim-telescope/telescope.nvim"}
  }

  use {
    'theHamsta/nvim-dap-virtual-text',
    config = "require('plugins.dap-virtual')"
  }
  use 'jbyuki/one-small-step-for-vimkind'



  -- Linting , Spell Checking null-ls
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup({
        sources = {
          require("null-ls").builtins.formatting.stylua,
          require("null-ls").builtins.diagnostics.eslint,
          require("null-ls").builtins.completion.spell,
          require("null-ls").builtins.formatting.prettier,
        },
      })
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })

  -- Lua
use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
end)
