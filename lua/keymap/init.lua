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
    ['n|Q'] = mapcr('BufferLinePickClose'):noremap():silent(),
	['n|<A-q>'] = mapcr('q'):noremap(),
	['n|<A-Q>'] = mapcr('qa'):noremap(),
	['n|l'] = map('u'):noremap(),
		-- search move
	['n|='] = map('nzz'):noremap(),
	['n|-'] = map('Nzz'):noremap(),
		-- toggle search highlight
	['n|<leader>h'] = mapcr('set hlsearch!'):noremap():silent(),
        -- buffer
    ['n|tb'] = mapcr('BufferLinePick'):noremap():silent(),
    --['n|<leader>ti'] = mapcr('bnext'):noremap(),
    --['n|<leader>tn'] = mapcr('bprev'):noremap(),
		-- tab management
	['n|tu'] = mapcr('tabnew'):noremap():silent(),
	['n|ti'] = mapcr('tabnext'):noremap():silent(),
	['n|tn'] = mapcr('tabprevious'):noremap():silent(),
	['n|tmi'] = mapcr('+tabmove'):noremap():silent(),
	['n|tmn'] = mapcr('-tabmove'):noremap():silent(),
        -- window cursor movement
    ['n|<leader>w'] = map('<c-w>w'):noremap():silent(),  -- cursor loop in windows
    ['n|<leader>n'] = map('<c-w>h'):noremap():silent(),
    ['n|<leader>e'] = map('<c-w>j'):noremap():silent(),
    ['n|<leader>u'] = map('<c-w>k'):noremap():silent(),
    ['n|<leader>i'] = map('<c-w>l'):noremap():silent(),
        -- open new window to four direction
    ['n|<leader>su'] = mapcr('set nosplitbelow<CR>:split<CR>:set splitbelow'):noremap():silent(),
    ['n|<leader>se'] = mapcr('set splitbelow<CR>:split'):noremap():silent(),
    ['n|<leader>sn'] = mapcr('set nosplitright<CR>:vsplit<CR>:set splitright'):noremap():silent(),
    ['n|<leader>si'] = mapcr('set splitright<CR>:vsplit'):noremap():silent(),
        -- resize window with arrow keys
    ['n|<up>'] = mapcr('res -3'):noremap():silent(),
    ['n|<down>'] = mapcr('res +3'):noremap():silent(),
    ['n|<left>'] = mapcr('vertical resize+3'):noremap():silent(),
    ['n|<right>'] = mapcr('vertical resize-3'):noremap():silent(),
        -- change windows layout
    ['n|<leader>sh'] = map('<c-w>b<c-w>K'):noremap():silent(),
    ['n|<leader>sv'] = map('<c-w>b<c-w>H'):noremap():silent(),
}

bind.nvim_load_mapping(basic_map)
