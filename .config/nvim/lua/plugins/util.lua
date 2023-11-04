return {
	{
		"nvim-treesitter/nvim-treesitter", -- optional
	},
	{
		"phaazon/hop.nvim",
		branch = "v2",
		keys = {
			{ "s", ":HopChar2MW<CR>" },
		},
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},
	{
		"kylechui/nvim-surround",
		lazy = true,
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"xiyaowong/transparent.nvim",
	},
	{
		"folke/zen-mode.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"goerz/jupytext.vim",
		config = function()
			vim.g["jupytext_fmt"] = "py"
		end,
	},
	{
		"lervag/vimtex",
		config = function()
			vim.cmd([[let g:tex_flavor = "latex"]])
			vim.cmd([[let g:vimtex_compiler_method = 'latexmk']])
			vim.cmd([[let g:vimtex_view_general_viewer = 'zathura']])
			vim.cmd(
				[[let g:vimtex_view_general_options = "-x \"nvr +%{line} %{input}\" --synctex-forward @line:0:@tex @pdf"]]
			)
		end,
	},
	{
		"pappasam/nvim-repl",
		config = function()
			vim.g["repl_filetype_commands"] = {
				["javascript"] = "node",
				["python"] = "ipython --no-autoindent",
			}
			vim.keymap.set("n", "<leader>l", "<cmd>ReplToggle<CR>")
			vim.keymap.set("n", "<leader>rr", [[<Plug>ReplSendLine]])
			vim.keymap.set("v", "<leader>rr", [[<Plug>ReplSendVisual]])
		end,
	},
	{
		"simeji/winresizer",
	},
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- config
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
	},
	{
		"wsdjeg/vim-todo",
	},
	{
		"luukvbaal/statuscol.nvim",
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				-- configuration goes here, for example:
				relculright = true,
				segments = {
					{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
					{
						sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
						click = "v:lua.ScSa",
					},
					{ text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
					{
						sign = { name = { ".*" }, maxwidth = 2, colwidth = 2, auto = false, wrap = true },
						click = "v:lua.ScSa",
					},
				},
			})
		end,
	},
	{
		"epwalsh/obsidian.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("obsidian").setup({
				dir = "/Users/miwanodaiki/Library/Mobile Documents/iCloud~md~obsidian/Documents/note_obsidian", -- no need to call 'vim.fn.expand' here
				notes_subdir = "notes",

				log_level = vim.log.levels.DEBUG,
				daily_notes = {
					folder = "DailyNote",
					date_format = "%Y-%m-%d",
					template = nil,
					-- see below for full list of options 👇
				},
			})
		end,
	},
}
