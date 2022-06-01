local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
require 'lsp_signature'.setup()

require('nvim-lsp-setup').setup({
  -- Default mappings
  -- gD = 'lua vim.lsp.buf.declaration()',
  -- gd = 'lua vim.lsp.buf.definition()',
  -- gt = 'lua vim.lsp.buf.type_definition()',
  -- gi = 'lua vim.lsp.buf.implementation()',
  -- gr = 'lua vim.lsp.buf.references()',
  -- K = 'lua vim.lsp.buf.hover()',
  -- ['<C-k>'] = 'lua vim.lsp.buf.signature_help()',
  -- ['<space>rn'] = 'lua vim.lsp.buf.rename()',
  -- ['<space>ca'] = 'lua vim.lsp.buf.code_action()',
  -- ['<space>f'] = 'lua vim.lsp.buf.formatting()',
  -- ['<space>e'] = 'lua vim.lsp.diagnostic.show_line_diagnostics()',
  -- ['[d'] = 'lua vim.lsp.diagnostic.goto_prev()',
  -- [']d'] = 'lua vim.lsp.diagnostic.goto_next()',
  default_mappings = true,
  -- Custom mappings
  -- Example mappings for telescope pickers:
  -- gd = 'lua require"telescope.builtin".lsp_definitions()',
  -- gi = 'lua require"telescope.builtin".lsp_implementations()',
  -- gr = 'lua require"telescope.builtin".lsp_references()',
  mappings = {},
  -- Global on_attach
  -- on_attach = function(client, bufnr) {
  --     utils.format_on_save(client)
  -- },
  -- Global capabilities
  -- capabilities = vim.lsp.protocol.make_client_capabilities(),
  -- LSP servers
  servers = {
    -- Install LSP servers automatically
    -- LSP server configuration please see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    pyright = {},
    html = {},
    intelephense = {
      settings = {
        intelephense = {
          stubs = {
            "bcmath",
            "bz2",
            "calendar",
            "Core",
            "curl",
            "date",
            "dba",
            "dom",
            "enchant",
            "fileinfo",
            "filter",
            "ftp",
            "gd",
            "gettext",
            "hash",
            "iconv",
            "imap",
            "intl",
            "json",
            "ldap",
            "libxml",
            "mbstring",
            "mcrypt",
            "mysql",
            "mysqli",
            "password",
            "pcntl",
            "pcre",
            "PDO",
            "pdo_mysql",
            "Phar",
            "readline",
            "recode",
            "Reflection",
            "regex",
            "session",
            "SimpleXML",
            "soap",
            "sockets",
            "sodium",
            "SPL",
            "standard",
            "superglobals",
            "sysvsem",
            "sysvshm",
            "tokenizer",
            "xml",
            "xdebug",
            "xmlreader",
            "xmlwriter",
            "yaml",
            "zip",
            "zlib",
            "wordpress",
          },
          files = {
            maxSize = 5000000;
          }
        }
      }
    },
    vimls = {},
    cssls = {},
    tsserver = {},
    sumneko_lua = {
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = runtime_path,
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },

    }
  },
})
