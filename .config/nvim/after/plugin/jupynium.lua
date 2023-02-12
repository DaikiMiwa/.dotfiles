require("jupynium").setup({
    use_default_keybindings = false,
    textobjects = {use_default_keybindings = false}
})
vim.keymap.set({ "n", "x" }, "<space>x", "<cmd>JupyniumExecuteSelectedCells<CR>", { buffer = buf_id })
vim.keymap.set({ "n", "x" }, "<space>c", "<cmd>JupyniumClearSelectedCellsOutputs<CR>", { buffer = buf_id })
vim.keymap.set({ "n", "x" }, "<space>S", "<cmd>JupyniumScrollToCell<cr>", { buffer = buf_id })
vim.keymap.set({ "n", "x" }, "<space>T", "<cmd>JupyniumToggleSelectedCellsOutputsScroll<cr>", { buffer = buf_id })
vim.keymap.set({ "n", "x" }, "<space>R", "<cmd>JupyniumStartSync<cr>", { buffer = buf_id })
vim.keymap.set("", "<PageUp>", "<cmd>JupyniumScrollUp<cr>", { buffer = buf_id })
vim.keymap.set("", "<PageDown>", "<cmd>JupyniumScrollDown<cr>", { buffer = buf_id })
