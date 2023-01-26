local general = require('core.general')

local function load_options()
    local set_options = {
        termguicolors = true,  -- default off, enables 24-bit RGB color, 必开
        backspace = "indent,eol,start",  -- 设置退格键何时可以删除字符，若不设置start则不能删除原来的字符，只能删除新添的字符
        so = 3,  -- scrolloff 设置光标离上下边界的最小行距为多少时开始滚动内容
        wrap = false,  -- default on, 超过设置的 textwidth 值时自动换行
        list = true,  -- 配合 listchars 显示制表符、行尾空格等不可见空字符
        listchars = "tab:▸·,nbsp:+,trail:▫,extends:→,precedes:←",
        ruler = true,  -- 右下角显示当前光标的行列信息，列显示的是 字符数-字符宽度
        showcmd = true,  -- 右下角显示命令完成前已按下的键
        number = true,  -- 显示行号
        relativenumber = true,  -- 显示相对行号，光标行显示绝对行号
        cursorline = true,  -- 高亮光标行
        autoindent = true,  -- 跟随上一行的缩进方式
        ignorecase = true,  -- 搜索匹配不区分大小写
        smartcase = true,  -- 搜索结果智能匹配
        infercase = true,  -- Vim内置自动补全不忽略大小写
        backup = false,
        writebackup = false,
        swapfile = false,
        autoread = true,
        history = 2000,
        tabstop = 4,  -- 制表符所占字符数
        expandtab = true,  -- true 则将制表符替换为空格
        shiftwidth = 4,  -- 段落排版自动缩进字符数
        softtabstop = 4,  -- 缩进每4个空格会合并成一个制表符
        breakindentopt = "shift:2,min:20",
        display = "lastline",
        showbreak = "↳  ",
        wildignore = ".git,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,*.bak,**/tmp/**,*.DS_Store,**/node_modules/**",  -- 命令补全时忽略的文件
        -- nocompatible = true,  -- no need for neovim
        -- encoding = "utf-8",  -- neovim always use this
        -- hlsearch = true,  -- default on，搜索结果高亮显示
        -- incsearch = true,  -- default on，增量搜索，边打边搜
        -- linebreak = true,  -- wrap=false 时此选项开启也无效
    }

    local function isempty(s)
        return s == nil or s == ''
    end

    -- custom python provider
    local conda_prefix = os.getenv("CONDA_PREFIX")
    if not isempty(conda_prefix) then
        vim.g.python_host_prog = conda_prefix .. "/bin/python"
        vim.g.python3_host_prog = conda_prefix .. "/bin/python"
    elseif general.is_mac then
        vim.g.python_host_prog = "/usr/bin/python"
        vim.g.python3_host_prog = "/usr/local/bin/python3"
    else
        vim.g.python_host_prog = "/usr/bin/python"
        vim.g.python3_host_prog = "/usr/bin/python3"
    end

    for name, value in pairs(set_options) do
        vim.o[name] = value
    end
end

load_options()
