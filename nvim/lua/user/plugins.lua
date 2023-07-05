local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
vim.cmd [[packadd packer.nvim]]
return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use "wbthomason/packer.nvim" 
  use "nvim-lua/popup.nvim" 
  use "nvim-lua/plenary.nvim" 
  use "windwp/nvim-autopairs" 

  -- Colorscheme
  use {'morhetz/gruvbox', config = function() vim.cmd.colorscheme("gruvbox") end }

  use 'luochen1990/rainbow' 

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- lsp completions

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP 
  use "neovim/nvim-lspconfig" -- enable LSP 
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer

  -- Telescope
  use "nvim-telescope/telescope.nvim" -- Telescope for nvim
  use "nvim-telescope/telescope-media-files.nvim" -- Telescope extension that supports media files
  
  -- Treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }    
  use "p00f/nvim-ts-rainbow"
  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
require('packer').sync()
  end
end)
