require("projections").setup({
  patterns = { ".git", ".svn", ".hg", },
  -- sessions_directory = "~/.local/nvim/projections",
})

local Session = require("projections.session")
vim.api.nvim_create_autocmd({ 'DirChangedPre', 'VimLeavePre' }, {
  callback = function()
    Session.store(vim.loop.cwd())
  end,
})

-- Switch to project if vim was started in a project dir
local switcher = require("projections.switcher")
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    if vim.fn.argc() == 0 then switcher.switch(vim.loop.cwd()) end
  end,
})

vim.api.nvim_create_user_command("StoreProjectSession", function()
    Session.store(vim.loop.cwd())
end, {})

vim.api.nvim_create_user_command("RestoreProjectSession", function()
    Session.restore(vim.loop.cwd())
end, {})

local Workspace = require("projections.workspace")
-- Add workspace command
vim.api.nvim_create_user_command("AddWorkspace", function()
    Workspace.add(vim.loop.cwd())
end, {})

vim.opt.sessionoptions:append("localoptions")
