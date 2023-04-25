function Python_path()
  local venv_path = os.getenv("VIRTUAL_ENV")
  if venv_path == nil then
    return '/Users/miwanodaiki/.pyenv/shims/python'
  else
    return venv_path .. '/bin/python'
  end
end

function Venv_path()
  local venv_path = os.getenv("VIRTUAL_ENV")
  if venv_path == nil then
    return '/Users/miwanodaiki/.pyenv'
  else
    return venv_path
  end
end

local keymap = vim.keymap.set

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Rename all occurrences of the hovered word for the entire file
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
keymap("n", "<leader>rnp", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

-- Go to definition
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

-- Go to type definition
keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")

-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
keymap("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show buffer diagnostics
keymap("n", "<leader>db", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Show workspace diagnostics
keymap("n", "<leader>dw","<cmd>Lspsaga show_workspace_diagnostics<CR>")

-- Show cursor diagnostics
keymap("n", "<leader>dc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap("n", "<leader>[", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "<leader>]", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
keymap("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]E", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle outline
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

keymap("n", "<Leader>k", "<cmd>Lspsaga hover_doc ++keep<CR>")

-- Call hierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")

vim.api.nvim_create_autocmd('DiagnosticChanged', {
  callback = function(args) vim.diagnostic.setqflist({ open = false }) end
})

-- この一連の記述で、mason.nvimでインストールしたLanguage Serverが自動的に個別にセットアップされ、利用可能になります
require("mason").setup()
require("mason-lspconfig").setup()
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("mason-lspconfig").setup_handlers {
  function(server_name)   -- default handler (optional)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities
    }
    require("lspconfig").terraformls.setup {
      root_dir = require("lspconfig/util").root_pattern("*.tf"),
    }
    require("lspconfig").tflint.setup {
      root_dir = require("lspconfig/util").root_pattern("*.tf"),
    }
    require('lspconfig').pyright.setup {
      root_dir = require("lspconfig/util").root_pattern(".venv"),
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = 'workspace',
            useLibraryCodeForTypes = true,
            typeCheckingMode = 'basic'
          },
          venvPath = "",
          pythonPath = ""
        }
      }
    }
  end
}

vim.diagnostic.config({ virtual_text = false })

cfg = {
  debug = false,                                              -- set to true to enable debug logging
  log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
  -- default is  ~/.cache/nvim/lsp_signature.log
  verbose = false,                                            -- show debug line number
  bind = true,                                                -- This is mandatory, otherwise border config won't get registered.
  -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 10,                                             -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
  -- set to 0 if you DO NOT want any API comments be shown
  -- This setting only take effect in insert mode, it does not affect signature help in normal
  -- mode, 10 by default

  max_height = 12,                       -- max height of signature floating_window
  max_width = 80,                        -- max_width of signature floating_window
  noice = false,                         -- set to true if you using noice to render markdown
  wrap = true,                           -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
  floating_window = true,                -- show hint in a floating window, set to false for virtual text only mode
  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap

  floating_window_off_x = 1, -- adjust float windows x position.
  -- can be either a number or function
  floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
  -- can be either number or function, see examples

  close_timeout = 4000,                         -- close floating window after ms when laster parameter is entered
  fix_pos = false,                              -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = false,                           -- virtual hint enable
  hint_prefix = "🐼 ",                        -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
  hint_scheme = "String",
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  handler_opts = {
    border = "rounded"                          -- double, rounded, single, shadow, none, or a table of borders
  },
  always_trigger = false,      -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58
  auto_close_after = nil,     -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {"(",","},   -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  zindex = 200,               -- by default it will be on top of all floating windows, set to <= 50 send it to bottom
  padding = '',               -- character to pad on left and right of signature can be ' ', or '|'  etc
  transparency = nil,         -- disabled by default, allow floating win transparent value 1~100
  shadow_blend = 36,          -- if you using shadow as border use this set the opacity
  shadow_guibg = 'Black',     -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  timer_interval = 200,       -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = '<M-h>',       -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
  select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
  move_cursor_key = nil,      -- imap, use nvim_set_current_win to move cursor between current win and floating
}

require 'lsp_signature'.setup(cfg)
