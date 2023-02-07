local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files(require('telescope.themes').get_dropdown({}))
end)
vim.keymap.set('n', '<leader>g', function()
    builtin.git_files(require('telescope.themes').get_dropdown({}))
end)
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({
        search = vim.fn.input("Grep > "),
        require('telescope.themes').get_dropdown({})
    });
end)
vim.keymap.set('n', 'gr', function()
    builtin.lsp_references({require('telescope.themes').get_dropdown({})});
end)
