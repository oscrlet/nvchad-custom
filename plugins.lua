local overrides = require("custom.configs.overrides")

---@type NvPluginsTable
local plugins = {

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
        require("plugins.configs.lspconfig")
        require("custom.configs.lspconfig")
    end,
  },

  -- overrde plugin configs
  ["folke/which-key.nvim"] = {
    enabled = true,
    override_options = overrides.which_key,
  },

  ["lewis6991/gitsigns.nvim"] = {
    override_options = overrides.gitsigns
  },

  ["nvim-treesitter/nvim-treesitter"] = {
      override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
      override_options = overrides.mason,
  },

  ["nvim-tree/nvim-tree.lua"] = {
      override_options = overrides.nvimtree,
  },

  ["hrsh7th/nvim-cmp"] = {
    override_options = overrides.nvim_cmp,
  },

  ["lukas-reineke/indent-blankline.nvim"] = {
    override_options = overrides.indent_blankline,
  },

  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope,
  },

  ["NvChad/nvterm"] = {
    override_options = overrides.nvterm,
  },

  ["NvChad/ui"] = {
    override_options = overrides.ui,
  },

    -- Install a plugin
  ["max397574/better-escape.nvim"] = {
      event = "InsertEnter",
      config = function()
          require("better_escape").setup()
      end,
  },

  ["rcarriga/nvim-notify"] = {
    config = function ()
      require "custom.configs.notify"
    end,
  },

  ["nathom/filetype.nvim"] = {
    enabled = true,
  },

  ["mg979/vim-visual-multi"] = {
    event = "ModeChanged *:[vV\x16]*",
  },

  ["folke/noice.nvim"] = {
    event = "VimEnter",
    config = function ()
      require("noice").setup(
        require "custom.configs.noice_config"
      )
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  ["GnikDroy/projections.nvim"] = {
    -- enabled = false,
    config = function()
      require "custom.configs.projections"
    end
  },

  ["ggandor/leap.nvim"] = {
    event = "BufEnter",
    config = function ()
      require("leap").add_default_mappings()
    end
  },

  ["RRethy/nvim-treesitter-textsubjects"] = {
    event = "ModeChanged *:[vV\x16]*",
    config = function ()
      require("nvim-treesitter.configs").setup {
        textsubjects = {
          enable = true,
          prev_selection = '<BS>',
          keymaps = {
            [';'] = 'textsubjects-smart',
            ['.'] = 'textsubjects-container-outer',
            [','] = 'textsubjects-container-inner',
          },
        },
      }
    end
  },
-- telescope extensions
  ["nvim-telescope/telescope-project.nvim"] = {
    enabled = false,
    config = function ()
      require("telescope").load_extension("project")
    end
  },

  ["nvim-telescope/telescope-ui-select.nvim"] = {
    config = function ()
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("notify")
    end
  },

  ["natecraddock/telescope-zf-native.nvim"] = {
    config = function ()
      require("telescope").load_extension("zf-native")
    end
  },

  ["antoinemadec/telescope-git-browse.nvim"] = {
    config = function ()
      require("telescope").load_extension("git_browse")
    end
  },

  ["keyvchan/telescope-find-pickers.nvim"] = {
    config = function ()
      require("telescope").load_extension("find_pickers")
    end,
  },
}

return plugins
