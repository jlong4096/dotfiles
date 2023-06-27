vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<Right>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
-- vim.api.nvim_set_keymap("i", "<leader>p", ":Copilot panel", { silent = true, expr = true })

vim.g.copilot_filetypes = {
	["*"] = false,
	["javascript"] = true,
	["typescript"] = true,
	["lua"] = true,
	["rust"] = true,
	["c"] = true,
	["c#"] = true,
	["c++"] = true,
	["go"] = true,
	["python"] = true,
}
