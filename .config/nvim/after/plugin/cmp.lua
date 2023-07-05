local cmp = require 'cmp'
local luasnip = require("luasnip")
cmp.setup({
  -- snippet = {
  -- REQUIRED - you must specify a snippet engine
  --expand = function(args)
  --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
  -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
  -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  --end,
  --},
  completion = { completeopt = 'menu,menuone,noinsert' },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  matching = {
    disallow_fuzzy_matching = false,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-j>'] = cmp.mapping.scroll_docs(-4),
    ['<C-k>'] = cmp.mapping.scroll_docs(4),
    ['<C-space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<C-l>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
			-- this will auto complete if our cursor in next to a word and we press tab
            -- elseif has_words_before() then
            --     cmp.complete()
            else
                fallback()
            end
        end, {"i", "s"}),
    ["<C-s>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, {"i", "s"})

  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, 
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  sources = {
    { name = 'buffer' }
  },
  mapping = cmp.mapping.preset.cmdline()
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  matching = {
    disallow_fuzzy_matching = false,
  },
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
