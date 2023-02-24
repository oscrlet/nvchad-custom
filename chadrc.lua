---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  -- theme_toggle = { "onedark", "one_light" },
  theme = "everforest",
  hl_override = highlights.override,
  hl_add = highlights.add,

  -- cmp themeing
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "one_bg", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },

  statusline = {
    theme = "default",
    separator_style = "default", -- default/round/block/arrow
    overriden_modules = function()
      return require("custom.configs.statusline")
    end,
  },
  -- lazyload it when there are 1+ buffers
  tabufline = {
    enabled = true,
    lazyload = true,
    overriden_modules = function()
      return require("custom.configs.tabufline")
    end,
  },

  nvdash = {
    load_on_startup = true,

    header = {
      "                                ",
      "        ███     ███         ",
      "       ███   ███        ",
      "      █████ █████       ",
      "     ███ █████ ███      ",
      "    ███   ███   ███     ",
      "   ███     ███     ███    ",
      "   ██      ██       ██    ",
      "                          ",
      "                                ",
    },

    buttons = {
      { "  Open project", "Spc Tab", "Telescope projections" },
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc b m", "Telescope marks" },
      { "  Themes", "Spc t f", "Telescope themes" },
    },
  },

  transparency = false,
}
M.plugins = require "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
