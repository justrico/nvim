local general = {}
local os_name = vim.loop.os_uname().sysname

function general:load_variables()
    self.is_mac = os_name == "Darwin"
    self.is_linux = os_name == "Linux"
    self.is_wsl = vim.fn.has("wsl") == 1
    self.vim_path = vim.fn.stdpath("config")
    local path_sep = "/"
    local home = os.getenv("HOME")
    self.cache_dir = home .. path_sep .. ".cache" .. path_sep .. "nvim" .. path_sep
    self.modules_dir = self.vim_path .. path_sep .. "modules"
    self.home = home
    self.data_dir = string.format("%s/site/", vim.fn.stdpath("data"))
end

general:load_variables()

return general
