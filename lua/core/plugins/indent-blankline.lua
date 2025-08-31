return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { char = "│", tab_char = "│" },
            scope = {
                enabled = true,
                show_start = true,
                show_end = false,
            },
            whitespace = { remove_blankline_trail = true },
        }
    }
}