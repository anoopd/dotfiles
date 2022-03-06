local present, impatient = pcall(require, "impatient")

if present then
   impatient.enable_profile()
end

require 'disabled'
require 'plugins'
require 'keymappings'
require 'lsp'

local g = vim.g
local cmd = vim.cmd
local o,wo,bo = vim.o, vim.wo, vim.bo
local utils = require 'config.utils'
local opt = utils.opt
local autocmd = utils.autocmd
local map = utils.map

-- Map Leader To comma 
g.mapleader = ','

-- Disable some built-in plugins we don't want



-- Settings
opt('number', true, window)
opt('relativenumber', true, window)



-- Colorscheme
opt('termguicolors', true)
cmd [[colorscheme onedark]]
vim.opt.completeopt = {'menu','menuone', 'noselect'}


require('lualine').setup()
require'nvim-tree'.setup()
require('nvim-autopairs').setup{}





-- make comments and HTML attributes italic
cmd [[highlight Comment cterm=italic term=italic gui=italic]]
cmd [[highlight htmlArg cterm=italic term=italic gui=italic]]
cmd [[highlight xmlAttrib cterm=italic term=italic gui=italic]]
-- highlight Type cterm=italic term=italic gui=italic
cmd [[highlight Normal ctermbg=none]]


