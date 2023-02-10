require("dapui").setup()

require("nvim-dap-virtual-text").setup()

require("dap-go").setup()

vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end)

vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end)

vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end)

vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end)

vim.keymap.set("n", "<leader>b", function()
	require("dap").toggle_breakpoint()
end)

vim.keymap.set("n", "<leader>B", function()
	require("dap").toggle_breakpoint(vim.fn.input("Breakpoint condition: "))
end)

vim.keymap.set("n", "<leader>bc", function()
	require("dap").clear_breakpoints()
end)

vim.keymap.set("n", "<leader>ds", function()
	require("dap").terminate()
	require("dapui").close()
end)

vim.keymap.set("n", "<leader>dt", function()
	if vim.bo.filetype == "javascript" or vim.bo.filetype == "typescript" then
		require("jester").debug()
	elseif vim.bo.filetype == "go" then
		require("dap-go").debug_test()
	end
end)

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	-- dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

require("jester").setup({
	path_to_jest_run = "./node_modules/.bin/jest",
	path_to_jest_debug = "./node_modules/.bin/jest",
	dap = {
		type = "pwa-node",
		-- runtimeArgs = {'--inspect-brk', '$path_to_jest', '--no-coverage', '-t', '$result', '--', '$file'},
		sourceMaps = true,
	},
})

require("dap-vscode-js").setup({
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "typescript", "javascript" }) do
	dap = require("dap")
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach Debugger",
			cwd = "${workspaceFolder}",
			processId = "${command:pickProcess}",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Debug Jest Tests",
			-- trace = true, -- include debugger info
			runtimeExecutable = "node",
			runtimeArgs = {
				"./node_modules/.bin/jest",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Debug Jest Tests in File",
			-- trace = true, -- include debugger info
			runtimeExecutable = "node",
			runtimeArgs = {
				"./node_modules/.bin/jest",
				"--",
				"${relativeFile}",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		},
		-- Use Jester for now
		-- {
		--   type = "pwa-node",
		--   request = "launch",
		--   name = "Debug Jest Single Test in File",
		--   -- trace = true, -- include debugger info
		--   runtimeExecutable = "node",
		--   runtimeArgs = {
		--     "./node_modules/.bin/jest",
		--     "-t",
		--     "{test}"
		--     "--",
		--     "${relativeFile}",
		--   },
		--   rootPath = "${workspaceFolder}",
		--   cwd = "${workspaceFolder}",
		--   console = "integratedTerminal",
		--   internalConsoleOptions = "neverOpen",
		-- }
	}
end
