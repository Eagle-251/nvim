-- Create autocommands for relative line numbers
vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave", "WinEnter"}, {
    pattern = "*",
    callback = function()
        if vim.opt.number:get() and vim.fn.mode() ~= "i" then
            vim.opt.relativenumber = true
        end
    end,
})

vim.api.nvim_create_autocmd({"BufLeave", "FocusLost", "InsertEnter", "WinLeave"}, {
    pattern = "*",
    callback = function()
        if vim.opt.number:get() then
            vim.opt.relativenumber = false
        end
    end,
})

-- Create autocommands for Ansible YAML files
local ansible_patterns = {
    "playbook*.yml",
    "*/playbooks/*.yml",
    "*/roles/*.yml",
    "*/inventory/*.yml"
}

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = ansible_patterns,
    callback = function()
        vim.bo.filetype = "yaml.ansible"
    end,
})

