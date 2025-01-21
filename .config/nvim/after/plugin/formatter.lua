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
					args = { "-l", "120", "-q", "-" },
					stdin = true,
				}
			end,
			function()
				return {
					exe = "isort",
					args = { "--line-length=120", "--profile=black", "-" },
					stdin = true,
				}
			end,
			function()
				return {
					exe = "flake8",
					args = { "--ignore=E501,W503,E203", "-" },
					stdin = true,
				}
			end,
			function()
				return {
					exe = "mypy",
					args = { "--ignore-missing-imports", vim.api.nvim_buf_get_name(0) },
					stdin = false,
				}
			end,
		},
		-- python = {
		-- 	require("formatter.filetypes.python").black,
		-- },

		cpp = {
			require("formatter.filetypes.cpp").clangformat,
		},

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.keymap.set("n", "<leader>p", ":FormatWrite<CR>")
