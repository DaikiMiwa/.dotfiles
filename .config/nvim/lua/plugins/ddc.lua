return {
  {
		"vim-denops/denops.vim",
		lazy = true,
	},
	{
		"skanehira/denops-translate.vim",
		lazy = false,
		cond = not vim.g.vscode,
		dependencies = { "vim-denops/denops.vim", },
		config = function ()
			vim.keymap.set({'v', 'n'}, "<Leader><Leader>t", "<Cmd>Translate<CR>", { noremap = true, silent = true })
		end
	},
	{
		"matsui54/denops-popup-preview.vim",
		lazy = true,
		dependencies = {
			"vim-denops/denops.vim",
		},
		config = function()
			vim.fn["popup_preview#enable"]()
		end,
	},
	{
		"matsui54/denops-signature_help",
		lazy = true,
		dependencies = {
			"vim-denops/denops.vim",
		},
		init = function()
			vim.g.signature_help_config = {
				contentsStyle = "full",
				viewStyle = "floating",
			}
		end,
		config = function()
			vim.fn["signature_help#enable"]()
		end,
	},
	{ "hrsh7th/vim-vsnip", lazy = true, },
	{
		"uga-rosa/ddc-source-vsnip",
		lazy = true,
		dependencies =
		{
			"vim-denops/denops.vim",
			"hrsh7th/vim-vsnip",
		},
	},
	{ "tani/ddc-fuzzy", lazy = true, },
	{ "Shougo/pum.vim", lazy = true, },
	{ "Shougo/ddc-ui-pum", lazy = true, },
	{ "Shougo/ddc-source-around", lazy = true, },
	{ "Shougo/ddc-sorter_rank", lazy = true, },
	{ "Shougo/ddc-source-nvim-lsp", lazy = true, },
	{ "Shougo/ddc-converter_remove_overlap", lazy = true, },
	{
		"github/copilot.vim",
		lazy = true,
		config = function ()
			vim.g.copilot_no_maps = true
		end
	},
	{
		"Shougo/ddc-source-copilot",
		lazy = true,
		dependencies = {
			"github/copilot.vim",
		}
	},
	{
		"Shougo/ddc.vim",
		lazy = false,
		cond = not vim.g.vscode,
		dependencies = {
			"hrsh7th/vim-vsnip",
			"uga-rosa/ddc-source-vsnip",
			"vim-denops/denops.vim",
			"matsui54/denops-popup-preview.vim",
			"matsui54/denops-signature_help",
			"tani/ddc-fuzzy",
			"Shougo/pum.vim",
			"Shougo/ddc-ui-pum",
			"Shougo/ddc-source-around",
			"Shougo/ddc-sorter_rank",
			"Shougo/ddc-source-nvim-lsp",
      'LumaKernel/ddc-source-file',
			"Shougo/ddc-converter_remove_overlap",
			"Shougo/ddc-source-copilot",
      "Shougo/ddc-omni"
		},
		config = function()
      vim.fn["pum#set_option"]({auto_select=true})
			vim.fn["ddc#custom#patch_global"]({
				ui = 'pum',
				autoCompleteEvents = {'InsertEnter', 'TextChangedI', 'TextChangedP', 'CmdlineChanged', 'CmdlineEnter', 'TextChangedT'},
				sources = {
					'copilot',
					'nvim-lsp',
          'file',
					'around',
				},
				backspaceCompletion = false,
				sourceOptions = {
					_ = {
						matchers = {'matcher_fuzzy'},
						sorters = {'sorter_fuzzy', 'sorter_rank'},
						converters = {'converter_remove_overlap', 'converter_fuzzy'},
						minAutoCompleteLength = 3,
					},
          ["file"] = {
            mark = '[F]',
            isVolatile = true,
            forceCompletionPattern = {[[\S/\S*]]}
          },
					["nvim-lsp"] = {
						mark = '[LSP]',
						forceCompletionPattern = {[['\.\w*|:\w*|->\w*']]},
						minAutoCompleteLength = 1,
					},
					--codeium = {
					--	mark = '[codeium]',
					--	matchers = {},
					--	minAutoCompleteLength = 0,
					--	timeout = 1000,
					--	isVolatile = true,
					--},
					copilot = {
						mark = '[copilot]',
						matchers = {},
						minAutoCompleteLength = 1,
						isVolatile = true,
					},
					around = { mark = '[A]' },
				},
				sourceParams = {
					["nvim-lsp"] = {
						snippetEngine = vim.fn["denops#callback#register"](function(body) vim.fn["vsnip#anonymous"](body) end),
						enableResolveItem = true,
						enableAdditionalTextEdit = true,
					},
					around = { maxSize = 10 },
				},
			})
			vim.fn["ddc#custom#patch_filetype"]('markdown', 'sourceParams', {
				around = { maxSize = 10 }
			})
      vim.fn["ddc#custom#patch_filetype"]('tex', 'sourceOptions', {
        omni = {
          mark = 'O',
          forceCompletionPattern = vim.g["vimtex#re#deoplete"],
        }
      })
      vim.fn["ddc#custom#patch_filetype"]('tex', 'sourceOptions', {
        omni = {
          omnifunc = 'vimtex#omnifunc#omnifunc'
        }
      })
			vim.api.nvim_create_autocmd('InsertEnter', {
				callback = function(ev)
					local opt = { noremap = true }
					vim.keymap.set('i', '<C-n>', [[(pum#visible() ? '' : ddc#map#manual_complete()) . pum#map#select_relative(+1)]], { expr = true, noremap = false })
					vim.keymap.set('i', '<C-p>', [[(pum#visible() ? '' : ddc#map#manual_complete()) . pum#map#select_relative(-1)]], { expr = true, noremap = false })
					vim.keymap.set('i', '<C-y>', [[<Cmd>call pum#map#confirm()<CR>]], opt)
					vim.keymap.set('i', '<C-e>', [[<Cmd>call pum#map#cancel()<CR>]], opt)
					vim.keymap.set('i', '<PageDown>', [[<Cmd>call pum#map#insert_relative_page(+1)<CR>]], opt)
					vim.keymap.set('i', '<PageUp>', [[<Cmd>call pum#map#insert_relative_page(-1)<CR>]], opt)
					-- vim.keymap.set('i', '<CR>', function() if vim.fn['pum#visible']() then return '<Cmd>call pum#map#confirm()<CR>' or '<CR>' else return '<CR>' end end, { expr = true, noremap = false })
					vim.keymap.set('i', '<CR>', function() if vim.fn['pum#visible']() then return '<CR>' else return '<CR>' end end, { expr = true, noremap = false })
					vim.keymap.set('i', '<C-m>', function() if vim.fn['pum#visible']() then return '<Cmd>call ddc#map#manual_complete()<CR>' else return '<C-m>' end end, { expr = true, noremap = false })
					vim.keymap.set({'i', 's'}, '<C-l>', function() return  vim.fn['vsnip#available'](1) == 1 and '<Plug>(vsnip-expand-or-jump)' or '<C-l>' end, { expr = true, noremap = false })
					vim.keymap.set({'i', 's'}, '<Tab>', function() return vim.fn['vsnip#jumpable'](1) == 1 and '<Plug>(vsnip-jump-next)' or '<Tab>' end, { expr = true, noremap = false })
					vim.keymap.set({'i', 's'}, '<S-Tab>', function() return vim.fn['vsnip#jumpable'](-1) == 1 and '<Plug>(vsnip-jump-prev)' or '<S-Tab>' end, { expr = true, noremap = false })
					vim.keymap.set({'n', 's'}, '<s>', [[<Plug>(vsnip-select-text)]], { expr = true, noremap = false })
					vim.keymap.set({'n', 's'}, '<S>', [[<Plug>(vsnip-cut-text)]], { expr = true, noremap = false })
				end,
			})
			vim.g.vsnip_filetypes = {}
			vim.fn["ddc#enable"]()
		end,
	},
}
