
require'lspconfig'.tsserver.setup {}

local has_any_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require'lspconfig'.clangd.setup{}
require "lsp_signature".setup()
vim.o.completeopt = 'menuone,noselect'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local cmp = require'cmp'
local luasnip = require("luasnip")


local lspkind = require('lspkind')
local source_mapping = {
  buffer = "◉ Buffer",
  nvim_lsp = "👐 LSP",
  nvim_lua = "🌙 Lua",
  cmp_tabnine = "💡 Tabnine",
  path = "🚧 Path",
  luasnip = "🌜 LuaSnip"
}

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    -- { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lua' },
  },

  --formatting = {
  --  format = function(entry, vim_item)
  --    vim_item.kind = lspkind.presets.default[vim_item.kind]
  --    local menu = source_mapping[entry.source.name]
  --    if entry.source.name == 'cmp_tabnine' then
  --      if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
  --        menu = entry.completion_item.data.detail .. ' ' .. menu
  --      end
  --      vim_item.kind = ''
  --    end
  --    vim_item.menu = menu
  --    return vim_item
  --  end
  --},

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {

    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),

    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
})

-- require("luasnip/loaders/from_vscode").load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "/Users/premiersoft/dev/snippets" } })
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
   if client.name == "dartls" then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        -- Only format if the file is a Dart file
        if vim.bo.filetype == "dart" then
          -- New formatting function in NeoVim 0.9
          vim.lsp.buf.format({
            filter = function(client)
              -- Ensure the formatting is only done by dartls
              return client.name == "dartls"
            end,
            bufnr = bufnr
          })
        end
      end
    })
  end
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  --vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
  -- vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
  vim.api.nvim_buf_create_autocmd(bufnr, "BufWritePre", {
   pattern = "*.dart",
   callback = function() vim.lsp.buf.formatting_sync(nil, 1000) end
  })
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.dart",
    callback = function()
        vim.cmd("silent! !dartfmt -w %")
    end
})
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end
      -- vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
      -- vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format()")
     -- vim.cmd [[
 -- autocmd BufWritePre *.dart lua vim.lsp.buf.formatting_sync(nil, 1000)
-- ]]




local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
 require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['dartls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    -- Additional Dart-specific settings...
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}







