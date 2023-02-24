local M

M = {
  cmdline = {
    opts = {
      position = {
        row = "10%",
        col = "50%",
      },
    },
    format = {
      cmdline = {
        icon = ">",
      },
      help = {
        icon = "?",
      },
      search_up = {
        icon = " ",
      },
      search_down = {
        icon = " ",
      },
    },
  },
  lsp = {
    progress = {
      enabled = false,
    },
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  notify = {
    enabled = false,
  },
  views = {
    cmdline_popup = {
      border = {
        style = "none",
        padding = { 1, 2 },
      },
      size = {
        width = 60,
        height = "auto",
      },
    },
    popupmenu = {
      relative = "editor",
      position = {
        row = 7,
        col = "50%",
      },
      size = {
        width = 60,
        height = 10,
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
    },
    mini = {
      position = {
        row = 1,
        col = "100%",
      },
    },
  },
}

return M
