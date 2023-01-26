require('core.general')
require('core.options')

vim.cmd[[ au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]
vim.cmd[[ au BufNewFile,BufRead *.html,*.css,*.js,*.ts,*.vue set noexpandtab tabstop=2 shiftwidth=2 ]]
