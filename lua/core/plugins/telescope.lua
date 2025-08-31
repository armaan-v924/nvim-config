return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = "move_selection_next",
                            ["<C-k>"] = "move_selection_previous",
                        }
                    },
                    layout_strategy = "horizontal",
                    layout_config = { prompt_position = "top" },
                    sorting_strategy = "ascending",
                    file_ignore_patterns = { "node_modules", ".git/", "dist/", "target/" },
                },
                pickers = {
                    find_files = { hidden = true, follow = true },
                    live_grep = { additional_args = { "--hidden" } },
                },
            })
            pcall(telescope.load_extension, "fzf")
        end,
    }
}