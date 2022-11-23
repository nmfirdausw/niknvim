local fidget_exists, fidget = pcall(require, "fidget")
if not fidget_exists then return end

fidget.setup{}
