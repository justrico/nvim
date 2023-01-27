require('keymap.colemak')
local bind = require('keymap.binding')
local map = bind.map_cmd
local mapcr = bind.map_with_cr

local basic_map = {
	-- normal mode
	['n|;'] = map(':'):noremap(),
	['n|s'] = map(''):noremap(),
		-- save & quit
	['n|S'] = mapcr('w'):noremap(),
    ['n|Q'] = mapcr('BufferLinePickClose'):noremap(),
	['n|<A-q>'] = mapcr('q'):noremap(),
	['n|<A-Q>'] = mapcr('qa'):noremap(),
	['n|l'] = map('u'):noremap(),
		-- search move
	['n|='] = map('nzz'):noremap(),
	['n|-'] = map('Nzz'):noremap(),
		-- toggle search highlight
	['n|<leader>h'] = mapcr('set hlsearch!'):noremap():silent(),
        -- buffer
    ['n|<leader>i'] = mapcr('bn'):noremap(),
    ['n|<leader>n'] = mapcr('bp'):noremap(),
		-- tab management
	['n|tu'] = mapcr('tabnew'):noremap(),
	['n|ti'] = mapcr('tabnext'):noremap(),
	['n|tn'] = mapcr('tabprevious'):noremap(),
	['n|tmi'] = mapcr('+tabmove'):noremap(),
	['n|tmn'] = mapcr('-tabmove'):noremap(),
        -- window cursor movement
    ['n|<leader>w'] = map('<c-w>w'):noremap(),  -- cursor loop in windows
    ['n|<leader>n'] = map('<c-w>h'):noremap(),
    ['n|<leader>e'] = map('<c-w>j'):noremap(),
    ['n|<leader>u'] = map('<c-w>k'):noremap(),
    ['n|<leader>i'] = map('<c-w>l'):noremap(),
        -- open new window to four direction
    ['n|su'] = mapcr('set nosplitbelow<CR>:split<CR>:set splitbelow'):noremap(),
    ['n|se'] = mapcr('set splitbelow<CR>:split'):noremap(),
    ['n|sn'] = mapcr('set nosplitright<CR>:vsplit<CR>:set splitright'):noremap(),
    ['n|si'] = mapcr('set splitright<CR>:vsplit'):noremap(),
        -- resize window with arrow keys
    ['n|<up>'] = mapcr('res -3'):noremap(),
    ['n|<down>'] = mapcr('res +3'):noremap(),
    ['n|<left>'] = mapcr('vertical resize+3'):noremap(),
    ['n|<right>'] = mapcr('vertical resize-3'):noremap(),
        -- change windows layout
    ['n|sh'] = map('<c-w>b<c-w>K'):noremap(),
    ['n|sv'] = map('<c-w>b<c-w>H'):noremap(),
}

bind.nvim_load_mapping(basic_map)
