local keymap = vim.api.nvim_set_keymap
local nore = { noremap = true }

keymap('n', '<leader>tt', ':NvimTreeToggle<cr>', nore)

-- auto_close solutions, https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close
local modifiedBufs = function(bufs)
    local t = 0
    for k,v in pairs(bufs) do
        if v.name:match("NvimTree_") == nil then
            t = t + 1
        end
    end
    return t
end

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and
        vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
        modifiedBufs(vim.fn.getbufinfo({bufmodified = 1})) == 0 then
            vim.cmd "quit"
        end
    end
})


---@diagnostic disable: undefined-global
require("nvim-tree").setup { -- BEGIN_DEFAULT_OPTS
    -- auto_close = true, -- removed by author, https://github.com/nvim-tree/nvim-tree.lua/issues/1005
	auto_reload_on_write = true,
	disable_netrw = true,
	hijack_cursor = false,
	hijack_netrw = false,
	hijack_unnamed_buffer_when_opening = false,
	ignore_buffer_on_setup = false,
	open_on_setup = false,
	open_on_setup_file = false,
	sort_by = "name",
	root_dirs = {},
	prefer_startup_root = false,
	sync_root_with_cwd = false,
	reload_on_bufenter = false,
	respect_buf_cwd = true,
	on_attach = "disable",
	remove_keymaps = false,
	select_prompts = false,
	view = {
		adaptive_size = false,
		centralize_selection = true,
		cursorline = true,
		debounce_delay = 15,
		width = 23,
		hide_root_folder = true,
		side = "left",
		preserve_window_proportions = true,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		mappings = {
			custom_only = false,
			list = {
				-- user mappings go here
                { key = { "<CR>", "<2-LeftMouse>" }, action = "edit" },
                { key = "tp", action = "edit_in_place" },
                { key = "to", action = "edit_no_picker" },
                { key = { "i", "<2-RightMouse>" }, action = "cd" },
                { key = "tn", action = "vsplit" },
                { key = "tu", action = "split" },
                { key = "ttp", action = "tabnew" },
                { key = "u", action = "prev_sibling" },
                { key = "e", action = "next_sibling" },
                { key = "n", action = "parent_node" },
                { key = "o", action = "close_node" },
                { key = "<Tab>", action = "preview" },
                { key = "U", action = "first_sibling" },
                { key = "E", action = "last_sibling" },
                { key = "gc", action = "toggle_git_clean" },
                { key = "gi", action = "toggle_git_ignored" },
                { key = "H", action = "toggle_dotfiles" },
                { key = "<BS>", action = "toggle_no_buffer" },
                { key = "<C-u>", action = "toggle_custom" },
                { key = "<F5>", action = "refresh" },
                { key = "a", action = "create" },
                { key = "d", action = "remove" },
                { key = "D", action = "trash" },
                { key = "cn", action = "rename" },
                { key = "<C-r>", action = "full_rename" },
                { key = "r", action = "rename_basename" },
                { key = "x", action = "cut" },
                { key = "c", action = "copy" },
                { key = "p", action = "paste" },
                { key = "y", action = "copy_name" },
                { key = "Y", action = "copy_path" },
                { key = "gy", action = "copy_absolute_path" },
                { key = "[e", action = "prev_diag_item" },
                { key = "[c", action = "prev_git_item" },
                { key = "]e", action = "next_diag_item" },
                { key = "]c", action = "next_git_item" },
                { key = "-",  action = "dir_up" },
                { key = "S", action = "system_open" },
                { key = "f", action = "live_filter" },
                { key = "F", action = "clear_live_filter" },
                { key = "q", action = "close" },
                { key = "W", action = "collapse_all" },
                { key = "E", action = "expand_all" },
                { key = "s", action = "search_node" },
                { key = ".", action = "run_file_command" },
                { key = "<C-k>", action = "toggle_file_info" },
                { key = "g?", action = "toggle_help" },
                { key = "m", action = "toggle_mark" },
                { key = "bmv", action = "bulk_move" },
			},
		},
		float = {
			enable = false,
			quit_on_focus_loss = true,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 30,
				height = 30,
				row = 1,
				col = 1,
			},
		},
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = false,
		full_name = false,
		highlight_opened_files = "none",
		highlight_modified = "none",
		root_folder_label = ":~:s?$?/..?",
		indent_width = 2,
		indent_markers = {
			enable = false,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			modified_placement = "after",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
				modified = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "",
				modified = "●",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "★",
					staged = "✓",
					unmerged = "",
					deleted = "",
					renamed = "➜",
					untracked = "✗",
					ignored = "◌",
				},
			},
		},
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		symlink_destination = true,
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = false,
		update_root = false,
		ignore_list = {},
	},
	ignore_ft_on_setup = {},
	system_open = {
		cmd = "",
		args = {},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		show_on_open_dirs = true,
		debounce_delay = 50,
		severity = {
			min = vim.diagnostic.severity.HINT,
			max = vim.diagnostic.severity.ERROR,
		},
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = false,  -- false is to display dotfiles
		git_clean = false,
		no_buffer = false,
		custom = {  -- this section won't be displayed
            ".git/",
        },
		exclude = { -- this section will be displayed
            ".gitignore",
        },
	},
	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
		ignore_dirs = {},
	},
	git = {
		enable = true,
		ignore = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
		timeout = 400,
	},
	modified = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		expand_all = {
			max_folder_discovery = 300,
			exclude = {},
		},
		file_popup = {
			open_win_config = {
				col = 1,
				row = 1,
				relative = "cursor",
				border = "shadow",
				style = "minimal",
			},
		},
		open_file = {
			quit_on_open = false,
			resize_window = true,
			window_picker = {
				enable = true,
				picker = "default",
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
		remove_file = {
			close_window = true,
		},
	},
	trash = {
		cmd = "gio trash",
	},
	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = true,
	},
	tab = {
		sync = {
			open = true,
			close = true,
			ignore = {},
		},
	},
	notify = {
		threshold = vim.log.levels.INFO,
	},
	ui = {
		confirm = {
			remove = true,
			trash = true,
		},
	},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			dev = false,
			diagnostics = false,
			git = false,
			profile = false,
			watcher = false,
		},
	},
} -- END_DEFAULT_OPTS
