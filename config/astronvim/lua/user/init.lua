return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "astrodark",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true,     -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    -- servers = {
    --   "qmlls",
    -- },
    --
    config = {
      ltex = {
        settings = {
          ltex = {
            -- language = "auto",
            language = "auto",
            checkFrequency = "save",
            -- languageToolHttpServerUri = "https://api.languagetoolplus.com",
            -- languageToolOrg = {
            --   username = "ecruzolivera@gmail.com",
            --   apiKey = "pit-OLzc5KT8Svvd",
            -- },
            additionalRules = {
              motherTongue = "es",
            },
            dictionary = (function()
              function dump(o)
                if type(o) == "table" then
                  local s = "{ "
                  for k, v in pairs(o) do
                    if type(k) ~= "number" then k = '"' .. k .. '"' end
                    s = s .. "[" .. k .. "] = " .. dump(v) .. ","
                  end
                  return s .. "} "
                else
                  return tostring(o)
                end
              end

              local words = {}
              local custom_dic_file = vim.fn.expand("$HOME/.config/spell.eco/en.utf-8.add")
              for word in io.open(custom_dic_file, "r"):lines() do
                table.insert(words, word)
              end
              local dics = {
                ["en"] = words,
                ["en-US"] = words,
                ["es"] = words,
                ["es-ES"] = words,
                ["es-MX"] = words,
              }
              return dics
            end)(),
          },
        },
      },
      --   qmlls = {
      --     cmd = { "qmlls6" },
      --     filetypes = { "qml", "qmljs" },
      --     -- root_dir = require("mason-lspconfig").util.root_dir ".git",
      --   },
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    vim.filetype.add({
      extension = {
        qrc = "xml",
      },
      -- filename = {
      --   ["Foofile"] = "fooscript",
      -- },
      -- pattern = {
      --   ["~/%.config/foo/.*"] = "fooscript",
      -- },
    })
    -- $XDG_CONFIG_HOME/astronvim

    -- [[ Highlight on yank ]]
    -- See `:help vim.highlight.on_yank()`
    local eco_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
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
  end,
}
