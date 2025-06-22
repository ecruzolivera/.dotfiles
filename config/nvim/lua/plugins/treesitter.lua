-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "astro",
      "bash",
      "c",
      "cmake",
      "cpp",
      "css",
      "dockerfile",
      "go",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "kotlin",
      "kdl",
      "lua",
      "make",
      "python",
      "qmldir",
      "qmljs",
      "rust",
      "slint",
      "tsx",
      "typescript",
      "vim",
      "xml",
      "yaml",
      -- add more arguments for adding more treesitter parsers
    })
  end,
}
