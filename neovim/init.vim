set tabstop=4
set hlsearch
set shiftwidth=4
set smarttab
set autoindent
set number
syntax on
set mouse=a
set clipboard=unnamedplus
set foldmethod=syntax
set nofoldenable
filetype plugin on 

call plug#begin("~/.vim/plugged")

	Plug 'ap/vim-css-color'
	Plug 'tpope/vim-commentary'
	Plug 'preservim/nerdtree' 
	Plug 'vim-airline/vim-airline'
	Plug 'tpope/vim-sensible'
	Plug 'mhinz/vim-startify'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'rafi/awesome-vim-colorschemes'
	Plug 'nightsense/carbonized'
	Plug 'joshdick/onedark.vim'
	Plug 'preservim/tagbar'
	Plug 'm4xshen/autoclose.nvim'
	Plug 'bfrg/vim-c-cpp-modern'

call plug#end()

nmap <F8> :TagbarToggle<CR>

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif



inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"

lua << EOF
require("autoclose").setup()
vim.api.nvim_set_keymap("i", "jj", "<Esc>", {noremap = false})
EOF
