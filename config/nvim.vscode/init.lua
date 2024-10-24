vim.opt.clipboard = "unnamedplus"

vim.o.autoread = true
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "120"

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- keymaps
local vscode = require("vscode-neovim")

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Revim.keymap.set for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- clear search highlight
vim.keymap.set("n", "<leader>h", ":nohls<CR>")
-- easy colon
vim.keymap.set("n", ";", ":")
-- easy close
vim.keymap.set("n", "<leader>q", ":q<CR>")
-- easy save
vim.keymap.set("n", "<C-s>", ":w<CR><ESC>")
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

-- vscode keymaps
vim.keymap.set("n", "<leader>e", function()
  vscode.call("workbench.action.toggleSidebarVisibility")
end)

vim.keymap.set("n", "<leader>fw", function()
  vscode.call("workbench.action.findInFiles")
end)

vim.keymap.set("n", "<leader>n", function()
  vscode.call("workbench.action.files.newUntitledFile")
end)

vim.keymap.set("n", "<leader>q", function()
  vscode.call("workbench.action.closeActiveEditor")
end)

vim.keymap.set("n", "gd", function()
  vscode.action("editor.action.revealDefinition")
end)

vim.keymap.set("n", "gD", function()
  vscode.call("editor.action.goToTypeDefinition")
end)

vim.keymap.set("n", "gr", function()
  vscode.call("editor.action.goToReferences")
end)

vim.keymap.set("n", "<leader>lr", function()
  vscode.call("editor.action.rename")
end)

vim.keymap.set("n", "<leader>lf", function()
  vscode.call("editor.action.format")
end)

vim.keymap.set("n", "<leader>la", function()
  vscode.call("editor.action.quickFix")
end)

vim.keymap.set("n", "<leader>th", function()
  vscode.call("workbench.action.togglePanel")
end)

vim.keymap.set("n", "<leader>bb", function()
  vscode.call("workbench.action.showAllEditors")
end)

vim.keymap.set("n", "<leader>bc", function()
  vscode.call("workbench.action.closeOtherEditors")
end)

vim.keymap.set("n", "<leader>bv", function()
  vscode.call("workbench.action.splitEditorDown")
end)

vim.keymap.set("n", "<leader>bh", function()
  vscode.call("workbench.action.splitEditor")
end)

vim.keymap.set("n", "<C-j>", function()
  vscode.call("workbench.action.navigateDown")
end)
vim.keymap.set("n", "<C-k>", function()
  vscode.call("workbench.action.navigateUp")
end)
vim.keymap.set("n", "<C-k>", function()
  vscode.call("workbench.action.navigateUp")
end)
vim.keymap.set("n", "<C-h>", function()
  vscode.call("workbench.action.navigateLeft")
end)
vim.keymap.set("n", "<C-h>", function()
  vscode.call("workbench.action.navigateLeft")
end)
vim.keymap.set("n", "<C-l>", function()
  vscode.call("workbench.action.navigateRight")
end)
vim.keymap.set("n", "<C-l>", function()
  vscode.call("workbench.action.navigateRight")
end)
