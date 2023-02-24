local fn = vim.fn
local config = require("core.utils").load_config().ui.statusline
local sep_style = config.separator_style

local default_sep_icons = {
  default = { left = "", right = "" },
  round = { left = "", right = "" },
  block = { left = "█", right = "█" },
  arrow = { left = "", right = "" },
}

local separators = (type(sep_style) == "table" and sep_style) or default_sep_icons[sep_style]

local sep_l = separators["left"]
local sep_r = separators["right"]

local M = {}

M.modes = {
  ["n"] = { "NORMAL", "St_NormalMode" },
  ["niI"] = { "NORMAL i", "St_NormalMode" },
  ["niR"] = { "NORMAL r", "St_NormalMode" },
  ["niV"] = { "NORMAL v", "St_NormalMode" },
  ["no"] = { "N-PENDING", "St_NormalMode" },
  ["i"] = { "INSERT", "St_InsertMode" },
  ["ic"] = { "INSERT (completion)", "St_InsertMode" },
  ["ix"] = { "INSERT completion", "St_InsertMode" },
  ["t"] = { "TERMINAL", "St_TerminalMode" },
  ["nt"] = { "NTERMINAL", "St_NTerminalMode" },
  ["v"] = { "VISUAL", "St_VisualMode" },
  ["V"] = { "V-LINE", "St_VisualMode" },
  ["Vs"] = { "V-LINE (Ctrl O)", "St_VisualMode" },
  [""] = { "V-BLOCK", "St_VisualMode" },
  ["R"] = { "REPLACE", "St_ReplaceMode" },
  ["Rv"] = { "V-REPLACE", "St_ReplaceMode" },
  ["s"] = { "SELECT", "St_SelectMode" },
  ["S"] = { "S-LINE", "St_SelectMode" },
  [""] = { "S-BLOCK", "St_SelectMode" },
  ["c"] = { "COMMAND", "St_CommandMode" },
  ["cv"] = { "COMMAND", "St_CommandMode" },
  ["ce"] = { "COMMAND", "St_CommandMode" },
  ["r"] = { "PROMPT", "St_ConfirmMode" },
  ["rm"] = { "MORE", "St_ConfirmMode" },
  ["r?"] = { "CONFIRM", "St_ConfirmMode" },
  ["x"] = { "CONFIRM", "St_ConfirmMode" },
  ["!"] = { "SHELL", "St_TerminalMode" },
}

M.mode = function()
  local m = vim.api.nvim_get_mode().mode
  local current_mode = "%#" .. M.modes[m][2] .. "#" .. " " .. M.modes[m][1]
  local mode_sep1 = "%#" .. M.modes[m][2] .. "Sep" .. "#" .. sep_r

  return current_mode .. " " .. mode_sep1 .. "%#ST_EmptySpace#" .. sep_r
end

-- LSP STUFF
M.LSP_progress = function()
  return ""
end
M.LSP_Diagnostics = function()
  if not rawget(vim, "lsp") then
    return ""
  end

  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

  local errors_string = (errors and errors > 0) and ("%#St_lspError#" .. "  " .. errors .. " ") or ""
  local warnings_string = (warnings and warnings > 0) and ("%#St_lspWarning#" .. "  " .. warnings .. " ") or ""
  local hints_string = (hints and hints > 0) and ("%#St_lspHints#" .. "  " .. hints .. " ") or ""
  local info_string = (info and info > 0) and ("%#St_lspInfo#" .. "  " .. info .. " ") or ""

    return errors_string .. warnings_string .. hints_string .. info_string
end

M.LSP_status = function()
  if rawget(vim, "lsp") then
    for _, client in ipairs(vim.lsp.get_active_clients()) do
      if client.attached_buffers[vim.api.nvim_get_current_buf()] then
        return (vim.o.columns > 100 and "%#St_LspStatus#" .. "  " .. client.name .. " ") or "  LSP "
      end
    end
  end
end

M.cwd = function()
  local dir_icon = "%#St_cwd_icon#" .. " "
  local dir_name = "%#St_cwd_text#" .. " " .. fn.fnamemodify(fn.getcwd(), ":t") .. " "
  return (vim.o.columns > 85 and ("%#St_cwd_sep#" .. sep_l .. dir_icon .. dir_name)) or ""
end

M.cursor_position = function()
  local left_sep = "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon#" .. " "

  local current_line = fn.line "."
  local total_line = fn.line "$"
  local text = math.modf((current_line / total_line) * 100) .. tostring "%%"

  text = (current_line == 1 and "Top") or text
  text = (current_line == total_line and "Bot") or text

  return left_sep .. "%#St_pos_text#" .. " " .. text .. " "
end

return M
