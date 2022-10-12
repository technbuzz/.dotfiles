lua << EOF
require('configs')
require('keymaps')
require('plugs')
require('plug-config/telescope-config')
require('plug-config/comment-config')
require('plug-config/lualine-config')
require('coc-config')
require('plug-config/icons-config')
-- require('theme-config')
require('plug-config/gruvbox-config')
require('plug-config/nvimtree-config')
require('plug-config/toggleterm-config')
require('plug-config/cmp-config')
require('lsp-config')
--require('plug-config/nx-config')
EOF

let g:airline#extensions#tabline#fnamemod = ':t'


" From thoughbot https://www.youtube.com/watch?v=XA2WjJbmmoM&t=408s

" Search down into subfolders
" Provide file completing for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Excludes folder from find command
set wildignore+=**/node_modules/** 





" let ayucolor="mirage"        " for dark version of theme

" This was from the colorscheme section
"set termguicolors          " enable true colors support
" set background = dark
colorscheme gruvbox


"let mapleader = " "
nnoremap <leader>pv :Vex<CR>
vnoremap <leader>p "_dP
vnoremap <leader>y "*y
nnoremap <leader>y "*y

vnoremap <leader>J :m '>+1<CR>gv=gv
vnoremap <leader>K :m '<-2<CR>gv=gv



