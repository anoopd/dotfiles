-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

-- Load nvim color scheme:
--- OneDark styles: dark, darker, cool, deep, warm, warmer, light
require('onedark').setup {
  style = 'cool',
  colors = { fg = '#b2bbcc' }, --default: #a0a8b7
}
require('onedark').load()
