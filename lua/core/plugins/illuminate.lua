return {
    {
        "RRethy/vim-illuminate",
        config = function()
            require("illuminate").configure({
                delay = 120,
                filetypes_denylist = { "NvimTree", "neo-tree", "TelescopePrompt", "lazy", "mason" },
                modes_denylist = { "v", "V", "\22" },
            })
        end,
    }
}