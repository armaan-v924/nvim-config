return {
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("venv-selector").setup({
                auto_refresh = true,
            })
        end
    }
}