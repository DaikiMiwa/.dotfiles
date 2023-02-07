function Python_path()
    local venv_path = os.getenv("VIRTUAL_ENV")
    if venv_path == nil then
        return '/Users/miwanodaiki/.pyenv/shims/python'
    else
        print(venv_path .. '/bin/python')
        return venv_path .. '/bin/python'
    end
end
require("neotest").setup({
  adapters = {
    require("neotest-python")({
        -- Extra arguments for nvim-dap configuration
        -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
        dap = { justMyCode = true },
        -- Command line arguments for runner
        -- Can also be a function to return dynamic values
        args = {"--log-level", "DEBUG"},
        -- Runner to use. Will use pytest if available by default.
        -- Can be a function to return dynamic value.
        runner = "pytest",
        -- Custom python path for the runner.
        -- Can be a string or a list of strings.
        -- Can also be a function to return dynamic value.
        -- If not provided, the path will be inferred by checking for 
        -- virtual envs in the local directory and for Pipenev/Poetry configs
        python = Python_path()
        -- Returns if a given file path is a test file.
        -- NB: This function is called a lot so don't perform any heavy tasks within it.
    })
  }
})

vim.api.nvim_set_keymap('n', '<leader>t', ':lua require("neotest").summary.toggle()<CR>', {})
