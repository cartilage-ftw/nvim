-- Lazy
return {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
  config = function()
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        -- Atom One Dark colors
        local atom_colors = {
          fg = "#abb2bf",
          bg = "#282c34", --- this still isn't feeling like VS Code version of the theme; maybe it's the font and terminal
          red = "#e06c75",
          green = "#98c379",
          yellow = "#e5c07b",
          blue = "#61afef",
          purple = "#c678dd",
          cyan = "#56b6c2",
          orange = "#d19a66",
        }

        vim.api.nvim_set_hl(0, "Normal", { bg = atom_colors.bg, fg = atom_colors.fg })
        vim.api.nvim_set_hl(0, "@variable", { fg = atom_colors.fg })
        vim.api.nvim_set_hl(0, "@field", { fg = atom_colors.fg })
        vim.api.nvim_set_hl(0, "@property", { fg = atom_colors.fg })
        vim.api.nvim_set_hl(0, "@parameter", { fg = atom_colors.fg })
        vim.api.nvim_set_hl(0, "@variable.parameter", { fg = atom_colors.orange })
        vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = atom_colors.fg })
        vim.api.nvim_set_hl(0, "@function", { fg = atom_colors.blue })
        vim.api.nvim_set_hl(0, "@method", { fg = atom_colors.blue })
        vim.api.nvim_set_hl(0, "@keyword", { fg = atom_colors.purple })
        vim.api.nvim_set_hl(0, "@number", { fg = atom_colors.yellow })
        vim.api.nvim_set_hl(0, "@constant", { fg = atom_colors.orange })
        vim.api.nvim_set_hl(0, "@type", { fg = atom_colors.purple })
        vim.api.nvim_set_hl(0, "Identifier", { fg = atom_colors.fg })
        vim.api.nvim_set_hl(0, "Type", { fg = atom_colors.purple })
        vim.api.nvim_set_hl(0, "String", { fg = atom_colors.green })
        vim.api.nvim_set_hl(0, "Function", { fg = atom_colors.blue })
        vim.api.nvim_set_hl(0, "@function.builtin", { fg=atom_colors.blue})
        vim.api.nvim_set_hl(0, "@number", { fg=atom_colors.orange})
        vim.api.nvim_set_hl(0, "@punctuation.bracket.python", { fg = atom_colors.yellow})
        vim.api.nvim_set_hl(0, "@odp.punctuation.bracket.python", { fg = atom_colors.yellow})
        
        vim.api.nvim_set_hl(0, "TodoFgTODO", { fg = "#e5c07b", bold = true })
        vim.api.nvim_set_hl(0, "TodoFgNOTE", { fg = "#d19a66", bold = true })
        vim.api.nvim_set_hl(0, "TodoFgFIX",  { fg = "#e06c75", bold = true })
        vim.api.nvim_set_hl(0, "TodoFgHACK", { fg = "#c678dd", bold = true })


        vim.api.nvim_set_hl(0, "TodoBgTODO", { fg = "#e5c07b", bold = true })
        vim.api.nvim_set_hl(0, "TodoBgNOTE", { fg = "#d19a66", bold = true })
        vim.api.nvim_set_hl(0, "TodoBgFIX",  { fg = "#e06c75", bold = true })
        vim.api.nvim_set_hl(0, "TodoBgHACK", { fg = "#c678dd", bold = true })
      end,
    })
  end,
}
