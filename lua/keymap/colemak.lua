local keymap = vim.api.nvim_set_keymap
local nore = { noremap = true }
local nosi = { noremap = true, silent = true }

-- <C-@> means ctrl+space

-- set leader
keymap( 'n', ' ', '', nosi )
vim.g.mapleader = ' '

-- cursor movement
keymap( '', 'n', 'h', nosi )
keymap( '', 'e', 'j', nosi )
keymap( '', 'u', 'k', nosi )
keymap( '', 'i', 'l', nosi )
keymap( 'i', '<C-n>', '<Esc>h', nosi )
keymap( 'i', '<C-e>', '<Esc>j', nosi )
keymap( 'i', '<C-u>', '<Esc>k', nosi )
keymap( 'i', '<C-i>', '<Esc>l', nosi )

-- faster move
keymap( '', 'U', '3k', nosi )
keymap( '', 'E', '3j', nosi )

-- insert key
keymap( '', 'k', 'i', nore )
keymap( '', 'K', 'I', nore )

-- insert new line withoud cursor in the end of line
-- keymap( 'i', '<C-o>', '<Esc>o', nosi )
-- https://stackoverflow.com/questions/598113/can-terminals-detect-shift-enter-or-control-enter
-- https://stackoverflow.com/questions/23549861/map-c-cr-in-vim
keymap( 'i', '<NL>', '<Esc>o', nosi )

-- go to two ends of the line
keymap( '', 'N', '0', nosi )
keymap( '', 'I', '$', nosi )

-- inline movement
keymap( '', 'W', '3w', nosi )
keymap( '', 'B', '3b', nosi )

-- move selected area in visual mode
keymap( 'x', '<c-u>', ':move \'<-2<CR>gv-gv', nosi )
keymap( 'x', '<c-e>', ':move \'>+1<CR>gv-gv', nosi )
