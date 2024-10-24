return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    },
  },

  {
    "mechatroner/rainbow_csv",
    lazy = true,
    ft = "csv",
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "Notes",
          path = "~/TTRPG/Notes",
        },
      },
    },
  },
  {
    "edluffy/hologram.nvim",
  },
  {
    "zhaozg/vim-diagram",
    ft = { "md", "mmd", "mermaid" },
  },
  {
    "mtdl9/vim-log-highlighting",
    ft = { "log" },
  },
  {
    "peterhoeg/vim-qml",
    ft = "qml",
  },

  {
    "aklt/plantuml-syntax",
    dependencies = {},
    ft = "plantuml",
  },
  {
    "weirongxu/plantuml-previewer.vim",
    dependencies = {
      "tyru/open-browser.vim",
    },
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
    "RRethy/vim-illuminate",
    event = "User AstroFile",
  },
  {
    "nvim-telescope/telescope-media-files.nvim",
    cmd = "Telescope",
  },
  {
    "andrewferrier/wrapping.nvim",
    ft = { "md", "markdown" },
    opts = {
      notify_on_switch = false,
      softener = { markdown = true },
    },
  },
  -- Disables plugins
  -- {
  --   "nathom/filetype.nvim",
  --   ft = { "qrc" },
  --   enable = false,
  --   lazy = false,
  --   opts = {
  --     overrides = {
  --       extensions = {
  --         qrc = "xml",
  --       },
  --     },
  --   },
  -- },
  -- {
  --   "folke/neoconf.nvim",
  --   enable = false,
  -- },

  -- {
  --   "slint-ui/vim-slint",
  --   enable = false,
  --   event = "User AstroFile",
  --   ft = { "slint", "rs" },
  -- },
}
