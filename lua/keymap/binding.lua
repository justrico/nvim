local attributes = {}

function attributes:new()
	local instance = {
		cmd = "",
		options = {
			noremap = false,
			silent = false,
			expr = false,
			nowait = false,
		},
		buffer = false,
	}
	setmetatable(instance, self)
	self.__index = self
	return instance
end

function attributes:map_cmd(cmd_string)
	self.cmd = cmd_string
	return self
end

function attributes:map_with_cr(cmd_string)
	self.cmd = (":%s<CR>"):format(cmd_string)
	return self
end

function attributes:map_args(cmd_string)
	self.cmd = (":%s<Space>"):format(cmd_string)
	return self
end


function attributes:silent()
	self.options.silent = true
	return self
end

function attributes:noremap()
	self.options.noremap = true
	return self
end

function attributes:with_expr()
	self.options.expr = true
	return self
end

function attributes:with_nowait()
	self.options.nowait = true
	return self
end

function attributes:with_buffer(num)
	self.buffer = num
	return self
end


local binds = {}

function binds.map_cmd(cmd_string)
	local bind_attr = attributes:new()
	return bind_attr:map_cmd(cmd_string)
end

function binds.map_with_cr(cmd_string)
	local bind_attr = attributes:new()
	return bind_attr:map_with_cr(cmd_string)
end

function binds.map_args(cmd_string)
	local bind_attr = attributes:new()
	return bind_attr:map_args(cmd_string)
end

function binds.nvim_load_mapping(mapping)
	for key, value in pairs(mapping) do
		local mode, keymap = key:match("([^|]*)|?(.*)")
		if type(value) == "table" then
			local vimcmd = value.cmd
			local options = value.options
			local buf = value.buffer
			if buf then
				vim.api.nvim_buf_set_keymap(buf, mode, keymap, vimcmd, options)
			else
				vim.api.nvim_set_keymap(mode, keymap, vimcmd, options)
			end
		end
	end
end

return binds
