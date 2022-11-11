local indent_o_matic_exists, indent_o_matic = pcall(require, "indent-o-matic")
if not indent_o_matic_exists then return end

indent_o_matic.setup({})
