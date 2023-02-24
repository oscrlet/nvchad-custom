---@type MappingsConfig
local M = {}

-- cancel some mappings
M.disabled = {
  n = {
    ["<C-h>"] = "",
    ["<C-i>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-l>"] = "",
    ["<C-n>"] = "",
    ["<A-i>"] = "",
    ["<leader>h"] = "",
    ["<leader>tk"] = "",
    ["<leader>cm"] = "",
    ["<leader>gt"] = "",
    ["<leader>f"] = "",
    ["<leader>cc"] = "",
    ["<C-left>"] = "",
    ["<C-right>"] = "",
    ["<C-down>"] = "",
    ["<C-up>"] = "",
  },
  i = {
    ["<C-h>"] = "",
    ["<C-i>"] = "",
  }
}
M.basic = {
  n = {
    ["h"] = { "i", "insert" },
    ["i"] = { "<Up>", "move up" },
    ["j"] = { "<Left>", "move left" },
    ["k"] = { "<Down>", "move down" },
    ["l"] = { "<Right>", "move right" },
  },
  i = {
    ["<C-i>"] = { "<Up>", "move up" },
    ["<C-j>"] = { "<Left>", "move left" },
    ["<C-k>"] = { "<Down>", "move down" },
    ["<C-l>"] = { "<Right>", "move right" },
  }
}
M.general = {
  n = {
    -- switch between windows
    ["<C-j>"] = { "<C-w>h", "window left" },
    ["<C-l>"] = { "<C-w>l", "window right" },
    ["<C-k>"] = { "<C-w>j", "window down" },
    ["<C-i>"] = { "<C-w>k", "window up" },
    ["<C-left>"] = { "<C-w>h", "window left" },
    ["<C-right>"] = { "<C-w>l", "window right" },
    ["<C-down>"] = { "<C-w>j", "window down" },
    ["<C-up>"] = { "<C-w>k", "window up" },
    ["<C-delete>"] = { "<cmd> close <CR>", "close current window"},
    ["<C-q>"] = { "<cmd> :q <CR>", "exit nvim" },
    ["<A-delete>"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close current buffer"
    },
    ["<F12>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
    ["<leader>cc"] = {
      function()
        local value = vim.api.nvim_get_option_value("colorcolumn", {})
        if value == "" then
          vim.api.nvim_set_option_value("colorcolumn", "120", {})
        else
          vim.api.nvim_set_option_value("colorcolumn", "", {})
        end
      end,
      "toggle colorcolumn",
    }
  },
  t = {
    ["<F12>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
    ["<ESC>"] = { "<C-\\><C-N>", "escape terminal mode" }
  }
}
M.lspconfig = {
  n = {
    ["gd"] = {
      "<cmd> Telescope lsp_definitions <CR>",
      "lsp definition"
    },
    ["gr"] = {
      "<cmd> Telescope lsp_references include_declaration=false fname_width=50 show_line=false <CR>",
      "lsp reference"
    },
  }
}
M.telescope = {
  n = {
    ["<CR>"] = {
      "<cmd> Telescope find_pickers <CR>",
      "toggle telescope"
    },
    ["<leader><TAB>"] = {
      "<cmd> Telescope projections <CR>",
      "switch projects"
    },
    ["<leader>fp"] = {
      "<cmd> Telescope projections <CR>",
      "open project"
    },
    ["<leader>fk"] = {
      "<cmd> Telescope keymaps <CR>",
      "find key-mappings"
    },
    ["<leader>gc"] = {
      "<cmd> Telescope git_commits <CR>",
      "git commits"
    },
    ["<leader>gs"] = {
      "<cmd> Telescope git_status <CR>",
      "git status"
    },
    ["<leader>hl"] = {
      "<cmd> Telescope highlights <CR>",
      "highlight groups"
    },
    ["<leader>fd"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },
    ["<F2>"] = {
      "<cmd> Telescope lsp_document_symbols layout_strategy=vertical symbol_width=80 symbol_type_width=10 <CR>",
      "lsp symbols in current file"
    },
    ["<F3>"] = {
      "<cmd> Telescope lsp_dynamic_workspace_symbols layout_strategy=vertical symbol_width=80 symbol_type_width=10 <CR>",
      "lsp symbols in workspace"
    }
  }
}
M.vim_visual_multi = {
  n = {
    ["<C-A>"] = {
      "<cmd> call vm#commands#find_all(0, 1) <CR>",
      "select all of the word under cursor in current buffer"
    }
  }
}

M.tabufline = {
  n = {
    ["<A-l>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["<A-j>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },

    ["<A-right>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["<A-left>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },
  }
}

return M
