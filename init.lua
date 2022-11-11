local impatient_exists, impatient = pcall(require, "impatient")
if impatient_exists then impatient.enable_profile() end
require "settings"
require "bootstrap"
require "keymaps"
