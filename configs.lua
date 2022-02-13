local M = {}

-- overriding default plugin configs!
M.treesitter = {
  ensure_installed = {
    "lua",
    "vim",
    "html",
    "css",
    "javascript",
    "json",
    "toml",
    "markdown",
    "c",
    "cpp",
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },
}

M.dashboard = "custom.plugins.dashboard"

M.telescope = {
  setup = function ()
    local extensions = { "fzf", "project" }
    pcall (
      function ()
        for _, ext in ipairs(extensions) do
          require('telescope').load_extension(ext)
        end
      end
    )
  end
}

return M
