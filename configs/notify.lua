local api = vim.api
local base = require("notify.render.base")
local client_notifs = {}

local function get_notif_data(client_id, token)
 if not client_notifs[client_id] then
   client_notifs[client_id] = {}
 end

 if not client_notifs[client_id][token] then
   client_notifs[client_id][token] = {}
 end

 return client_notifs[client_id][token]
end

local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

local function update_spinner(client_id, token)
 local notif_data = get_notif_data(client_id, token)

 if notif_data.spinner then
   local new_spinner = (notif_data.spinner + 1) % #spinner_frames
   notif_data.spinner = new_spinner

   notif_data.notification = vim.notify(nil, nil, {
     hide_from_history = true,
     icon = spinner_frames[new_spinner],
     replace = notif_data.notification,
   })

   vim.defer_fn(function()
     update_spinner(client_id, token)
   end, 100)
 end
end

local function format_title(title, client_name)
 return client_name .. (#title > 0 and ": " .. title or "")
end

local function format_message(message, percentage)
 return (percentage and percentage .. "%\t" or "") .. (message or "")
end

-- LSP integration
-- Make sure to also have the snippet with the common helper functions in your config!
vim.lsp.handlers["$/progress"] = function(_, result, ctx)
 local client_id = ctx.client_id

 local val = result.value

 if not val.kind then
   return
 end

 local notif_data = get_notif_data(client_id, result.token)

 if val.kind == "begin" then
   local message = format_message(val.message, val.percentage)

   notif_data.notification = vim.notify(message, "info", {
     title = format_title(val.title, vim.lsp.get_client_by_id(client_id).name),
     icon = spinner_frames[1],
     timeout = false,
     hide_from_history = false,
   })

   notif_data.spinner = 1
   update_spinner(client_id, result.token)
 elseif val.kind == "report" and notif_data then
   notif_data.notification = vim.notify(format_message(val.message, val.percentage), "info", {
     replace = notif_data.notification,
     hide_from_history = false,
   })
 elseif val.kind == "end" and notif_data then
   notif_data.notification =
     vim.notify(val.message and format_message(val.message) or "Complete", "info", {
       icon = "",
       replace = notif_data.notification,
       timeout = 3000,
     })

   notif_data.spinner = nil
 end
end

local render_with_split = function(bufnr, notif, highlights, config)
  local left_icon = notif.icon .. " "
  local max_message_width = math.max(math.max(unpack(vim.tbl_map(function(line)
    return vim.fn.strchars(line)
  end, notif.message))))
  local right_title = notif.title[2]
  local left_title = notif.title[1]
  local title_accum = vim.str_utfindex(left_icon)
    + vim.str_utfindex(right_title)
    + vim.str_utfindex(left_title)

  local left_buffer = string.rep(" ", math.max(0, max_message_width - title_accum))

  local namespace = base.namespace()
  api.nvim_buf_set_lines(bufnr, 0, 1, false, { "", "" })
  api.nvim_buf_set_extmark(bufnr, namespace, 0, 0, {
    virt_text = {
      { " " },
      { left_icon, highlights.icon },
      { left_title .. left_buffer, highlights.title },
    },
    virt_text_win_col = 0,
    priority = 10,
  })
  api.nvim_buf_set_extmark(bufnr, namespace, 0, 0, {
    virt_text = { { " " }, { right_title, highlights.title }, { " " } },
    virt_text_pos = "right_align",
    priority = 10,
  })
  api.nvim_buf_set_extmark(bufnr, namespace, 1, 0, {
    virt_text = {
      {
        string.rep(
          "─",
          math.max(vim.str_utfindex(left_buffer) + title_accum + 2, config.minimum_width())
        ),
        highlights.title,
      },
    },
    virt_text_win_col = 0,
    priority = 10,
  })
  api.nvim_buf_set_lines(bufnr, 2, -1, false, notif.message)

  api.nvim_buf_set_extmark(bufnr, namespace, 2, 0, {
    hl_group = highlights.body,
    end_line = 1 + #notif.message,
    end_col = #notif.message[#notif.message],
    priority = 50, -- Allow treesitter to override
  })
end

local options = {
  fps = 240,
  top_down = false,
  render = render_with_split,
}

require("notify").setup(options)

vim.notify = require("notify")
