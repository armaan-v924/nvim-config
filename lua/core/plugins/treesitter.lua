return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            ensure_installed = {
                "lua", "vim", "vimdoc", "bash", "c", "cpp", "css", "dockerfile", "go", "html",
                "javascript", "json", "jsonc", "lua", "markdown", "markdown_inline", "python",
                "regex", "rust", "scss", "toml", "typescript", "yaml", "tsx",
                "regex", "sql", "svelte", "vue", "gomod", "gowork", "gosum", "http", "gitignore",
            },
            highlight = { enable = true, additional_vim_regex_highlighting = false },
            indent = { enable = true },
            incremental_selection = { enable = true },
        },
        config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
    }
}