-- plugins file!
-- (suggestion) -> lua/custom/plugins/init.lua or anywhere in custom dir

return {
  { "elkowar/yuck.vim", ft = "yuck" },
  { "ellisonleao/glow.nvim", cmd = "Glow" },
  { "williamboman/nvim-lsp-installer" },
  { "airblade/vim-gitgutter" },
  { "voldikss/vim-floaterm" },
  {
    "luukvbaal/stabilize.nvim",
    config = function()
      require("stabilize").setup()
    end
  },
  {
    "karb94/neoscroll.nvim",
    opt = true,
    config = function()
      require("neoscroll").setup()
    end,
    -- lazy loading
    setup = function()
      require("core.utils").packer_lazy_load "neoscroll.nvim"
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup{
        window = {
          border = "none", -- none, single, double, shadow
          position = "top", -- bottom, top
          margin = { 1, 1, 1, 1 }, -- extra window margin [top, right, bottom, left]
          padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
          winblend = 0
        },
        layout = {
          height = { min = 4, max = 25 }, -- min and max height of the columns
          width = { min = 24, max = 64 }, -- min and max width of the columns
          spacing = 12, -- spacing between columns
          align = "left", -- align columns left, center or right
        },
      }
    end,
    -- lazy loading
    setup = function()
      require("core.utils").packer_lazy_load "which-key.nvim"
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup()
    end,
    --lazy loading
    setup = function()
      require("core.utils").packer_lazy_load "project.nvim"
    end,
  }
}
