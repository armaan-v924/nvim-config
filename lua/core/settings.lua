local o, wo, bo = vim.opt, vim.wo, vim.bo

o.termguicolors = true
o.clipboard = "unnamedplus"
o.mouse = "a"
o.updatetime = 200
o.timeoutlen = 400
o.completeopt = "menu,menuone,noselect"
o.splitright = true
o.splitbelow = true
o.ignorecase = true
o.smartcase = true
o.signcolumn = "yes"
o.scrolloff = 6

wo.number = true
wo.relativenumber = false
wo.cursorline = true

o.confirm = true

-- default tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- per language tabs
local ft = vim.api.nvim_create_augroup("ft_indents", { clear = true })
local autocmd = vim.api.nvim_create_autocmd
local function set(opts) for k, v in pairs(opts) do vim.opt_local[k] = v end end

autocmd("FileType", {
    group = ft,
    pattern = { "python" },
    callback = function() set({ expandtab = true, shiftwidth = 4, tabstop = 4, softtabstop = 4 }) end,
})

autocmd("FileType", {
    group = ft,
    pattern = { "javascript", "typescript", "typescriptreact", "javascriptreact", "json", "jsonc", "css", "scss", "html", "lua", "yaml", "markdown" },
    callback = function() set({ expandtab = true, shiftwidth = 2, tabstop = 2, softtabstop = 2 }) end,
})

-- Go: use hard tabs
autocmd("FileType", {
    group = ft,
    pattern = { "go" },
    callback = function() set({ expandtab = false, shiftwidth = 4, tabstop = 4, softtabstop = 4 }) end,
})

-- Makefiles: use hard tabs
autocmd("FileType", {
    group = ft,
    pattern = { "make" },
    callback = function() set({ expandtab = false, shiftwidth = 8, tabstop = 8, softtabstop = 0 }) end,
})

-- show hidden characters
o.list = true
o.listchars = {
    tab = "»·",
    trail = "·",
    extends = "›",
    precedes = "‹",
    nbsp = "␣",
}

-- diagnostics look
vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "● ",
        focusable = false,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        }
    }
})