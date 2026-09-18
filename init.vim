syntax enable
filetype plugin indent on

set ai ts=4 sw=4
set clipboard=unnamedplus
set cmdheight=1
set formatoptions-=cro
set hidden
set laststatus=2
"set modifiable
set mouse=a
set mouse=a
set nobackup
set nohlsearch
set noshowcmd
set noshowmode
set noswapfile
set nu
set path+=**
set relativenumber
set smartindent
set smarttab
set tags=./tags;
set tagstack
set timeoutlen=333
set ttimeout
set undofile
set winminheight=1
set winminwidth=1

" --- MAPPINGS --- 
"mapclear
let mapleader=" "
nnoremap <Leader><Leader> :so $MYVIMRC<CR>

nnoremap K <NOP>
nnoremap <C-z> <NOP>
"nnoremap <esc>^[ <esc>^[
tnoremap <esc> <c-\><c-n>

" u/U undo/redo
nnoremap U <C-r>

" X as line trunc
nnoremap X J

" Js/Ks as page down/up
vnoremap J <C-d>zz
nnoremap J <C-d>zz
nnoremap K <C-u>zz
vnoremap K <C-u>zz

" Start/end of line
nnoremap H 0
vnoremap H 0
nnoremap L $
vnoremap L $

" Top/bottom of file/page
nnoremap T gg
vnoremap T gg
nnoremap tt G
vnoremap tt G
nnoremap gh H
vnoremap gh H
nnoremap gl L
vnoremap gl L

" d doesnt yank
nnoremap d "_d
vnoremap d "_d
nnoremap dH "_d0
nnoremap dL "_d$
nnoremap dT "_dgg
nnoremap dtt "_dG

" s doesnt yank
nnoremap s "_s
vnoremap s "_s

" (Un)Comment
"vnoremap # gc

" Swap Case
"nnoremap <Tab> g~iw
nnoremap <Tab> ~h
vnoremap <Tab> ~gv
" Uppercase
"nnoremap <S-Tab> gUiw
nnoremap <S-Tab> vU
vnoremap <S-Tab> Ugv

" Auto center navigation
nnoremap <expr> \ "'" . nr2char(getchar()) . 'zz'
nnoremap n nzz
nnoremap N Nzz

" C-d as decrement
nnoremap <C-d> <C-x>

" Paste
"nnoremap p p=']
cmap <C-v> <C-r>+
"inoremap <C-v> <Esc>p}a
" C-(...) as usual commands
nnoremap <silent><C-q> :q!<CR>
nnoremap <silent><C-x> :x!<CR>
nnoremap <silent><C-s> :w!<CR>
nnoremap <silent><C-e> :e .<CR>

" Command mode buffer(<bar> = |(pipe))
cmap <bar> <C-f>
nnoremap q: <nop>

" Run selection as sys/vim command and outputs
vnoremap ! "cy:call setreg('c', execute(trim(@c)))<CR>gv"cpV']
vnoremap <CR> "cy:call setreg('c', system(trim(@c)))<CR>gv"cpV']

" Pandoc format text
vnoremap f :!pandoc -f markdown -t plain<cr>
vnoremap <leader>p :!pandoc -f markdown+raw_tex+raw_html -t plain<CR>

" ctags
command! Tag !ctags -R .
nnoremap gD g<c-]>zz
vnoremap gD g<c-]>zz
"nnoremap gT :pop!<CR>
"vnoremap gT :pop!<CR>

" Previous placement
"nnoremap gg <C-o>
"vnoremap gg <C-o>
"nnoremap G <C-i>
"vnoremap G <C-i>
nnoremap gg <cmd>lua require('bufjump').backward_same_buf()<CR>zz
vnoremap gg <cmd>lua require('bufjump').backward_same_buf()<CR>zz
nnoremap G <cmd>lua require('bufjump').forward_same_buf()<CR>zz
vnoremap G <cmd>lua require('bufjump').forward_same_buf()<CR>zz
nnoremap gu g,zz

" Panes
nnoremap <silent><C-\|> <C-w>v<C-w>l
nnoremap <silent><C-_> <C-w>s<C-w>j
nnoremap <silent><C-h> <C-w>h
nnoremap <silent><C-j> <C-w>j
nnoremap <silent><C-k> <C-w>k
nnoremap <silent><C-l> <C-w>l
"nnoremap <silent><C-q> <C-w>c

" --- || ---

"packadd termdebug
"let g:termdebug_popup = 0
"let g:termdebug_wide = 123

