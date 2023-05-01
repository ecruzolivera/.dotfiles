return {
  {
    -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = "┊",
      show_trailing_blankline_indent = false,
    },
  },
  -- "gc" to comment visual regions/lines
  "tpope/vim-commentary",
  --undotree
  "mbbill/undotree",
  "tommcdo/vim-exchange",
  "tpope/vim-surround",
  { "mg979/vim-visual-multi", tag = "v0.5.8" },
  -- syntax highlight
  "mtdl9/vim-log-highlighting",
  "RRethy/vim-illuminate",
  "peterhoeg/vim-qml",
  "aklt/plantuml-syntax",
  "tyru/open-browser.vim",
  "weirongxu/plantuml-previewer.vim",
}
