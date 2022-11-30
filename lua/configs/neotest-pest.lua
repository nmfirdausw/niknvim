local neotest_exists, neotest = pcall(require, "neotest")
if not neotest_exists then return end

neotest.setup({
  adapters = {
    require("neotest-pest")
  }
})
