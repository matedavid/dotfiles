vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.undofile = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0 -- set to 0 to default to tabstop value

vim.opt.termguicolors = true

-- Set up diagnostics

vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
})
