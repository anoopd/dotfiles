local utils = require 'config.utils'

local map = utils.map

local noropt = { noremap = true }
local silopt = { noremap = true, silent = true }
--Nerdtree Keymappings
map('n','<C-n>',':NvimTreeToggle<CR>',noropt)


-- Telescope Keymappings
map('n','<leader>ff','<cmd>Telescope find_files<cr>',noropt)
map('n','<leader>fg','<cmd>Telescope live_grep<cr>',noropt)
map('n','<leader>fb','<cmd>Telescope buffers<cr>',noropt)



-- Glow for Markdown
map('n','<leader>p','<cmd>Glow<cr>',noropt)

-- LazyGit
map('n','<leader>gg','<cmd>LazyGit<cr>',silopt)
