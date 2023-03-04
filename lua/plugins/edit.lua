local leap_status, leap = pcall(require, 'leap')
if not leap_status then
    return
end

local move_status, move = pcall(require, 'move')
if not move_status then
    return
end

local comment_status, Comment = pcall(require, 'Comment')
if not comment_status then
    return
end

local bind = require('keymap.binding')
local map = bind.map_cmd
local mapcr = bind.map_with_cr

------ [ leap.nvim ] ------
-- require('leap').add_default_mappings(true) -- true for force mapping default keys
local leap_map = {
    ['n|sf'] = map('<Plug>(leap-forward-to)'):noremap():silent(),
    ['n|sb'] = map('<Plug>(leap-backward-to)'):noremap():silent(),
}
bind.nvim_load_mapping(leap_map)

local leap_opts = leap.opts
leap_opts.safe_labels = {} -- disable auto jump first match
leap_opts.highlight_unlabeled_phase_one_targets = true


------ [ move.nvim ] ------
local move_map = {
    ['n|<C-u>'] = mapcr('MoveLine(-1)'):noremap():silent(),
    ['n|<C-e>'] = mapcr('MoveLine(1)'):noremap():silent(),
    ['v|<C-u>'] = mapcr('MoveBlock(-1)'):noremap():silent(),
    ['v|<C-e>'] = mapcr('MoveBlock(1)'):noremap():silent(),
}
bind.nvim_load_mapping(move_map)


------ [ Comment.nvim ] ------
Comment.setup({
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = '<C-_>', -- means Ctrl+/
        ---Block-comment toggle keymap
        --block = '<C-_>',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = '<C-_>',
        ---Block-comment keymap
        --block = '<C-_>',
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        --above = 'gcO',
        ---Add comment on the line below
        --below = 'gco',
        ---Add comment at the end of line
        eol = '<leader>mm',
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
    },
    ---Function to call before (un)comment
    pre_hook = nil,
    ---Function to call after (un)comment
    post_hook = nil,
})
