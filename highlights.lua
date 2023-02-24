local colors = {
  pale_night = "#9198B6",
  white = "#fffbef",
  pale_night_green = "#81CCC5"
}

local everforest_light_bg = {
  bg_dim = "#f2efdf",
  bg0 = "#fffbef",
  bg1 = "#f8f5e4",
  bg2 = "#f2efdf",
  bg3 = "#edeada",
  bg4 = "#e8e5d5",
  bg5 = "#bec5b2",
  bg_red = "#ffe7de",
  bg_visual = "#f0f2d4",
  bg_yellow = "#fef2d5",
  bg_green = "#f3f5d9",
  bg_blue = "#ecf5ed",
}

local everforest_light_fg = {
  red = "#f85552",
  orange = "#f57d26",
  yellow = "#dfa000",
  green = "#8da101",
  blue = "#3a94c5",
  aqua = "#35a77c",
  purple = "#df69ba",
  fg = "#5c6a72",
  statusline1 = "#93b259",
  statusline2 = "#708089",
  statusline3 = "#e66868",
  grey_0 = "#a6b0a0",
  grey_1 = "#939f91",
  grey_2 = "#829181",
}

local M = {}

---@type HLTable
M.override = {
  Normal = {
    -- fg = colors.pale_night,
  },
  ErrorMsg = {
    bg = "one_bg",
  },
  ColorColumn = {
    bg = "one_bg2",
  },
  TbLineBufOn = {
    bg = "darker_black",
  },
  TbLineBufOnModified = {
    bg = "darker_black",
  },
  TbLineBufOnClose = {
    fg = colors.pale_night_green,
    bg = "darker_black",
  },
  St_NormalMode = {
    -- bg = everforest_light_fg.statusline1,
    fg = colors.white,
  },
  St_NormalModeSep = {
    -- fg = everforest_light_fg.statusline1,
  },
  St_LspStatus = {
    fg = "light_grey",
  },
  St_file_info = {
    fg = "white",
  },
  St_cwd_sep = {
    fg = "lightbg",
  },
  St_cwd_icon = {
    fg = "white",
    bg = "lightbg",
  },
  St_cwd_text = {
    fg = "white",
  },
  St_pos_text = {
    fg = colors.white,
    bg = everforest_light_fg.statusline1,
  },
  St_pos_icon = {
    fg = colors.white,
    bg = everforest_light_fg.statusline1,
  },
  St_pos_sep = {
    fg = everforest_light_fg.statusline1,
  },
  -- Float normal
  NormalFloat = {
    bg = "one_bg",
    -- fg = colors.white,
  },
  -- Float window
  FloatBorder = {
    bg = "one_bg",
    fg = "one_bg"
  },
  -- Float terminal
  Floaterm = {
    bg = "one_bg"
  },
  FloatermNC = {
    fg = "one_bg",
    bg = "one_bg"
  },
  FloatermBorder = {
    fg = "one_bg",
    bg = "one_bg"
  },
  -- Nvim cmp
  CmpBorder = {
    bg = "one_bg",
    fg = "one_bg",
  },

  CmpDocBorder = {
    bg = "one_bg",
    fg = "one_bg",
  },
  -- renamer
  RenamerBorder = {
    bg = "one_bg",
    fg = "one_bg",
  },

  RenamerTitle = {
    bg = "green",
    fg = "black",
  },
  -- nvdash
  NvDashAscii = {
    bg = colors.white,
    fg = "darker_black",
  },
  NvDashButtons = {
    fg = colors.white,
  },
  -- notify
  NotifyINFOBorder = {
    fg = "one_bg",
    bg = "one_bg",
  },
  NotifyWARNBorder = {
    fg = "one_bg",
    bg = "one_bg",
  },
  NotifyERRORBorder = {
    fg = "one_bg",
    bg = "one_bg",
  },
  NotifyDEBUGBorder = {
    fg = "one_bg",
    bg = "one_bg",
  },
  NotifyTRACEBorder = {
    fg = "one_bg",
    bg = "one_bg",
  },
}

---@type HLTable
M.add = {
  TabufLinePaddingOn = {
    fg = "darker_black",
    bg = "black2"
  },
  TabufLinePaddingOff = {
    fg = "black2",
    bg = "black2",
  },
  NotifyINFOIcon = {
    fg = "green",
  },
  NotifyINFOTitle = {
    fg = "green",
  },
  NotifyWARNIcon = {
    fg = "yellow",
  },
  NotifyWARNTitle = {
    fg = "yellow",
  },
  NotifyERRORIcon = {
    fg = "red",
  },
  NotifyERRORTitle = {
    fg = "red",
  },
  NotifyTRACEIcon = {
    fg = "purple",
  },
  NotifyTRACETitle = {
    fg = "purple",
  },

  NotifyINFOBorder = {
    fg = "one_bg",
    bg = "one_bg",
  },
  NotifyWARNBorder = {
    fg = "one_bg",
    bg = "one_bg",
  },
  NotifyERRORBorder = {
    fg = "one_bg",
    bg = "one_bg",
  },
  NotifyDEBUGBorder = {
    fg = "one_bg",
    bg = "one_bg",
  },
  NotifyTRACEBorder = {
    fg = "one_bg",
    bg = "one_bg",
  },
  NotifyINFOBody = {
    bg = "one_bg",
  },
  NotifyWARNBody = {
    bg = "one_bg",
  },
  NotifyERRORBody = {
    bg = "one_bg",
  },
  NotifyDEBUGBody = {
    bg = "one_bg",
  },
  NotifyTRACEBody = {
    bg = "one_bg",
  },

  -- noice
  NoiceMini = {
    bg = "black",
  },
  NoiceCmdlinePopup = {
    bg = "black2",
  },
  NoicePopupMenu = {
    bg = "darker_black",
  },
  NoicePopupMenuSelected = {
    bg = "black2",
  },
  NoicePopupMenuBorder = {
    bg = "darker_black",
    fg = "darker_black",
  },
  NoiceCmdlinePopupBorderCmdLine = {
    bg = "black2",
    fg = "black2",
  },
  NoiceCmdlinePopupBorderSearch = {
    bg = "black2",
    fg = "black2",
  },
  NoiceCmdlinePopupBorderLua = {
    bg = "black2",
    fg = "black2",
  },
  NoiceCmdlinePopupBorderFilter = {
    bg = "black2",
    fg = "black2",
  },
  NoiceCmdlinePopupBorderInput = {
    bg = "black2",
    fg = "black2",
  },
  NoiceCmdlinePopupBorderHelp = {
    bg = "black2",
    fg = "black2",
  },
  NoiceConfirm = {
    bg = "black2",
  },
  NoiceConfirmBorder = {
    bg = "black2",
    fg = "black2",
  },
  NoiceLspProgressSpinner = {
    fg = "green",
  },
  NoiceLspProgressClient = {
    fg = "green",
  },
  -- TabLine
  TabLine = {
    bg ="white",
    fg ="darker_black",
  },
}

return M
