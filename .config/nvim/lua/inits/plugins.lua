vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use("tpope/vim-surround")

	use("tpope/vim-abolish")

	-- use("mileszs/ack.vim")
	use("jremmen/vim-ripgrep")

	use("AndrewRadev/splitjoin.vim")

	use("EdenEast/nightfox.nvim")

	use("whiteinge/diffconflicts")

	use("moll/vim-bbye")

	use("romainl/vim-qf")

	use("airblade/vim-gitgutter")

	use("tomtom/tcomment_vim")

	use({
		"nvim-lualine/lualine.nvim",
		-- requires = { "kyazdani42/nvim-web-devicons", opt = true }
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/nvim-treesitter-context")

	use("mbbill/undotree")

	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("theHamsta/nvim-dap-virtual-text")
	use("leoluz/nvim-dap-go")
	use("David-Kunz/jester")
	use({
		"mxsdev/nvim-dap-vscode-js",
		requires = {
			{ "mfussenegger/nvim-dap" },
			{
				"microsoft/vscode-js-debug",
				opt = true,
				run = "npm install --legacy-peer-deps && npm run compile",
			},
		},
	})

	use("mhartington/formatter.nvim")

	use("github/copilot.vim")
	-- use("hrsh7th/cmp-copilot")

	-- use("zbirenbaum/copilot.lua")
	--
	-- use({
	-- 	"zbirenbaum/copilot-cmp",
	-- 	after = { "copilot.lua" },
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- })
end)
