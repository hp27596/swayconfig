:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set linebreak
:set so=5
:set clipboard=unnamed
" :set spell

call plug#begin()

Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
" Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
" Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
" Plug 'https://github.com/jmcantrell/vim-virtualenv'
Plug 'https://github.com/jistr/vim-nerdtree-tabs'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'https://github.com/ap/vim-css-color' 
Plug 'https://github.com/lambdalisue/suda.vim'
" Plug 'https://github.com/xolox/vim-session'
" Plug 'https://github.com/xolox/vim-misc'
" Plug 'https://github.com/kassio/neoterm'
Plug 'https://github.com/akinsho/toggleterm.nvim'
" Plug 'https://github.com/wfxr/minimap.vim'
" Plug 'https://github.com/severin-lemaignan/vim-minimap'
Plug 'https://github.com/psliwka/vim-dirtytalk'
Plug 'https://github.com/jiangmiao/auto-pairs'

call plug#end()

set encoding=UTF-8

function SaveSess()
	NERDTreeTabsClose
	mksession!
	NERDTreeTabsOpen
endfunction

command Sr source Session.vim <bar> CocRestart
command Ss call SaveSess() "workaround because mksession conflicts with NERDTree
command Sq call SaveSess() <bar> :wqa

nnoremap <C-f> :NERDTreeFocusToggle<CR>
nnoremap <C-t> :NERDTreeTabsToggle<CR>
nnoremap <C-l> :NERDTreeRefreshRoot<CR>

nnoremap <C-n> :tabnew<CR>
nnoremap <C-left> :tabprevious<CR>
nnoremap <C-right> :tabnext<CR>

nnoremap U <C-r>

noremap <C-c> "+y<CR>
noremap <C-x> "+d<CR>
noremap <C-v> "+p<CR>
noremap <C-a> ggVG<CR>

inoremap <C-v> <C-r>*




nmap <F5> :TermExec cmd="source ~/nvpython/neovim/bin/activate && python %" <CR><C-w>j
nmap <F6> :TermExec cmd="source ~/nvpython/neovim/bin/activate && sudo python %" <CR><C-w>j

tnoremap <C-w><up> <C-\><C-n><C-w>k<C-w>l
nmap <C-w><up> <C-w>k<C-w>l


nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >g
vnoremap <S-Tab> <g

"nnoremap <Bs> X
"vnoremap <Bs> X

nnoremap o o<Esc>
nnoremap O O<Esc>

" nmap <F8> :TagbarToggle<CR>

tnoremap <Esc> <C-\><C-n>

:set completeopt-=preview " For No Previews

:colorscheme molokai

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let NERDTreeShowHidden=1
" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif

" " airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

let g:python3_host_prog = '~/nvpython/neovim/bin/python3'

let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_autofind = 1

" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"   --  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
"   highlight = {
"     enable = true,              -- false will disable the whole extension
"     disable = { "c", "rust" },  -- list of language that will be disabled
"     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
"     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
"     -- Using this option may slow down your editor, and you may see some duplicate highlights.
"     -- Instead of true it can also be a list of languages
"     additional_vim_regex_highlighting = false,
"   },
" }

lua <<EOF
require("toggleterm").setup {
	open_mapping = [[<c-\>]],
	start_in_insert = true,
	insert_mappings = true,
	close_on_exit = false,
}
EOF

:hi Normal ctermbg=none
:highlight NonText ctermbg=none



