-- NOTE: to make any of this work you need a language server.
-- If you don't know what that is, watch this 5 min video:
-- https://www.youtube.com/watch?v=LaS32vctfOY

-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set('n', 'F', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

-- You'll find a list of language servers here:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- These are example language servers.
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({})

-- lsp for ruby with formatting and autoindentaion
lspconfig.ruby_lsp.setup({
  cmd_env = {
    BUNDLE_GEMFILE = '.ruby-lsp/Gemfile',
  },
  cmd = { 'bundle', 'exec', 'ruby-lsp' },
  init_options = {
    formatter = 'rubocop_internal',
    linters = { 'rubocop_internal' },
  },
  settings = {
    ruby = {
      format = {
        enabled = true,
      },
      lsp = {
        autoformat = true,
      },
    },
  },
  on_attach = function(client, bufnr)
    -- Enable formatting on save
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = true })
      end,
    })
  end,
})

lspconfig.gleam.setup({})
lspconfig.ocamllsp.setup({})

local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({}),
})

cmp.setup.filetype({ 'sql', 'mysql' }, {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vim-dadbod-completion' },
  },
})

lspconfig.bashls.setup({})
lspconfig.cmake.setup({})
lspconfig.clangd.setup({})
lspconfig.elixirls.setup({})
lspconfig.eslint.setup({})
lspconfig.html.setup({})
lspconfig.htmx.setup({})
lspconfig.jsonls.setup({})
lspconfig.vimls.setup({})
lspconfig.vuels.setup({})
-- lspconfig.yamlsp.setup({})
lspconfig.tailwindcss.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.pylsp.setup({})
lspconfig.nextls.setup({})

lspconfig.ts_ls.setup({
  settings = {
    tsserver = {
      autoformat = true,
    },
  },
})
