local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    return
end

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) -- apt install ripgrep
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local action_layout = require('telescope.actions.layout')
telescope.setup({
    defaults = {
        prompt_prefix = ' 🔭 ',
        selection_caret = '🎇',
        file_ignore_patterns = { ".git/", ".cache", "%.class" },
        mappings = {
            i = {
                ['<C-h>'] = 'which_key', -- shotcut help
                ['<A-u>'] = 'move_selection_previous',
                ['<A-e>'] = 'move_selection_next',
                ['<Down>'] = 'move_selection_next',
                ['<Up>'] = 'move_selection_previous',
                ['<C-c>'] = 'close',
                ['<CR>'] = 'select_default',
                ['<C-u>'] = 'preview_scrolling_up',
                ['<C-e>'] = 'preview_scrolling_down',
                ['<A-n>'] = 'results_scrolling_up',
                ['<A-i>'] = 'results_scrolling_down',
                ['<A-p>'] = action_layout.toggle_preview,
            },
            n = {
            }
        },
        layout_config = {
            width = 0.86,
            preview_cutoff = 80
        }
    },
    pickers = {
        find_files = {
            --theme = 'dropdown',
        }
    }
})
