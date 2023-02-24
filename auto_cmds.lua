local autocmd = vim.api.nvim_create_autocmd

-- clean tail sapces
autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- return to last edit position when opening files
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
      local ft = vim.opt_local.filetype:get()
      -- don't apply to git messages
      if (ft:match('commit') or ft:match('rebase')) then
          return
      end
      -- get position of last saved edit
      local markpos = vim.api.nvim_buf_get_mark(0,'"')
      local line = markpos[1]
      local col = markpos[2]
      -- if in range, go there
      if (line > 1) and (line <= vim.api.nvim_buf_line_count(0)) then
          vim.api.nvim_win_set_cursor(0,{line,col})
      end
  end
})
