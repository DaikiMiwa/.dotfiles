vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- 改行を削除
vim.keymap.set("n", "J", "mzJ`z")

-- みやすく上下移動
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- レジスタを汚さずにペースト
vim.keymap.set("x", "<leader>p", [["_dP]])

-- クリップボードレジスタ(+)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- 現在のカーソル下の文字列を置換する
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- 現在のファイルに実行権限を与える
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- 設定ファイルを開く
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/<CR>")

vim.keymap.set("n", "<leader>td", "<cmd>vs .todo.md<CR>")
