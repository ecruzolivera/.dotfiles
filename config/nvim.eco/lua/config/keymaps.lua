-- local vim.keymap.set = require("config.utils").map
-- Keyvim.keymap.sets for better default experience
-- See `:help vim.keymap.set()`
-- keyvim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Revim.keymap.set for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
vim.keymap.set("n", "<leader>h", ":nohls<CR>")
-- easy colon
vim.keymap.set("n", ";", ":")
-- easy close
vim.keymap.set("n", "<leader>q", ":q<CR>")
-- easy save
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<ESC>:w<CR>")

-- highlight move
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
-- remove the break line
vim.keymap.set("n", "J", "mzJ`z")
-- keep the cursor centered when page down/up
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- keep the cursor centered when searching next/prev
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

if not vim.g.vscode then
  -- sane paste, will keep the copy value instead of replace it with the deleted one
  vim.keymap.set("x", "p", [["_dP]])
  -- sane delete, will keep the copy value instead of replace it with the deleted one
  -- vim.keymap.set({ "n", "v" }, "d", [["_d]])
  -- search outside vim
  vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

  -- Telecope
  local telescope = require("telescope.builtin")
  vim.keymap.set("n", "<C-p>", telescope.find_files, { desc = "Search Files" })
  vim.keymap.set("i", "<C-p>", telescope.find_files, { desc = "Search Files" })
  vim.keymap.set("n", "<leader>fw", telescope.live_grep, { desc = "Live Grep" })
  vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Search Buffers" })
  vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Search Vim Help" })
  vim.keymap.set("n", "<leader>fd", telescope.diagnostics, { desc = "Search Diagnostics" })

  -- LSP
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
  vim.keymap.set("n", "gr", telescope.lsp_references, { desc = "Search References" })
  vim.keymap.set("n", "gk", vim.lsp.buf.hover)
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
  vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, { desc = "Goto Definition" })

  vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format" })
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
  vim.keymap.set("n", "<leader>ld", telescope.lsp_document_symbols, { desc = "Document Symbols" })
  vim.keymap.set("n", "<leader>lw", telescope.lsp_dynamic_workspace_symbols, { desc = "Workspace Symbols" })

  -- git
  vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git Status" })
  vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git Push" })
  vim.keymap.set("n", "<leader>gP", ":Git pull<CR>", { desc = "Git Pull" })
  vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git Blame" })
  vim.keymap.set("n", "<leader>gd", ":Git diff<CR>", { desc = "Git Diff" })
  vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { desc = "Git Diff" })
  -- Undo tree
  vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "UndotreeToggle" })

  --dap
  --
  vim.keymap.set("v", "<leader>de", "<cmd>lua require'dapui'.eval()<cr>", { desc = "Evaluate" })

  vim.keymap.set("n", "<leader>dR", "<cmd>lua require'dap'.run_to_cursor()<cr>", { desc = "Run to Cursor" })
  vim.keymap.set(
    "n",
    "<leader>dE",
    "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>",
    { desc = "Evaluate Input" }
  )
  vim.keymap.set(
    "n",
    "<leader>dC",
    "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
    { desc = "Conditional Breakpoint" }
  )
  vim.keymap.set("n", "<leader>dU", "<cmd>lua require'dapui'.toggle()<cr>", { desc = "Toggle UI" })
  vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", { desc = "Step Back" })
  vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Continue" })
  vim.keymap.set("n", "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", { desc = "Disconnect" })
  vim.keymap.set("n", "<leader>de", "<cmd>lua require'dapui'.eval()<cr>", { desc = "Evaluate" })
  vim.keymap.set("n", "<leader>dg", "<cmd>lua require'dap'.session()<cr>", { desc = "Get Session" })
  vim.keymap.set("n", "<leader>dh", "<cmd>lua require'dap.ui.widgets'.hover()<cr>", { desc = "Hover Variables" })
  vim.keymap.set("n", "<leader>dS", "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", { desc = "Scopes" })
  vim.keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step Into" })
  vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step Over" })
  vim.keymap.set("n", "<leader>dp", "<cmd>lua require'dap'.pause.toggle()<cr>", { desc = "Pause" })
  vim.keymap.set("n", "<leader>dq", "<cmd>lua require'dap'.close()<cr>", { desc = "Quit" })
  vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Toggle Repl" })
  vim.keymap.set("n", "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", { desc = "Start" })
  vim.keymap.set("n", "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
  vim.keymap.set("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", { desc = "Terminate" })
  vim.keymap.set("n", "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step Out" })

  --
  -- vim.keymap.set("v","<leader>d-",  {desc=`:help K` for why this keyvim.keymap.se)
  -- vim.keymap.set('K', vim.lsp.buf.hover, 'Hover Documentation')
  -- vim.keymap.set('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  --
  -- -- Lesser used LSP functionality
  -- vim.keymap.set('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  -- vim.keymap.set('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  -- vim.keymap.set('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  -- vim.keymap.set('<leader>wl', function()
  -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, '[W]orkspace [L]ist Folders')
  --
  --
  --
end
