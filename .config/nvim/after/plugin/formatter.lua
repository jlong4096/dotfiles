require("formatter").setup({
	logging = true,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},

		javascript = {
			require("formatter.filetypes.javascript").prettierd,
			require("formatter.filetypes.javascript").eslint_d,
		},

		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettierd,
			require("formatter.filetypes.javascriptreact").eslint_d,
		},

		typescript = {
			require("formatter.filetypes.typescript").prettierd,
			require("formatter.filetypes.typescript").eslint_d,
		},

		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettierd,
			require("formatter.filetypes.typescriptreact").eslint_d,
		},

		go = {
			require("formatter.filetypes.go").gofmt,
			require("formatter.filetypes.go").goimports,
			require("formatter.filetypes.go").gofumpt,
			require("formatter.filetypes.go").golines,
		},

		python = {
			function()
				return {
					exe = "black",
					args = { "-l", "110", "-q", "-" },
					stdin = true,
				}
			end,
			function()
				return {
					exe = "isort",
					args = { "--line-length=110", "-" },
					stdin = true,
				}
			end,
			function()
				return {
					exe = "flake8",
					args = { "--ignore=E501", "--stdin-display-name", vim.api.nvim_buf_get_name(0), "-" },
					stdin = true,
				}
			end,
		},
		-- python = {
		-- 	require("formatter.filetypes.python").black,
		-- },

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.keymap.set("n", "<leader>p", ":FormatWrite<CR>")
