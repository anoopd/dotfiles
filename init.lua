local present, impatient = pcall(require, "impatient")


if present then
  impatient.enable_profile()
end

require 'plugins'
-- require 'plugincopilot'
require 'keymappings'
require 'colors'
require 'settings'
require 'autocommands'





--require 'lsp'
