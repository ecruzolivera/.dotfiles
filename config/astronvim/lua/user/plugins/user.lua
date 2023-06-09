return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  {
    "mtdl9/vim-log-highlighting",
    ft = "log",
  },
  {
    "peterhoeg/vim-qml",
    ft = "qml",
  },
  {
    "aklt/plantuml-syntax",
    ft = "plantuml",
  },
  {
    "mg979/vim-visual-multi",
    event = "User AstroFile",
  },
  {
    "tpope/vim-fugitive",
    event = "User AstroGitFile",
    cmd = "Git",
  },
  {
    "mbbill/undotree",
    event = "User AstroFile",
  },
  {
    "nathom/filetype.nvim",
    ft = { "qrc" },
    lazy = false,
    opts = {
      overrides = {
        extensions = {
          qrc = "xml",
        },
      },
    },
  },
  {
    "slint-ui/vim-slint",
    event = "User AstroFile",
    ft = { "slint", "rs" },
  },
}
