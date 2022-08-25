local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/AppData/Local/nvim/plugged')

Plug 'mattn/emmet-vim'
Plug 'wakatime/vim-wakatime'

Plug 'preservim/nerdtree'

Plug ('neoclide/coc.nvim', {branch= 'release'})
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ayu-theme/ayu-vim'


vim.call('plug#end')
