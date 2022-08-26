local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/AppData/Local/nvim/plugged')

Plug 'mattn/emmet-vim'
Plug 'wakatime/vim-wakatime'

Plug 'preservim/nerdtree'
-- Status Line
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug ('neoclide/coc.nvim', {branch= 'release'})
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ayu-theme/ayu-vim'


vim.call('plug#end')
