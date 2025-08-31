return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {
            lsp = {
                hover = { enabled = true },
                signature = { enabled = true },
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
                progress = { enabled = true },
            },
            presets = {
                lsp_doc_border = true,
            },
            views = {
                hover = { border = { style = "rounded" }, size = { max_width = 80 } },
                mini = { timeout = 2000 },
                cmdline_popup = { border = { style = "rounded" } },
                popupmenu = { border = { style = "rounded" } },
                diagnostic = { border = { style = "rounded" }, position = { row = 2, col = 2 } },
            }
        }
    }
}