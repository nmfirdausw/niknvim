local impatient_exists, impatient = pcall(require, "impatient")
if impatient_exists then impatient.enable_profile() end
require "bootstrap"
require "settings"
