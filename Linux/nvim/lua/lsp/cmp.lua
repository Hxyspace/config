local cmp = require'cmp'
local myFunc = require 'user.conf.myfunc'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    }, {
      { name = 'path' }
    }, {
      { name = 'calc' }
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

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
  )

  -- Super-Tab
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

local luasnip = require("luasnip")

cmp.setup {

  -- ... Your other configuration ...

  mapping = {

    -- ... Your other mappings ...

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
--    elseif has_words_before() then
--      cmp.complete()
      elseif myFunc.isClosePair() then
        myFunc.moveLeft()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    -- ... Your other mappings ...

  }

  -- ... Your other configuration ...

}

require("nvim-lsp-installer").setup {}

-- Setup lspconfig.
local capabilities = require('lsp.lspconfig').capabilities
local on_attach = require('lsp.lspconfig').on_attach
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
local lspconfig = require('lspconfig')
lspconfig.clangd.setup({
    on_attach = on_attach,
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = function() return vim.loop.cwd() end,
    single_file_support = true,
    capabilities = capabilities,
    -- handlers = {['textDocument/publishDiagnostics'] = function(...) end  }
})

local enableDiag = function()
    local enable = true
    for dir in vim.fs.parents(vim.api.nvim_buf_get_name(0)) do
        if vim.fn.filereadable(dir .. "/.disableDiag") == 1 then
            enable = false
            break
        elseif vim.fn.filereadable(dir .. "/.enableDiag") == 1 then
            enable = true
            break
        end
    end
    return enable
end

local root_dir = vim.loop.cwd()
if not enableDiag() then
    lspconfig.clangd.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = {['textDocument/publishDiagnostics'] = function(...) end  }
    })
end

lspconfig.cmake.setup({
    capabilities = capabilities,
})

lspconfig.jsonls.setup({
    capabilities = capabilities,
})

lspconfig.quick_lint_js.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_dir = lspconfig.util.root_pattern("Cargo.toml", "rust-project.json"),
    capabilities = capabilities,
})

