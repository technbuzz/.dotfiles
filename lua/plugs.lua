local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/AppData/Local/nvim/plugged')

Plug 'mattn/emmet-vim'
Plug 'wakatime/vim-wakatime'
-- Commenting
Plug 'numToStr/Comment.nvim'

-- Tree
-- Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-tree.lua'

-- Status Line
Plug 'nvim-lualine/lualine.nvim'

-- Icons
Plug 'kyazdani42/nvim-web-devicons'

-- Themes
-- Plug 'Shatur/neovim-ayu'
Plug 'ellisonleao/gruvbox.nvim'

-- Native LSP Config
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'

Plug 'hrsh7th/cmp-nvim-lsp'
-- Plug ('neoclide/coc.nvim', {branch= 'release'})
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug ('akinsho/toggleterm.nvim', {tag=  '*'})

-- Dev Tools
Plug 'Equilibris/nx.nvim'

vim.call('plug#end')
