local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "c",
    "cpp",
    "help",
  },
}

M.mason = {
  ensure_installed = {
    -- c/cpp
    "clangd",
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- shell
    "shellcheck",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.gitsigns = {
  signs = {
    add = { text = "┃" },
    change = { text = "┃" },
    delete = { text = "-" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  }
}

M.nvim_cmp = {
  window = {
    completion = {
      winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
    },
    documentation = {
      winhighlight = 'Normal:PmenuSbar,FloatBorder:PmenuSbar'
    },
  },
}

M.which_key = {
  icons = {
    separator = "-"
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 24, max = 64 }, -- min and max width of the columns
    spacing = 12, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "top", -- bottom, top
    margin = { 1, 1, 1, 1 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
}

M.indent_blankline = {
  char = "┃",
  show_current_context = false,
  filetype_exclude = {
    "help",
    "terminal",
    "alpha",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "nvchad_cheatsheet",
    "mason",
    "Scratch",
    "noice",
    "nvcheatsheet",
    "lazy",
    "text",
  },
}

M.nvterm = {
  terminals = {
    type_opts = {
      float = {
        row = 0.1,
        col = 0.1,
        width = 0.8,
        height = 0.8,
      },
    },
  },
}

M.telescope = require("custom.configs.telescope_config")
return M
