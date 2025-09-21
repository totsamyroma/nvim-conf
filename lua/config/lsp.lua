-- NOTE: to make any of this work you need a language server.
-- If you don't know what that is, watch this 5 min video:
-- https://www.youtube.com/watch?v=LaS32vctfOY

-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

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

vim.lsp.enable('lua_ls', {})

-- lsp for ruby with formatting and autoindentaion
vim.lsp.config(
  'rubocop',
  {
    cmd_env = { BUNDLE_GEMFILE = '.ruby-lsp/Gemfile' },
    cmd = { 'sh', '-c', 'bundle install > /dev/null; bundle exec rubocop --lsp' },
    settings = {
      ruby = {
        format = { enabled = true },
        lsp = { autoformat = true },
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
  }
)
vim.lsp.enable('rubocop', {})

vim.lsp.config(
  'ruby_lsp',
  {
    cmd_env = { BUNDLE_GEMFILE = '.ruby-lsp/Gemfile', },
    cmd = { 'sh', '-c', 'bundle install > /dev/null; bundle exec ruby-lsp' },
    init_options = {
      enabledFeatures = {
        codeActions = true,
        codeLens = true,
        completion = true,
        definition = true,
        diagnostics = true,
        documentHighlights = true,
        documentLink = true,
        documentSymbols = true,
        foldingRanges = true,
        formatting = false,
        hover = true,
        inlayHint = true,
        onTypeFormatting = true,
        selectionRanges = true,
        semanticHighlighting = true,
        signatureHelp = true,
        typeHierarchy = true,
        workspaceSymbol = true
      },
      featuresConfiguration = {
        inlayHint = {
          implicitHashValue = true,
          implicitRescue = true
        }
      },
      experimentalFeaturesEnabled = false,
      linters = { "" },
      formatters = { "" },
    }
  }
)
vim.lsp.enable('ruby_lsp', {})

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

vim.lsp.enable('bashls', {})
vim.lsp.enable('cmake', {})
vim.lsp.enable('clangd', {})
vim.lsp.enable('elixirls', {})
vim.lsp.enable('eslint', {})
vim.lsp.enable('gopls', {})
vim.lsp.enable('html', {})
vim.lsp.enable('htmx', {})
vim.lsp.enable('jsonls', {})
vim.lsp.enable('nextls', {})
vim.lsp.enable('pylsp', {})
vim.lsp.enable('rust_analyzer', {})
vim.lsp.enable('tailwindcss', {})
vim.lsp.enable('ts_ls', {
  settings = {
    tsserver = {
      autoformat = true,
    },
  },
})
vim.lsp.enable('vimls', {})
vim.lsp.enable('vuels', {})
vim.lsp.enable('yamlls', {})
