local function merge(t1, t2)
  for k, v in pairs(t2) do
    if (type(v) == "table") and (type(t1[k] or false) == "table") then
      merge(t1[k], t2[k])
    else
      t1[k] = v
    end
  end
  return t1
end

local null_ls = require("null-ls")

-- code action sources
local code_actions = null_ls.builtins.code_actions
local actions = {
  code_actions.gomodifytags,
  code_actions.cspell,
}
-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics
local diags = {
  diagnostics.checkmake,
  diagnostics.cspell,
}

-- formatting sources
local formatting = null_ls.builtins.formatting
local formatters = {
  formatting.clang_format,
  formatting.cmake_format,
  formatting.gofmt,
  formatting.goimports,
  formatting.jq,
  formatting.prettier.with({
    extra_filetypes = { "toml" },
  }),
  formatting.rustfmt,
  formatting.shfmt,
  formatting.stylua,
}

-- hover sources
local hover = null_ls.builtins.hover
local hovs = {}
-- completion sources
local completion = null_ls.builtins.completion
local comps = {}

local sources = merge(actions, diags)
sources = merge(sources, formatters)
sources = merge(sources, hovs)
sources = merge(sources, comps)

null_ls.setup({
  sources = sources,
})
