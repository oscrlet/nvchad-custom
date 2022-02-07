-- MAPPINGS
local map = require("core.utils").map

-- shortcuts
map("n", "<leader>q", [[<cmd> q <CR>"]])
map("n", "<A-delete>", [[<cmd> bd <CR>]])

-- plugin maps
map("n", "<leader>cc", [[<cmd> Telescope <CR>]])
map("n", "<F10>", [[<cmd> FloatermNew --height=0.7 --width=0.7 --borderchars="        " <CR>]])
map("n", "<F12>", [[<cmd> FloatermToggle <CR>]])
map("t", "<F12>", [[<cmd> FloatermToggle <CR>]])


-- NOTE: the 4th argument in the map function is be a table i.e options but its most likely un-needed so dont worry about it
