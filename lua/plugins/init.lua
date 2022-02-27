-- Boostrap Packer and ensure the plugin is installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
vim.cmd 'packadd packer.nvim'

local packer = require("packer")

return packer.startup({
  function (use)
    use 'wbthomason/packer.nvim'
    use { 'nvim-lua/popup.nvim' } -- what uses this?
    use { 'EdenEast/nightfox.nvim', config = function() vim.cmd 'colorscheme nightfox' end }

    -- TODO: look into setting this up
    use { 'nvim-treesitter/nvim-treesitter' }

    -- setup the IDE 
    use { 'editorconfig/editorconfig-vim' }
    use { 'lewis6991/gitsigns.nvim', 
      requires = { 'nvim-lua/plenary.nvim' }, 
      config = function() require('gitsigns').setup() end
    }
    use { 'terrortylor/nvim-comment', 
      config = function() require('nvim_comment').setup() end
    }

    use { 'rmagatti/auto-session',
      config = function()
        require('auto-session').setup {
          post_restore_cmds = {restore_nvim_tree, "NvimTreeRefresh", "NvimTreeOpen"},
          auto_session_enable_last_session=true,
        }
      end
    }

    use { 'nvim-telescope/telescope.nvim',
      after = 'auto-session',
      requires = { 
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        'nvim-telescope/telescope-dap.nvim',
        'rmagatti/session-lens'
      },
      config = function() require"plugins.telescope".setup() end
    }

    use { 'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function () require("plugins.nvim-tree").setup() end
    }
    
    use { 'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function()  require("plugins.lualine").setup() end
    }

    -- setup the language server and languages
    use { 'neovim/nvim-lspconfig' }

    use { 'hrsh7th/vim-vsnip' }
    use { 'hrsh7th/nvim-cmp', 
      after = { 'nvim-lspconfig', 'popup.nvim', 'vim-vsnip' },
      requires = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-vsnip' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-buffer' }
      },
      config = function() require("plugins.nvim-cmp").setup() end
    }
    
    -- setup the test functionality
    use { 'rcarriga/vim-ultest', 
      requires = { 'vim-test/vim-test' }, 
      run=':UpdateRemotePlugins' 
    }

    -- setup the debugger
    use { 'rcarriga/nvim-dap-ui',
      requires = { 'mfussenegger/nvim-dap' },
      config = function() require"plugins.nvim-dap".setup() end
    }

    use { 'simrat39/rust-tools.nvim', 
      after = 'nvim-lspconfig',
      config = function() require("plugins.rust-tools").setup() end
    }
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})