" Thin cursor at insert mode
" - Option 1 -
"if exists('$TMUX')
"    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
"    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
"else
"    let &t_SI = "\e[5 q"
"    let &t_EI = "\e[2 q"
"endif
" - Option 2 -
"let &t_SI = "\e[6 q"
"let &t_EI = "\e[2 q"

let g:neovide_opacity = 0.88
if exists('g:neovide')
	set guifont=CaskaydiaCove\ Nerd\ Font\ Mono:h16
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'ellisonleao/gruvbox.nvim'
"Plug 'junegunn/vim-easy-align'
Plug 'kwkarlwang/bufjump.nvim'
Plug 'stevearc/oil.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'zsugabubus/crazy8.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'Z1g0t0/vim-drag-selection'
Plug 'Z1g0t0/vim-pane-resize'
Plug 'nvim-mini/mini.nvim'
Plug 'nvim-mini/mini.files'
"Plug 'Z1g0t0/inline-def.nvim'
call plug#end()

colorscheme gruvbox
highlight Comment gui=NONE cterm=NONE
highlight String gui=NONE cterm=NONE

" (-Lines, Col){Register}[Write Time](Status)
let g:format = "(%-L,%C){%_}[%H:%M:%S]<%W>"
let g:register_width = 120
let g:register_trunc = [0, '(...)']      
let g:register_nl = '[↵]'
let g:register_tab = '[➜ ]'
let g:modified_msg = '*'
let g:unmodified_msg = '✓'
" Collapse multiple spaces
let g:register_replace = ['\s\+', ' ']

lua << EOF
require("bufjump").setup({
	forward_key = false,  -- Disable default mappings 
	backward_key = false,
	on_success = nil
})

require('mini.icons').setup()

-- OIL --
require('oil').setup( {
	default_file_explorer = true,
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	watch_for_changes = true,
	columns = { 'icon' },
	view_options = {
		show_hidden = true,
		natural_order = 'fast',
		case_insensitive = vim.fn.has('win32') == 1,
	},
	preview_win = {
		update_on_cursor_moved = true,
		preview_method = 'fast_scratch',
	},
	-- false so oil does not steal <C-s> (save), <C-h>/<C-l> (panes)
	use_default_keymaps = false,
	keymaps = {
		['g?']    = { 'actions.show_help', mode = 'n' },
		['<CR>']  = 'actions.select',
		['<BS>']  = { 'actions.parent', mode = 'n' },
		['z']     = 'actions.preview',
		['gs']    = { 'actions.change_sort', mode = 'n' },
		['!']    = 'actions.open_external',
		['g.']    = { 'actions.toggle_hidden', mode = 'n' },
		['gr']    = 'actions.refresh',
	},
})
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'oil',
	callback = function()
		-- custom cuts
		vim.keymap.set('n', 'x', 'dd', { buffer = true, 
										 desc = 'cut file' })
		vim.keymap.set('v', 'x', 'd', { buffer = true, 
										desc = 'cut files' })
		-- cd as you go
		local current_dir = require("oil").get_current_dir()
		if current_dir then
			vim.cmd.lcd(current_dir)
		end
	end, 
})
vim.api.nvim_create_autocmd('TextChanged', {
	group = vim.api.nvim_create_augroup('OilAutoCd', { clear = true }),
	pattern = 'oil:///*',
	callback = function()
		if vim.bo.filetype == 'oil' then
			local current_dir = require("oil").get_current_dir()
			if current_dir then
				vim.cmd.lcd(current_dir)
			end
		end
	end,
})
-- || -- 

-- Harpoon --
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<Leader>a", mark.add_file)            -- Add current file to Harpoon list
vim.keymap.set("n", "<Leader>e", ui.toggle_quick_menu)     -- Show Harpoon menu
vim.keymap.set("n", "<Leader>0", function() ui.nav_file(0) end) -- Jump to pinned file 1
vim.keymap.set("n", "<Leader>1", function() ui.nav_file(1) end) -- Jump to pinned file 1
vim.keymap.set("n", "<Leader>2", function() ui.nav_file(2) end) -- Jump to pinned file 2
vim.keymap.set("n", "<Leader>3", function() ui.nav_file(3) end) -- Jump to pinned file 2
vim.keymap.set("n", "<Leader>4", function() ui.nav_file(4) end) -- Jump to pinned file 2
vim.keymap.set("n", "<Leader>5", function() ui.nav_file(5) end) -- Jump to pinned file 2
vim.keymap.set("n", "<Leader>6", function() ui.nav_file(6) end) -- Jump to pinned file 2
vim.keymap.set("n", "<Leader>7", function() ui.nav_file(7) end) -- Jump to pinned file 2
vim.keymap.set("n", "<Leader>8", function() ui.nav_file(8) end) -- Jump to pinned file 2
vim.keymap.set("n", "<Leader>9", function() ui.nav_file(9) end) -- Jump to pinned file 2
-- || --
EOF


