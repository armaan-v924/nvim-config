return {
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
        opts = {
            prompt_funct_return_type = false,
            prompt_func_param_type = false,
            show_success_message = true,
        }
    }
}