local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.nvim_workspace()
-- lsp.setup_nvim_cmp({
-- 	sources = {
-- 		{ name = "copilot" },
-- 		{ name = "nvim_lsp" },
-- 		{ name = "path" },
-- 	},
-- })

lsp.setup()
