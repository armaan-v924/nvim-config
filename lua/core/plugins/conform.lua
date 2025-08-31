return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        opts = {
            format_on_sve = {
                timeout_ms = 1000,
                lsp_fallback = true,
            },
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black", "isort" },
                javascript = { "prettierd" },
                typescript = { "prettierd" },
                typescriptreact = { "prettierd" },
                javascriptreact = { "prettierd" },
                json = { "prettierd" },
                jsonc = { "prettierd" },
                css = { "prettierd" },
                scss = { "prettierd" },
                html = { "prettierd" },
                markdown = { "prettierd" },
                yaml = { "prettierd" },
                go = { "gofumpt", "goimports" },
                rust = { "rustfmt" },
                sh = { "shfmt" },
            },
        },
        config = function(_, opts) require("conform").setup(opts) end,
    }
}