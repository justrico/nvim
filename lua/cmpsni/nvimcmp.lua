local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
    return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.select_prev_item(), -- previous suggestion
        ['<C-e>'] = cmp.mapping.select_next_item(), -- next suggestion
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-c>'] = cmp.mapping.complete(), -- show completion suggestions
        ['<C-t>'] = cmp.mapping.abort(), -- close completion window
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- lsp
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'buffer' }, -- text within current buffer
        { name = 'path' }, -- file system paths
        -- { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }),
    window = {
        completion = cmp.config.window.bordered({
            col_offset = -3,
            side_padding = 0,
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        }),
        documentation = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        }),
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            local kind = lspkind.cmp_format({
                mode = "symbol_text",
                maxwidth = 36,
            })(entry, vim_item)

            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. strings[1] .. " "
            kind.menu = "    (" .. strings[2] .. ")"

            return kind
        end,
    },
    view = {
        entries = { name = "custom", selection_order = "near_cursor" },
    },
})
