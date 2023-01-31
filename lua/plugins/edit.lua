-- leap.nvim
-- require('leap').add_default_mappings(true) -- true for force mapping default keys
local keymap = vim.api.nvim_set_keymap
local nosi = { noremap = true, silent = true }
keymap('n', 's', '<Plug>(leap-forward-to)', nosi)
keymap('n', '<C-s>', '<Plug>(leap-backward-to)', nosi)

local leap = require('leap').opts
leap.safe_labels = {} -- disable auto jump first match
leap.highlight_unlabeled_phase_one_targets = true
