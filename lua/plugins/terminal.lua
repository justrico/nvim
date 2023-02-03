local status_ok, fterm = pcall(require, 'FTerm')
if not status_ok then
    return
end

local keymap = vim.api.nvim_set_keymap
local nore = { noremap = true }
local nosi = { noremap = true, silent = true }

fterm.setup({
    ---Filetype of the terminal buffer
    ---@type string
    ft = 'FTerm',

    ---Close the terminal as soon as shell/command exits.
    ---Disabling this will mimic the native terminal behaviour.
    ---@type boolean
    auto_close = true,

    ---Highlight group for the terminal. See `:h winhl`
    ---@type string
    hl = 'Normal',

    ---Transparency of the floating window. See `:h winblend`
    ---@type integer
    blend = 0,

    ---Neovim's native window border. See `:h nvim_open_win` for more configuration options.
    -- "none" | "single" | "double" | "rounded" | "solid" | "shadow"
    border = 'rounded',

    ---Object containing the terminal window dimensions.
    ---The value for each field should be between `0` and `1`
    ---@type table<string,number>
    dimensions = {
        height = 0.8, -- Height of the terminal window
        width = 0.8, -- Width of the terminal window
        x = 0.5, -- X axis of the terminal window
        y = 0.5, -- Y axis of the terminal window
    },

    ---Replace instead of extend the current environment with `env`.
    ---See `:h jobstart-options`
    ---@type boolean
    clear_env = false,
    ---Map of environment variables extending the current environment.
    ---See `:h jobstart-options`
    ---@type table<string,string>|nil
    env = nil,

    ---Callback invoked when the terminal exits.
    ---See `:h jobstart-options`
    ---@type fun()|nil
    on_exit = nil,

    ---Callback invoked when the terminal emits stdout data.
    ---See `:h jobstart-options`
    ---@type fun()|nil
    on_stdout = nil,

    ---Callback invoked when the terminal emits stderr data.
    ---See `:h jobstart-options`
    ---@type fun()|nil
    on_stderr = nil,
})

keymap( 'n', '<C-t>', ':lua require("FTerm\").toggle()<CR>', nosi )
keymap( 't', '<C-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', nosi )

local runners = { c = 'gcc', cpp = 'g++', python = 'python', lua = 'lua', javascript = 'node' }
local dim = { height = 0.2, width = 0.6, x = 0.5, y = 0.5 },
vim.keymap.set('n', '<F5>', function()
    local buf = vim.api.nvim_buf_get_name(0)
    local ftype = vim.filetype.match({ filename = buf })
    local fname = string.gsub(buf, ftype, '')
    local exec = runners[ftype]
    if exec ~= nil then
        if exec == 'c' then
            local cb_fname = fname..'out'
            fterm.scratch({
                cmd = { exec, { buf, '-o', '&& ./a.out' } },
                border = 'rounded',
                dimensions = dim
            })
        elseif exec == 'cpp' then
            local cb_fname = fname..'.out'
            fterm.scratch({
                cmd = { exec, buf, '-Wall', '&& ./a.out' },
                border = 'rounded',
                dimensions = dim
            })
        else
            fterm.scratch({
                cmd = { exec, buf },
                border = 'rounded',
                dimensions = dim
            })
        end
    end
end)
