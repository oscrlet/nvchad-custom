require("custom.auto_cmds")

vim.api.nvim_create_user_command("MakeTheme",
function()
  require("base46").load_all_highlights()
end, {})

vim.g.VM_default_mappings = 0
vim.g.VM_Mouse_mappings = 0
