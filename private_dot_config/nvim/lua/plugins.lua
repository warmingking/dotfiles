-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use '9mm/vim-closer'

  use {'andymass/vim-matchup', event = 'VimEnter'}

  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install'](0) end,
    cmd = 'MarkdownPreview'
  }

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  use {
    'glepnir/galaxyline.nvim', branch = 'main',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  use {'dracula/vim'}

  use {'kkoomen/vim-doge', run = function() vim.fn['doge#install']() end}

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function() require'nvim-tree'.setup {} end
  }

  use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}

  use {
    'junegunn/fzf.vim',
    requires = {'junegunn/fzf'}
  }

  use {'ludovicchabant/vim-gutentags'}

  use {'neovim/nvim-lspconfig'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)
