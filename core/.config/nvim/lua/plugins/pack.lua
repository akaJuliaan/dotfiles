vim.pack.add {
  -- INFO: UI

  -- Bufferline
  'https://github.com/akinsho/bufferline.nvim',
  'https://github.com/moll/vim-bbye',
  'https://github.com/nvim-tree/nvim-web-devicons',

  -- Theme
  { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },

  'https://github.com/nvim-lualine/lualine.nvim',

  -- Neo Tree
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range '3',
  },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',

  -- Which Key
  'https://github.com/folke/which-key.nvim',

  -- INFO: LSP

  -- Base
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  'https://github.com/j-hui/fidget.nvim',
  'https://github.com/hrsh7th/cmp-nvim-lsp',

  -- Java
  {
    src = 'https://github.com/JavaHello/spring-boot.nvim',
    version = '218c0c26c14d99feca778e4d13f5ec3e8b1b60f0',
  },
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/mfussenegger/nvim-dap',

  'https://github.com/nvim-java/nvim-java',

  -- None-ls
  'https://github.com/nvimtools/none-ls.nvim',
  'https://github.com/nvimtools/none-ls-extras.nvim',
  'https://github.com/jayp0521/mason-null-ls.nvim',

  -- INFO: Editor

  -- Auto Complete
  'https://github.com/hrsh7th/nvim-cmp',
  'https://github.com/L3MON4D3/LuaSnip',
  'https://github.com/saadparwaiz1/cmp_luasnip',
  'https://github.com/hrsh7th/cmp-nvim-lsp',
  'https://github.com/hrsh7th/cmp-buffer',
  'https://github.com/hrsh7th/cmp-path',
  'https://github.com/rafamadriz/friendly-snippets',

  -- Gitsigns
  'https://github.com/lewis6991/gitsigns.nvim',

  -- IndentBlankline
  'https://github.com/lukas-reineke/indent-blankline.nvim',

  -- Misc
  'https://github.com/windwp/nvim-ts-autotag',
  'https://github.com/windwp/nvim-autopairs',
  'https://github.com/norcalli/nvim-colorizer.lua',
  'https://github.com/folke/todo-comments.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/andweeb/presence.nvim',

  -- Telescope
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  'https://github.com/nvim-telescope/telescope-ui-select.nvim',

  -- Treesitter
  'https://github.com/nvim-treesitter/nvim-treesitter',

  -- INFO: DAP

  -- Core
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/rcarriga/nvim-dap-ui',
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/jay-babu/mason-nvim-dap.nvim',
  'https://github.com/theHamsta/nvim-dap-virtual-text',
}
