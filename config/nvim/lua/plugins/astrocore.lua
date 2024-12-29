-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        spellfile = vim.fn.expand "$HOME/.config/spell.eco/en.utf-8.add",
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        clipboard = "unnamedplus",
        nu = true,
        autoread = true,
        tabstop = 4,
        softtabstop = 4,
        shiftwidth = 4,
        expandtab = true,
        smartindent = true,
        swapfile = false,
        backup = false,
        undodir = "/tmp/undodir",
        -- undofile = true,
        incsearch = true,
        termguicolors = true,
        scrolloff = 8,
        colorcolumn = "120",
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map
        -- mappings seen under group name "Buffer"
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        --
        -- Buffers
        ["<Leader>b"] = { desc = "Buffers" },
        -- navigate buffer tabs with `H` and `L`
        L = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        H = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        ["<leader>bv"] = { vim.cmd.vsplit, desc = "Vertical split buffer from tabline" },
        ["<leader>bh"] = { vim.cmd.split, desc = "Horizontal split buffer from tabline" },
        -- quick save
        ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
        [";"] = { ":", desc = "Easy colon" },
        ["<leader>q"] = {
          function() require("astrocore.buffer").close() end,
        },
        -- telescope
        ["<C-p>"] = {
          function() require("telescope.builtin").find_files() end,
          desc = "Find files",
        },
        ["<leader>fi"] = {
          "<cmd>Telescope media_files<CR>",
          desc = "Find Media",
        },
        -- highlight move
        ["<A-j>"] = { "<cmd>m .+1<cr>==", desc = "Move down" },
        ["<A-k>"] = { "<cmd>m .-2<cr>==", desc = "Move up" },
        -- remove the break line
        -- ["J"] = { "zJ`z" },
        -- keep the cursor centered when page down/up
        -- ["<C-d>"] = { "<-d>zz" },
        -- ["<C-u>"] = { "<-u>zz" },
        -- keep the cursor centered when searching next/prev
        -- ["n"] = { "zzzv" },
        -- ["N"] = { "zzzv" },
        --
        -- git
        ["<leader>gs"] = { "<cmd>Git<CR>", desc = "Git Status" },
        ["<leader>gp"] = { "<cmd>Git push<CR>", desc = "Git Push" },
        ["<leader>gP"] = { "<cmd>Git pull<CR>", desc = "Git Pull" },
        ["<leader>gb"] = { "<cmd>Git blame<CR>", desc = "Git Blame" },
        ["<leader>gd"] = { "<cmd>Git diff<CR>", desc = "Git Diff" },
        ["<leader>gl"] = { "<cmd>Git log<CR>", desc = "Git Diff" }, -- Undo tree
        ["<leader>u"] = { "<cmd>UndotreeToggle<CR>", desc = "UndotreeToggle" },
        -- lsp
        ["gd"] = { vim.lsp.buf.definition, desc = "Goto Definition" },
        ["gr"] = { require("telescope.builtin").lsp_references, desc = "Search References" },
        ["gk"] = { vim.lsp.buf.hover, desc = "Show Help" },
        ["gI"] = { vim.lsp.buf.implementation, desc = "Goto Implementation" },
        ["gD"] = { vim.lsp.buf.type_definition, desc = "Goto Definition" },
        ["<leader>lf"] = { vim.lsp.buf.format, desc = "Format" },
        ["<leader>lr"] = { vim.lsp.buf.rename, desc = "Rename" },
        ["<leader>la"] = { vim.lsp.buf.code_action, desc = "Code Action" },
        ["<leader>ld"] = { require("telescope").lsp_document_symbols, desc = "Document Symbols" },
        ["<leader>lw"] = { require("telescope").lsp_dynamic_workspace_symbols, desc = "Workspace Symbols" },
        -- Harpoon
        ["<leader>h"] = { "", desc = "Harpoon" },
        ["<leader>ha"] = {
          function() require("harpoon"):list():append() end,
          desc = "Append file",
        },
        ["<leader>hp"] = {
          function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,
          desc = "Quick Menu",
        },
        ["<leader>hj"] = {
          function() require("harpoon"):list():prev() end,
          desc = "Goto previous mark",
        },
        ["<leader>hk"] = {
          function() require("harpoon"):list():next() end,
          desc = "Goto next mark",
        },
        ["<leader>hm"] = { "<cmd>Telescope harpoon marks<CR>", desc = "Show marks in Telescope" },

        ["<leader>h1"] = {
          function() require("harpoon"):list():select(1) end,
          desc = "Go to file 1",
        },
        ["<leader>h2"] = {
          function() require("harpoon"):list():select(2) end,
          desc = "Go to file 2",
        },
        ["<leader>h3"] = {
          function() require("harpoon"):list():select(3) end,
          desc = "Go to file 3",
        },
        ["<leader>h4"] = {
          function() require("harpoon"):list():select(4) end,
          desc = "Go to file 4",
        },
      },
      i = {
        ["<C-s>"] = { "<ESC>:w!<cr>", desc = "Save File" },
        -- ["<C-p>"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" },
        ["<A-j>"] = { "<esc><cmd>m .+1<cr>==gi", desc = "Move down" },
        ["<A-k>"] = { "<esc><cmd>m .-2<cr>==gi", desc = "Move up" },
      },
      v = {
        ["<A-j>"] = { ":m '>+1<cr>gv=gv", desc = "Move down" },
        ["<A-k>"] = { ":m '<-2<cr>gv=gv", desc = "Move up" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
