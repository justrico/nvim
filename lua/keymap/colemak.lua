local keymap = vim.api.nvim_set_keymap
local nore = { noremap = true }
local nosi = { noremap = true, silent = true }

-- set leader
keymap( 'n', ' ', '', nosi )
vim.g.mapleader = ' '

-- cursor movement
keymap( '', 'n', 'h', nosi )
keymap( '', 'e', 'j', nosi )
keymap( '', 'u', 'k', nosi )
keymap( '', 'i', 'l', nosi )

-- faster move
keymap( '', 'U', '3k', nosi )
keymap( '', 'E', '3j', nosi )

-- insert key
keymap( 'n', 'k', 'i', nore )
keymap( 'n', 'K', 'I', nore )
keymap( 'x', 'K', 'I', nore )

-- go to two ends of the line
keymap( '', 'N', '0', nosi )
keymap( '', 'I', '$', nosi )

-- inline movement
keymap( '', 'W', '3w', nosi )
keymap( '', 'B', '3b', nosi )

-- move selected area in visual mode
keymap( 'x', '<c-u>', ':move \'<-2<CR>gv-gv', nosi )
keymap( 'x', '<c-e>', ':move \'>+1<CR>gv-gv', nosi )
