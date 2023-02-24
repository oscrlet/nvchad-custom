local M

M = {
  defaults = {
    layout_strategy = "horizontal",
    prompt_prefix = "   ",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
        width = 0.80,
      },
      vertical = {
        prompt_position = "top",
        mirror = false,
        width = 0.64,
      },
      height = 0.80,
      preview_cutoff = 120,
    },
    path_display = function(opts, path)
      local tail = require("telescope.utils").path_tail(path)
      local smart = path -- require("telescope.utils").path_smart(path)
      local index = string.find(string.reverse(smart), "/")
      -- index = (index ~= nil and index - 1) or 0
      local dir = ": " .. ((index ~= nil and string.sub(smart, 1, string.len(smart) - index)) or ".")
      return string.format("%s %s", tail, dir)
    end,
    history = {
      path = '~/.local/share/nvim/databases/telescope_history.sqlite3',
      limit = 100,
    },
  },
  extensions_list = {
    "themes",
    "terms",
    "notify",
    "ui-select",
    "zf-native",
    "git_browse",
    "find_pickers",
    "noice",
    "projections",
  },
}

return M
