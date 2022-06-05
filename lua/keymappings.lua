-- Map Leader To comma
vim.g.mapleader = ','

local utils = require 'config.utils'

local map = utils.map

local noropt = { noremap = true }
local silopt = { noremap = true, silent = true }

--Nerdtree Keymappings
map('n', '<C-n>', ':NvimTreeToggle<CR>', noropt)

-- Toggleterm Keymappings



-- Remove Search highlight
map('n', '<CR>', '<cmd>let@/=""<CR>', noropt)


-- Telescope Keymappings
map('n', '<C-p>', '<cmd>Telescope find_files<cr>', noropt)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', noropt)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', noropt)
map('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', noropt)
map('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', noropt)
map('n', '<leader>fds', '<cmd>Telescope lsp_document_symbols<cr>', noropt)
map('n', '<leader>fws', '<cmd>Telescope lsp_workspace_symbols<cr>', noropt)
map('n', '<leader>fr', '<cmd>Telescope lsp_references<cr>', noropt)

-- Glow for Markdown
map('n', '<leader>p', '<cmd>Glow<cr>', noropt)

-- LazyGit
map('n', '<leader>gg', '<cmd>LazyGit<cr>', silopt)

--Bufferline Keymappings
map('n', 'bn', '<cmd>BufferLineCycleNext<CR>', silopt)
map('n', 'bp', '<cmd>BufferLineCyclePrev<CR>', silopt)
map('n', 'bmn', '<cmd>BufferLineMoveNext<CR>', silopt)
map('n', 'bmp', '<cmd>BufferLineMovePrev<CR>', silopt)
map('n', 'bb', '<cmd>BufferLinePick<CR>', silopt)
map('n', 'bc', '<cmd>BufferLinePickClose<CR>', silopt)

map('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>', silopt)
map('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>', silopt)
map('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>', silopt)
map('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>', silopt)
map('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<CR>', silopt)
map('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<CR>', silopt)
map('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<CR>', silopt)
map('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<CR>', silopt)
map('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<CR>', silopt)

-- Trouble Keymappings
map("n", "<leader>xx", "<cmd>Trouble<cr>", silopt)
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", silopt)
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", silopt)
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", silopt)
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", silopt)
map("n", "gR", "<cmd>Trouble lsp_references<cr>", silopt)


-- Todo-Comments Keymappings
map("n", "<leader>xt", "<cmd>TodoTrouble<cr>", silopt)
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", silopt)

-- DAP bindings or mappings
map("n", "<leader>dc", ":lua require'dap'.continue()<CR>", silopt)
map("n", "<leader>do", ":lua require'dap'.step_over()<CR>", silopt)
map("n", "<leader>di", ":lua require'dap'.step_into()<CR>", silopt)
map("n", "<leader>dx", ":lua require'dap'.step_out()<CR>", silopt)
map("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", silopt)
map("n", "<leader>dB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", silopt)
map("n", "<leader>dl", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", silopt)
map("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", silopt)
map("n", "<leader>drl", ":lua require'dap'.run_last()<CR>", silopt)

map("n", "<leader>dev", ":lua require('dapui').eval()<CR>", silopt)
map("v", "<leader>dev", ":lua require('dapui').eval()<CR>", silopt)
map("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", silopt)

map("n", "<leader>de", ":lua require('dap').close()<CR>", silopt)

-- telescope-dap
map('n', '<leader>dcc', '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', silopt)
map('n', '<leader>dco', '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>', silopt)
map('n', '<leader>dlb', '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', silopt)
map('n', '<leader>dv', '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', silopt)
map('n', '<leader>df', '<cmd>lua require"telescope".extensions.dap.frames{}<CR>', silopt)

-- dap-ui
-- map("n", '<leader>dsc', '<cmd>lua require"dap.ui.variables".scopes()<CR>', silopt)
-- map("n", '<leader>dhh', '<cmd>lua require"dap.ui.variables".hover()<CR>', silopt)
-- map("v", '<leader>dhv', '<cmd>lua require"dap.ui.visual_hover()<CR>', silopt)
-- map("n", '<leader>duh', '<cmd>lua require"dap.ui.widgets".hover()<CR>', silopt)
-- map("n", '<leader>duf', '<cmd>lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes<CR>', silopt)

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map( "n", "<Leader>dhh", ":lua require('dap.ui.variables').hover()<CR>",silopt )
map( "v", "<Leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>",silopt )

map( "n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>",silopt )
map( "n", "<Leader>duf", ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>",silopt )
