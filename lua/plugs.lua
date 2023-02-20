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

Plug 'nvim-lua/plenary.nvim'

-- Native LSP Config
-- Plug 'neovim/nvim-lspconfig'
-- Plug 'hrsh7th/cmp-buffer'
-- Plug 'hrsh7th/cmp-path'
-- Plug 'hrsh7th/nvim-cmp'
-- Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'onsails/lspkind.nvim'
Plug 'LuaLS/lua-language-server'


-- Comments Setup
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

-- Comments Repos
Plug 'johnpapa/vscode-angular-snippets'
Plug 'rafamadriz/friendly-snippets'

-- Development in Spare time
Plug '~/desktop/practice/deleteme/nvim-plugins/ngutils.nvim'
-- Debugging
-- Because JS DAP doens't work well as of this time
-- Plug 'mfussenegger/nvim-dap'
-- Plug 'rcarriga/nvim-dap-ui'
--

-- Treesitter
Plug ('nvim-treesitter/nvim-treesitter', {['do']= ':TSUpdate'})
Plug 'p00f/nvim-ts-rainbow'
Plug 'nvim-treesitter/playground'
Plug "nvim-treesitter/nvim-treesitter-textobjects"
-- Plug "nvim-treesitter/nvim-treesitter-angular"
-- Plug ("elgiano/nvim-treesitter-angular", {branch = "topic/jsx-fix" })

-- Misc
Plug 'tpope/vim-surround'
-- I didn't had time to configure whichkey
Plug 'folke/which-key.nvim'

-- Telescope and its extension
-- Plug 'nvim-telescope/telescope.nvim'
-- Plug ('nvim-telescope/telescope-fzf-native.nvim', { ['do']= 'make' })
-- Add advanced live grep
-- Plug 'nvim-telescope/telescope-live-grep-args.nvim'

Plug ('akinsho/toggleterm.nvim', {tag=  '*'})

-- Dev Tools
Plug 'Equilibris/nx.nvim'

vim.call('plug#end')
