-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    qrc = "xml",
  },
  -- filename = {
  --   ["Foofile"] = "fooscript",
  -- },
  -- pattern = {
  --   ["~/%.config/foo/.*"] = "fooscript",
  -- },
}

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local eco_group = vim.api.nvim_create_augroup("EcoGroup", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank() end,
  group = eco_group,
  pattern = "*",
})

-- See `:help conceallevel
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    local ft = vim.bo.filetype
    -- print("ft", ft)
    if ft == "markdown" then
      vim.opt.conceallevel = 1
    else
      vim.opt.conceallevel = 0
    end
  end,
  group = eco_group,
  pattern = { "*" },
})

-- vim.api.nvim_create_user_command("CopyRePath", function()
--   local path = vim.fn.expand "%:p"
--   vim.fn.setreg("+", path)
--   vim.notify('Copied "' .. path .. '" to the clipboard!')
-- end, {})
-- -- auto-reload files when modified externally
-- -- https://unix.stackexchange.com/a/383044
-- vim.o.autoread = true
-- vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
--   command = "if mode() != 'c' | checktime | endif",
--   pattern = { "*" },
-- })
