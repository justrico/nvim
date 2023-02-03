local status_ok, catppuccin = pcall(require, 'catppuccin')
if not status_ok then
    return
end

local status_ok, blankline = pcall(require, 'indent_blankline')
if not status_ok then
    return
end

local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
    return
end

local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    return
end

-- catppuccin
vim.cmd.colorscheme "catppuccin-frappe"


-- indent-blankline.nvim
blankline.setup{
    enabled = true,
    space_char_blankline = " ",
    use_treesitter = true,
    char_highlight = 'LineNr',
    space_char_blankline = ' ',
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = false,
    show_first_indent_level = true,
    show_trailing_blankline_indent = false,
    viewport_buffer = 20,
    context_highlight_list = {
        'rainbowcol1',
        'rainbowcol2',
        'rainbowcol3',
        'rainbowcol4',
        'rainbowcol5',
        'rainbowcol6',
        'rainbowcol7',
    },
    buftype_exclude= {
        'quickfix',
        'help',
        'nofile',
        'prompt',
        'terminal',
    },
    filetype_exclude = {
        '',
        'neo-tree',
        'Trouble',
        'dashboard',
        'fugitive*',
        'git*',
        'help',
        'lspinfo',
        'mason',
        'packer',
    }
}


-- bufferline
bufferline.setup{
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }):string
        close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
        right_mouse_command = nil, -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
        indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'icon', -- 'icon' | 'underline' | 'none'
        },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 18,
        diagnostics = false, -- false | "nvim_lsp" | "coc"
        diagnostics_update_in_insert = false,
        offsets = {
            {
                filetype = "neo-tree",
                text = "File Explorer", -- "File Explorer" | function
                text_align = "left", -- "left" | "center" | "right"
                separator = true
            }
        },
        color_icons = true, -- whether or not to add the filetype icon highlights
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' }
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
        sort_by = 'insert_at_end', -- 'insert_at_end' | 'insert_after_current' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
            -- add custom logic
            --return buffer_a.modified > buffer_b.modified
        --end
    }
}


-- lualine
local colors = {
    red = '#cdd6f4',
    grey = '#181825',
    black = '#303446',
    white = '#1e1e2e',
    light_green = '#6c7086',
    orange = '#fab387',
    green = '#a6e3a1',
    blue = '#80A7EA',
}

local theme = {
	normal = {
		a = { fg = colors.black, bg = colors.blue },
		b = { fg = colors.blue, bg = colors.white },
		c = { fg = colors.white, bg = colors.black },
		z = { fg = colors.white, bg = colors.black },
	},
	insert = { a = { fg = colors.black, bg = colors.orange } },
	visual = { a = { fg = colors.black, bg = colors.green } },
	replace = { a = { fg = colors.black, bg = colors.green } },
}

local vim_icons = {
	function()
		return " "
	end,
	separator = { left = "", right = "" },
	color = { bg = "#1e1e2e", fg = "#80A7EA" },
}

local space = {
	function()
		return " "
	end,
	color = { bg = colors.black, fg = "#80A7EA" },
}

local filename = {
	'filename',
	color = { bg = "#80A7EA", fg = "#242735" },
	separator = { left = "", right = "" },
}

local filetype = {
	"filetype",
	icon_only = true,
	colored = true,
	color = { bg = "#1e1e2e" },
	separator = { left = "", right = "" },
}

local filetype_tab = {
	"filetype",
	icon_only = true,
	colored = true,
	color = { bg = "#1e1e2e" },
}

local fileformat = {
	'fileformat',
	color = { bg = "#b4befe", fg = "#1e1e2e" },
	separator = { left = "", right = "" },
}

local encoding = {
	'encoding',
	color = { bg = "#1e1e2e", fg = "#80A7EA" },
	separator = { left = "", right = "" },
}

local branch = {
	'branch',
	color = { bg = "#a6e3a1", fg = "#1e1e2e" },
	separator = { left = "", right = "" },
}

local diff = {
	"diff",
	color = { bg = "#1e1e2e", fg = "#1e1e2e" },
	separator = { left = "", right = "" },
}

local modes = {
	'mode', fmt = function(str) return str:sub(1, 1) end,
	color = { bg = "#fab387", fg = "#1e1e2e" },
	separator = { left = "", right = "" },
}

local function getLspName()
	local msg = 'No Active Lsp'
	local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return "  " .. client.name
		end
	end
	return "  " .. msg
end

local dia = {
	'diagnostics',
	color = { bg = "#1e1e2e", fg = "#80A7EA" },
	separator = { left = "", right = "" },
}

local lsp = {
	function()
		return getLspName()
	end,
	separator = { left = "", right = "" },
	color = { bg = "#f38ba8", fg = "#1e1e2e" },
}

local progress = {
    'progress',
    color = { fg = "#b4befe", bg = "#1e1e2e" },
	separator = { left = "", right = "" },
}

lualine.setup {

	options = {
		icons_enabled = true,
		theme = theme,
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},

	sections = {
		lualine_a = {
			--{ 'mode', fmt = function(str) return str:gsub(str, "  ") end },
			modes,
			vim_icons,
			--{ 'mode', fmt = function(str) return str:sub(1, 1) end },
		},
		lualine_b = {
			space,
		},
		lualine_c = {
			filename,
			filetype,
			space,
			branch,
			diff,
		},
		lualine_x = {
			space,
		},
		lualine_y = {
			encoding,
			fileformat,
            progress,
			space,
		},
		lualine_z = {
			dia,
			lsp,
		}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {
		--lualine_a = {
			--buffer,
		--},
		--lualine_b = {
		--},
		--lualine_c = {},
		--lualine_x = {
			--tabs,
		--},
		--lualine_y = {
			--space,
		--},
		--lualine_z = {
		--},
	},
	winbar = {},
	inactive_winbar = {},
}
