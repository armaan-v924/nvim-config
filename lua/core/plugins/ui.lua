return {
    {
        "rcarriga/nvim-notify",
        config = function()
            local ok, notify = pcall(require, "notify")
            if ok then vim.notify = notify end
        end
    },
    {
        "folke/trouble.nvim", opts = {}
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                theme = "auto",
                section_separators = "",
                component_separators = "",
            }
        }
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        opts = {}
    }
}