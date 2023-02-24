local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

require("base46").load_highlight "treesitter"
require("nvim-treesitter.install").prefer_git = true

local option = {
  ensure_installed = {
    "lua",
    "javascript",
    "cpp",
    "c",
    "bash",
    "markdown",
    "diff",
    "cmake",
    "help",
    "llvm",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = {
    enable = true,
  },
}

treesitter.setup(option)
