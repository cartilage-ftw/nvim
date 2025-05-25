return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        render_modes = true
    },
}

-- For `plugins/markview.lua` users.
--return {
 --   "OXY2DEV/markview.nvim",
   --- lazy = false,

    -- For blink.cmp's completion
    -- source
    ---dependencies = {
      --   "saghen/blink.cmp"
    -- },
--- };
