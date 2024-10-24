-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- Buffers
    ["<leader>bv"] = { function() vim.cmd.vsplit() end, desc = "Vertical split buffer from tabline" },
    ["<leader>bh"] = { function() vim.cmd.split() end, desc = "Horizontal split buffer from tabline" },
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
    [";"] = { ":", desc = "Easy colon" },
    -- telescope
    ["<C-p>"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" },
    ["<leader>fm"] = { function() require("telescope").extensions.media_files.media_files() end, desc = "Find Media" },
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
    -- git
    ["<leader>gs"] = { "<cmd>Git<CR>", desc = "Git Status" },
    ["<leader>gp"] = { "<cmd>Git push<CR>", desc = "Git Push" },
    ["<leader>gP"] = { "<cmd>Git pull<CR>", desc = "Git Pull" },
    ["<leader>gb"] = { "<cmd>Git blame<CR>", desc = "Git Blame" },
    ["<leader>gd"] = { "<cmd>Git diff<CR>", desc = "Git Diff" },
    ["<leader>gl"] = { "<cmd>Git log<CR>", desc = "Git Diff" },
    -- Undo tree
    ["<leader>u"] = { "<cmd>UndotreeToggle<CR>", desc = "UndotreeToggle" },
    -- lsp
    ["gd"] = { vim.lsp.buf.definition, desc = "Goto Definition" },
    ["gr"] = { require("telescope").lsp_references, desc = "Search References" },
    ["gk"] = { vim.lsp.buf.hover, desc = "Show Help" },
    ["gI"] = { vim.lsp.buf.implementation, desc = "Goto Implementation" },
    ["gD"] = { vim.lsp.buf.type_definition, desc = "Goto Definition" },
    ["<leader>lf"] = { vim.lsp.buf.format, desc = "Format" },
    ["<leader>lr"] = { vim.lsp.buf.rename, desc = "Rename" },
    ["<leader>la"] = { vim.lsp.buf.code_action, desc = "Code Action" },
    ["<leader>ld"] = { require("telescope").lsp_document_symbols, desc = "Document Symbols" },
    ["<leader>lw"] = { require("telescope").lsp_dynamic_workspace_symbols, desc = "Workspace Symbols" },
    -- Harpoon
    ["<leader>h"] = { false, desc = "Harpoon" },
    ["<leader>ha"] = { function() require("harpoon"):list():append() end, desc = "Append file" },
    ["<leader>hp"] = {
      function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,
      desc = "Quick Menu",
    },
    ["<leader>hj"] = { function() require("harpoon"):list():prev() end, desc = "Goto previous mark" },
    ["<leader>hk"] = { function() require("harpoon"):list():next() end, desc = "Goto next mark" },
    ["<leader>hm"] = { "<cmd>Telescope harpoon marks<CR>", desc = "Show marks in Telescope" },

    ["<leader>h1"] = { function() require("harpoon"):list():select(1) end, desc = "Go to file 1" },
    ["<leader>h2"] = { function() require("harpoon"):list():select(2) end, desc = "Go to file 2" },
    ["<leader>h3"] = { function() require("harpoon"):list():select(3) end, desc = "Go to file 3" },
    ["<leader>h4"] = { function() require("harpoon"):list():select(4) end, desc = "Go to file 4" },
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
}
