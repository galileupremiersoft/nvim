vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- use {
    --   'nvimdev/dashboard-nvim',
    --   event = 'VimEnter',
    --   config = function()
      --     require('dashboard').setup {
        --
        --     }
        --   end,
        --   requires = {'nvim-tree/nvim-web-devicons'}
        --
        -- }
        use "bernardo-bruning/ollama-copilot"
        use {
          "williamboman/nvim-lsp-installer",
          "neovim/nvim-lspconfig",
        }
        use 'wbthomason/packer.nvim'
        use 'luckasRanarison/tailwind-tools.nvim'
        -- use 'windwp/nvim-ts-autotag'
        use {
          "windwp/nvim-autopairs",
          event = "InsertEnter",
          config = function()
            require("nvim-autopairs").setup {}
          end
        }
        -- nvim v0.7.2
        use({
          "kdheepak/lazygit.nvim",
          -- optional for floating window border decoration
          requires = {
            "nvim-lua/plenary.nvim",
          },
        })
        use 'github/copilot.vim'
        use 'jpmcb/nvim-llama'
        use 'terroo/vim-simple-emoji'
        use { "nvim-neotest/nvim-nio" }
        use 'navarasu/onedark.nvim'
        use {
          'nvim-telescope/telescope.nvim',
          requires = { {'nvim-lua/plenary.nvim'} }
        }
        -- use 'lukas-reineke/indent-blankline.nvim'
        use 'tpope/vim-surround'
        use {
          'maxmx03/solarized.nvim',
          config = function()
            -- vim.o.background = 'dark' -- or 'light'
            --
            -- vim.cmd.colorscheme 'solarized'
          end
        }
        use {
          'nvim-lualine/lualine.nvim',
          requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }
        use {
          "microsoft/vscode-js-debug",
          opt = true,
          run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
        }

        use 'ray-x/lsp_signature.nvim'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'saadparwaiz1/cmp_luasnip'
        use 'onsails/lspkind-nvim'
        use('jose-elias-alvarez/null-ls.nvim')
        use('MunifTanjim/prettier.nvim')
        -- use {
          --   'kyazdani42/nvim-tree.lua',
          --   requires = {
            --     'kyazdani42/nvim-web-devicons', -- optional, for file icons
            --   },
            --   tag = 'nightly' -- optional, updated every week. (see issue #1193)
            -- }
            use('akai54/2077.nvim')
            --  use('ellisonleao/gruvbox.nvim' )
            use('folke/tokyonight.nvim')
            use('kyazdani42/nvim-web-devicons')
            use('lewis6991/gitsigns.nvim')
            use('ThePrimeagen/harpoon')
            use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
            use('nvim-treesitter/nvim-treesitter')
            use('mattn/emmet-vim')
            use 'Mofiqul/dracula.nvim' 
            use 'tpope/vim-fugitive'
            use 'williamboman/mason.nvim'    
            use 'williamboman/mason-lspconfig.nvim'
            use 'neovim/nvim-lspconfig' 
            use 'simrat39/rust-tools.nvim'
            use 'mfussenegger/nvim-dap'
            use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
            use "EdenEast/nightfox.nvim" -- Packer
            use 'dart-lang/dart-vim-plugin'
            use 'thosakwe/vim-flutter'
            use 'natebosch/vim-lsc'
            use 'natebosch/vim-lsc-dart'
            use 'norcalli/nvim-colorizer.lua'
            use {
              'numToStr/Comment.nvim',
              config = function()
                require('Comment').setup()
              end
            }
            use {
              'akinsho/flutter-tools.nvim',
              requires = {
                'nvim-lua/plenary.nvim',
                'stevearc/dressing.nvim', -- optional for vim.ui.select
              },
            }
            use({
              "L3MON4D3/LuaSnip",
              -- follow latest release.
              tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
              -- install jsregexp (optional!:).
              run = "make install_jsregexp"
            })
            -- use "rafamadriz/friendly-snippets"
            use ({
              'nvimdev/lspsaga.nvim',
              after = 'nvim-lspconfig',
              config = function()
                require('lspsaga').setup({
                  ui = {
                    sign = false,
                    code_action = ''
                  }
                })
              end,
            })
          end)

