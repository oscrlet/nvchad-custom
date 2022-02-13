-- This is an example chadrc file , its supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "palenight",
  hl_override = "custom.plugins.highlights",
}

-- plugins config
local plugins = require "custom.plugins" -- path to table
local plugin_conf = require "custom.plugins.configs" -- path to table

M.plugins = {
  install = plugins,

  status = {
    colorizer = true,
    dashboard = true,
    snippets = true,
  },

  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },

  default_plugin_config_replace = {
    nvim_treesitter = plugin_conf.treesitter,
    nvim_tree = plugin_conf.nvimtree,
    dashboard = plugin_conf.dashboard,
    telescope = plugin_conf.telescope,
  },
}

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event','cmd' fields)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough

return M
