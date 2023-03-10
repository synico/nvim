local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    -- vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

  -- packer
  use 'wbthomason/packer.nvim'

  -- treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- nvimtree
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
	'kyazdani42/nvim-web-devicons'
      }
  }

  -- bufferline
  use {
      'akinsho/bufferline.nvim',
      tag = "v2.*",
      requires = 'kyazdani42/nvim-web-devicons'
  }

  -- telescope
  use {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-ui-select.nvim'

  -- outline
  use 'simrat39/symbols-outline.nvim'

  -- LSP
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- configurations for neovim LSP
      "neovim/nvim-lspconfig",
  }
  -- Autocompletion framework
  use("hrsh7th/nvim-cmp")

  use {
      -- cmp LSP completion
      'hrsh7th/cmp-nvim-lsp',
      -- cmp Snippet completion
      'hrsh7th/cmp-vsnip',
      -- cmp Path completion
      'hrsh7th/cmp-path',

      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      after = { 'hrsh7th/nvim-cmp' },
      requires = { 'hrsh7th/nvim-cmp' },
  }

  use {
      -- Snippet engine
      'hrsh7th/vim-vsnip',

      -- Adds extra functionality over rust analyzer
      'simrat39/rust-tools.nvim',

      -- For luasnip users
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- For ultisnips users
      'SirVer/ultisnips',
      'quangnguyen30192/cmp-nvim-ultisnips',

      -- snippy users
      'dcampos/nvim-snippy',
      'dcampos/cmp-snippy',
  }
  use { "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" }
  use { "mfussenegger/nvim-jdtls" }
  use { "glepnir/lspsaga.nvim", branch = "main" }

  -- DAP
  use {
      'mfussenegger/nvim-dap'
  }

  -- lualine
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- markdown preview
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, }) 

  -- Theme
  use {
      { 'ellisonleao/gruvbox.nvim', requires = { "rktjmp/lush.nvim" } },
      'shaunsingh/nord.nvim',
      'lunarvim/darkplus.nvim',
      'lunarvim/onedarker.nvim',
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
