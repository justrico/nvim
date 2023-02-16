require('core.general')
require('core.options')

-- restore last cursor place
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.fn.setpos(".", vim.fn.getpos("'\""))
            vim.cmd("silent! foldopen")
        end
    end,
})

-- turn off new line auto be commented after a commit line
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "*",
    callback = function()
        vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
    end,
})

vim.cmd[[ au BufNewFile,BufRead *.html,*.css,*.js,*.ts,*.vue set noexpandtab tabstop=2 shiftwidth=2 ]]

-- The old command below can't restore the column position
-- vim.cmd[[ au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]

-- Inner colorcheme
vim.cmd [[ colorscheme slate ]]
