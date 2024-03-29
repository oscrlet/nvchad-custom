local api = vim.api
local devicons_present, devicons = pcall(require, "nvim-web-devicons")
local fn = vim.fn

local function new_hl(group1, group2)
  local fg = fn.synIDattr(fn.synIDtrans(fn.hlID(group1)), "fg#")
  local bg = fn.synIDattr(fn.synIDtrans(fn.hlID(group2)), "bg#")
  api.nvim_set_hl(0, "Tbline" .. group1 .. group2, { fg = fg, bg = bg })
  return "%#" .. "Tbline" .. group1 .. group2 .. "#"
end

local function getNvimTreeWidth()
  for _, win in pairs(api.nvim_tabpage_list_wins(0)) do
    if vim.bo[api.nvim_win_get_buf(win)].ft == "NvimTree" then
      return api.nvim_win_get_width(win) + 1
    end
  end
  return 0
end

local function getBtnsWidth() -- close, theme toggle btn etc
  local width = 6
  if fn.tabpagenr "$" ~= 1 then
    width = width + ((3 * fn.tabpagenr "$") + 2) + 10
    width = not vim.g.TbTabsToggled and 8 or width
  end
  return width
end
local function add_fileInfo(name, bufnr)
  if devicons_present then
    local icon, icon_hl = devicons.get_icon(name, string.match(name, "%a+$"))

    if not icon then
      icon, icon_hl = devicons.get_icon "default_icon"
    end

    -- padding around bufname; 24 = bufame length (icon + filename)
    local buffer_on = api.nvim_get_current_buf() == bufnr

    icon = (
      buffer_on and new_hl(icon_hl, "TbLineBufOn") .. " " .. icon
      or new_hl(icon_hl, "TbLineBufOff") .. " " .. icon
    )

    -- check for same buffer names under different dirs
    for _, value in ipairs(vim.t.bufs) do
      if api.nvim_buf_is_valid(value) then
        if name == fn.fnamemodify(api.nvim_buf_get_name(value), ":t") and value ~= bufnr then
          local other = {}
          for match in (api.nvim_buf_get_name(value) .. "/"):gmatch("(.-)" .. "/") do
            table.insert(other, match)
          end

          local current = {}
          for match in (api.nvim_buf_get_name(bufnr) .. "/"):gmatch("(.-)" .. "/") do
            table.insert(current, match)
          end

          name = current[#current]

          for i = #current - 1, 1, -1 do
            local value_current = current[i]
            local other_current = other[i]

            if value_current ~= other_current then
              name = value_current .. "/../" .. name
              break
            end
          end
          break
        end
      end
    end

    name = (#name > 18 and string.sub(name, 1, 16) .. "..") or name
    local padding = 18 - #name
    name = (buffer_on and "%#TbLineBufOn# " .. name) or ("%#TbLineBufOff# " .. name)
    local left_padding = (buffer_on and "%#TabufLinePaddingOn#" .. "") or ("%#TabufLinePaddingOff#" .. "")

    return left_padding .. icon .. " " .. name .. string.rep(" ", padding)
  end
end
local function styleBufferTab(nr)
  local close_btn = "%" .. nr .. "@TbKillBuf@  %X"
  local name = (#api.nvim_buf_get_name(nr) ~= 0) and fn.fnamemodify(api.nvim_buf_get_name(nr), ":t") or " No Name "
  name = "%" .. nr .. "@TbGoToBuf@" .. add_fileInfo(name, nr) .. "%X"

  -- color close btn for focused / hidden  buffers
  if nr == api.nvim_get_current_buf() then
    close_btn = (vim.bo[0].modified and "%" .. nr .. "@TbKillBuf@%#TbLineBufOnModified#  ")
      or ("%#TbLineBufOnClose#" .. close_btn)
    name = "%#TbLineBufOn#" .. name .. close_btn .. "%#TabufLinePaddingOn#" .. ""
  else
    close_btn = (vim.bo[nr].modified and "%" .. nr .. "@TbKillBuf@%#TbBufLineBufOffModified#  ")
      or ("%#TbLineBufOffClose#" .. close_btn)
    name = "%#TbLineBufOff#" .. name .. close_btn .. "%#TabufLinePaddingOff#" .. ""
  end

  return name
end
return {
  bufferlist = function()
    local buffers = {} -- buffersults
    local available_space = vim.o.columns - getNvimTreeWidth() - getBtnsWidth()
    local current_buf = api.nvim_get_current_buf()
    local has_current = false -- have we seen current buffer yet?

    -- show buffer index numbers
    if vim.g.tbufpick_showNums then
      for index, value in ipairs(vim.g.visibuffers) do
        local name = value:gsub("", "<" .. index .. "> ")
        table.insert(buffers, name)
      end
      return table.concat(buffers) .. "%#TblineFill#" .. "%=" -- buffers + empty space
    end

    vim.g.bufirst = 0
    for _, bufnr in ipairs(vim.t.bufs) do
      if api.nvim_buf_is_valid(bufnr) then
        if ((#buffers + 1) * 27) > available_space then
          if has_current then
            break
          end

          vim.g.bufirst = vim.g.bufirst + 1
          table.remove(buffers, 1)
        end

        has_current = (bufnr == current_buf and true) or has_current
        table.insert(buffers, styleBufferTab(bufnr))
      end
    end

    vim.g.visibuffers = buffers
    return table.concat(buffers) .. "%#TblineFill#" .. "%=" -- buffers + empty space
  end,

  tablist = function()
    local result, number_of_tabs = "", fn.tabpagenr "$"

    if number_of_tabs > 1 then
      for i = 1, number_of_tabs, 1 do
        local tab_hl = ((i == fn.tabpagenr()) and "%#TbLineTabOn# ") or "%#TbLineTabOff# "
        result = result .. ("%" .. i .. "@TbGotoTab@" .. tab_hl .. i .. " ")
      end

      local new_tabtn = "%#TblineTabNewBtn#" .. "%@TbNewTab@ +%X"
      local tabstoggleBtn = "%@TbToggleTabs@ %#TBTabTitle# TABS %X"

      return vim.g.TbTabsToggled == 1 and tabstoggleBtn:gsub("()", { [36] = "<< " })
        or new_tabtn .. tabstoggleBtn .. result
    end
  end,

  buttons = function()
    local CloseAllBufsBtn = "%@TbCloseAllBufs@%#TbLineCloseAllBufsBtn#" .. "  " .. "%X"
    return CloseAllBufsBtn
  end,
}
