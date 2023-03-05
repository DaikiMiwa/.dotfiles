vim.cmd[[

let g:repl_filetype_commands = { 'javascript': 'node', 'python': 'ipython --no-autoindent', }
]]

vim.keymap.set({ "n" }, "<leader>rt", ":ReplToggle<CR>")
vim.keymap.set({ "n" }, "<leader>rc", ":ReplClose<CR>")

vim.keymap.set({"n", "x"}, "<leader>s", ":ReplSend<CR>", {noremap = false})
