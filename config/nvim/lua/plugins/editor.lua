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
  "peterhoeg/vim-qml",
  "aklt/plantuml-syntax",
  "tyru/open-browser.vim",
  "weirongxu/plantuml-previewer.vim",
  --
  --
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    opts = { delay = 200 },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },
  {
    "m-demare/hlargs.nvim",
    event = "VeryLazy",
    opts = {
      color = "#ef9062",
      use_colorpalette = false,
      disable = function(_, bufnr)
        if vim.b.semantic_tokens then
          return true
        end
        local clients = vim.lsp.get_active_clients { bufnr = bufnr }
        for _, c in pairs(clients) do
          local caps = c.server_capabilities
          if c.name ~= "null-ls" and caps.semanticTokensProvider and caps.semanticTokensProvider.full then
            vim.b.semantic_tokens = true
            return vim.b.semantic_tokens
          end
        end
      end,
    },
  },
  -- {
  --   "akinsho/bufferline.nvim",
  --   version = "v4.0.0",
  --   dependencies = "nvim-tree/nvim-web-devicons",
  --   event = "VeryLazy",
  --   keys = {
  --     { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
  --     { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
  --   },
  --   opts = {
  --     options = {
  --       close_command = function(n)
  --         require("mini.bufremove").delete(n, false)
  --       end,
  --       right_mouse_command = function(n)
  --         require("mini.bufremove").delete(n, false)
  --       end,
  --       diagnostics = "nvim_lsp",
  --       always_show_bufferline = false,
  --       diagnostics_indicator = function(_, _, diag)
  --         local icons = require("lazyvim.config").icons.diagnostics
  --         local ret = (diag.error and icons.Error .. diag.error .. " " or "")
  --             .. (diag.warning and icons.Warn .. diag.warning or "")
  --         return vim.trim(ret)
  --       end,
  --       offsets = {
  --         {
  --           filetype = "neo-tree",
  --           text = "File Explorer",
  --           highlight = "Directory",
  --           text_align = "left",
  --         },
  --       },
  --     },
  --   },
  -- },
  -- buffer remove
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
    },
  },
}
