-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      autoformat      = true, -- enable or disable auto formatting on start
      codelens        = true, -- enable/disable codelens refresh on start
      inlay_hints     = false, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled          = true, -- enable or disable format on save globally
        allow_filetypes  = {},   -- enable format on save for specified filetypes only
        ignore_filetypes = {},   -- disable format on save for specified filetypes
      },
      disabled   = {},  -- disable formatting capabilities for the listed language servers
      timeout_ms = 1000, -- default format timeout
    },
        -- customize how language servers are attached
    handlers = {
      pyright= false,
          -- mount your basedpyright exactly as given
    basedpyright = function(_, opts)
      require("lspconfig").basedpyright.setup(opts)
    end,
    },
    -- enable servers that you already have installed without mason
    servers = {
        -- "basedpyright" 
    },
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      clangd = {
        on_attach = function(_, bufnr)
          require("clangd_extensions.inlay_hints").setup_autocmd()
          require("clangd_extensions.inlay_hints").set_inlay_hints()
        end,
        capabilities = { offsetEncoding = "utf-8" },
      },
      lua_ls = { settings = { Lua = { hint = { enable = true, arrayIndex = "Disable" } } } },
      basedpyright = {
        before_init = function(_, c)
          if not c.settings then c.settings = {} end
          if not c.settings.python then c.settings.python = {} end
          c.settings.python.pythonPath = vim.fn.exepath("python")
        end,
        settings = {
          python = {
            pythonPath = vim.fn.exepath("python"),
            analysis = {
              useLibraryCodeForTypes    = true,
              --- reportMissingTypeStubs    = false,
              diagnosticMode            = "workspace",
              typeCheckingMode          = "basic",
              autoImportCompletions     = true,
              stubPath                  = vim.fn.expand("~") .. "/typings",
              diagnosticSeverityOverrides = {
                reportMissingTypeStubs = "none",
                reportUnusedImport        = "none",
                reportUnusedFunction      = "information",
                reportUnusedVariable      = "information",
                reportGeneralTypeIssues   = "none",
                reportOptionalMemberAccess= "none",
                reportOptionalSubscript   = "none",
                reportPrivateImportUsage  = "none",
              },
            },
          },
        },
      },
      vtsls = {
        settings = {
          typescript = {
            inlayHints = {
              parameterNames             = { enabled = "all", suppressWhenArgumentMatchesName = false },
              parameterTypes             = { enabled = true },
              variableTypes              = { enabled = true, suppressWhenTypeMatchesName = false },
              propertyDeclarationTypes   = { enabled = true },
              functionLikeReturnTypes    = { enabled = true },
              enumMemberValues           = { enabled = true },
            },
            updateImportsOnFileMove = { enabled = "always" },
          },
          javascript = {
            inlayHints = {
              parameterNames             = { enabled = "all", suppressWhenArgumentMatchesName = false },
              parameterTypes             = { enabled = true },
              variableTypes              = { enabled = true, suppressWhenTypeMatchesName = false },
              propertyDeclarationTypes   = { enabled = true },
              functionLikeReturnTypes    = { enabled = true },
              enumMemberValues           = { enabled = true },
            },
            updateImportsOnFileMove = { enabled = "always" },
          },
        },
      },
    },

    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      lsp_document_highlight = {
        cond = "textDocument/documentHighlight",
        {
          event    = { "CursorHold", "CursorHoldI" },
          desc     = "Document Highlighting",
          callback = function() vim.lsp.buf.document_highlight() end,
        },
        {
          event    = { "CursorMoved", "CursorMovedI", "BufLeave" },
          desc     = "Document Highlighting Clear",
          callback = function() vim.lsp.buf.clear_references() end,
        },
      },
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
      },
    },
    -- A custom `on_attach` function to be run after the default `on_attach` function
    on_attach = function(client, bufnr)
      -- client.server_capabilities.semanticTokensProvider = nil
    end,
  },
}

