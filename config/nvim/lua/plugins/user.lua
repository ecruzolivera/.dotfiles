-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- Disabled
  { "max397574/better-escape.nvim", enabled = false },
  --
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 400,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      sign_priority = 6,
      update_debounce = 1000,
    },
  },
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "    ███████ ██████ ████████",
        "    ██      ██     ██    ██",
        "    █████   ██     ██    ██",
        "    ██      ██     ██    ██",
        "    ███████ ██████ ████████",
        " ",
        "███    ██ ██    ██ ██ ███    ███",
        "████   ██ ██    ██ ██ ████  ████",
        "██ ██  ██ ██    ██ ██ ██ ████ ██",
        "██  ██ ██  ██  ██  ██ ██  ██  ██",
        "██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

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

  -- {
  --   "mechatroner/rainbow_csv",
  --   lazy = true,
  --   ft = "csv",
  -- },
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
  -- {
  --   "tpope/vim-fugitive",
  --   event = "User AstroGitFile",
  --   cmd = "Git",
  -- },
  -- {
  --   "mbbill/undotree",
  --   event = "User AstroFile",
  -- },
  {
    "RRethy/vim-illuminate",
    event = "User AstroFile",
  },
  {
    "nvim-telescope/telescope-media-files.nvim",
    cmd = "Telescope",
  },
  -- {
  --   "andrewferrier/wrapping.nvim",
  --   ft = { "md", "markdown" },
  --   opts = {
  --     set_nvim_opt_defaults = false,
  --     -- notify_on_switch = true,
  --     softener = { markdown = true },
  --   },
  -- },
  {
    "LunarVim/bigfile.nvim",
    event = "BufReadPre",
    opts = {
      filesize = 5, -- size of the file in MiB, the plugin round file sizes to the closest MiB
      pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
      features = { -- features to disable
        "indent_blankline",
        "illuminate",
        "matchparen",
        "lsp",
      },
    },
  },
  {
    "nosduco/remote-sshfs.nvim",
    cmd = {
      "RemoteSSHFSConnect",
      "RemoteSSHFSDisconnect",
      "RemoteSSHFSEdit",
      "RemoteSSHFSFindFiles",
      "RemoteSSHFSLiveGrep",
    },
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope.nvim", opts = function() require("telescope").load_extension "remote-sshfs" end },
    },
    specs = {
      {
        "AstroNvim/astrocore",
        optional = true,
        opts = function(_, opts)
          local map = opts.mappings
          map.n["<Leader>R"] = { desc = "Remote" }
          map.n["<Leader>Rc"] = { function() require("remote-sshfs.api").connect() end, desc = "Connect" }
          map.n["<Leader>Rd"] = { function() require("remote-sshfs.api").disconnect() end, desc = "Disconnect" }
          map.n["<Leader>Re"] = { function() require("remote-sshfs.api").edit() end, desc = "Edit" }
          -- Override telescope find_files and live_grep to make dynamic based on if connected to host
          local find_files = map.n["<Leader>ff"]
          if type(find_files) == "table" then
            local orig_find_files = find_files[1]
            find_files[1] = function()
              if require("remote-sshfs.connections").is_connected() then
                require("remote-sshfs.api").find_files()
              elseif type(orig_find_files) == "function" then
                orig_find_files()
              elseif type(orig_find_files) == "string" then
                vim.cmd(orig_find_files)
              end
            end
          end
          local live_grep = map.n["<Leader>fw"]
          if type(live_grep) == "table" then
            local orig_live_grep = live_grep[1]
            live_grep[1] = function()
              if require("remote-sshfs.connections").is_connected() then
                require("remote-sshfs.api").live_grep()
              elseif type(orig_live_grep) == "function" then
                orig_live_grep()
              elseif type(orig_live_grep) == "string" then
                vim.cmd(orig_live_grep)
              end
            end
          end
        end,
      },
    },
  },
}
