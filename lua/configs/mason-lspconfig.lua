local mason_lspconfig_exists, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_exists then return end

mason_lspconfig.setup()
