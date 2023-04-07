local status_ok, treesitter = pcall(require, 'nvim-treesitter')
if not status_ok then
    return
end

-- vim.opt.foldmethod     = 'expr'
-- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
--- WORKAROUND
--vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
--  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--  callback = function()
--    vim.opt.foldmethod     = 'expr'
--    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
--  end
--})
--- ENDWORKAROUND

require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    -- parser 'help' has changed to 'vimdoc', see https://github.com/LazyVim/LazyVim/issues/524
    ensure_installed = { "vimdoc", "c", "cpp", "javascript", "typescript", "markdown", "html", "css", "lua", "go", "python", "rust" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    autotag = {
        enable = true,
    },

    indent = {
        enable = true,
    },

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        -- `false` will disable the whole extension
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    rainbow = {
        enable = false,
        extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
        max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    },
    indent = { enable = false, disable = {} },
    context_commentstring = {
        enable = true,
        config = {
            typescript = "// %s",
            css = "/* %s */",
            vue = "<!-- %s -->",
        }
    },
}
