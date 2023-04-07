local mason_lspcfg_status, mason_lspcfg = pcall(require, 'mason-lspconfig')
if not mason_lspcfg_status then
    return
end

local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status then
    return
end

mason_lspcfg.setup({
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "sumneko_lua" }
    -- This setting has no relation with the `automatic_installation` setting.
    ensure_installed = {},

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    automatic_installation = false,
})

local keymap = vim.keymap

-- enable keybinds for available lsp server
local on_attach = function(client, bufnr)
    -- keybind options
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- set keybinds
    keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
    keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
    keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
    keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
    keymap.set("n", "<leader>K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
    keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

end

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "󰵚 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- used to enable autocompletion
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- configure html server
lspconfig['html'].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure clangd server
lspconfig['clangd'].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure rust server
lspconfig['rust_analyzer'].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure lua server (with special settings)
-- sumneko_lua has renamed to lua_ls, see https://github.com/williamboman/mason-lspconfig.nvim/pull/148
-- and NOT support Alpine Linux
-- lspconfig["lua_ls"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     settings = { -- custom settings for lua
--         Lua = {
--             -- make the language server recognize "vim" global
--             diagnostics = {
--                 globals = { "vim" },
--             },
--             workspace = {
--                 -- make language server aware of runtime files
--                 library = {
--                     [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--                     [vim.fn.stdpath("config") .. "/lua"] = true,
--                 },
--             },
--         },
--     },
-- })
