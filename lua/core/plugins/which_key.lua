return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            preset = "modern",
            spec = {
                -- groups
                { "<leader>f", group = "Find", icon = "" },
                { "<leader>d", group = "Diagnostics", icon = "" },
                { "<leader>g", group = "Git", icon = "" },
                { "<leader>b", group = "Buffers", icon = "﬘" },
                { "<leader>l", group = "LSP", icon = "" },
                { "<leader>p", group = "Project", icon = "" },
                { "<leader>r", group = "Refactor", icon = "󰛔" },
                { "<leader>t", group = "TODOs", icon = "" },
                { "<leader>s", group = "Search/Replace", icon = "󱐋" },
                { "<leader>z", group = "Folds", icon = "" },
                { "<leader>v", group = "Python", icon = "󰌠" },

                -- basics
                { "<leader>w", desc = "Save file", icon = "󰆓" },
                { "<C-s>", desc = "Save file", icon = "󰆓" },
                { "<leader>x", desc = "Save & quit", icon = "󰗼" },
                { "<leader>q", desc = "Quit", icon = "" },
                { "<leader>Q", desc = "Quit without save", icon = "" },

                { "<leader>y", desc = "Copy to clipboard", icon = "" },
                { "<leader>Y", desc = "Copy line to clipboard", icon = "" },
                { "<C-c>", desc = "Copy to clipboard", icon = "" },

                { "<leader>d", desc = "Delete to clipboard", icon = "" },
                { "<leader>D", desc = "Delete line to clipboard", icon = "" },

                { "<leader>p", desc = "Paste from clipboard", icon = "" },
                { "<leader>P", desc = "Paste before (clipboard)", icon = "" },
                { "<C-v>", desc = "Paste from clipboard", icon = "" },

                { "<C-z>", desc = "Undo", icon = "󰕌" },
                { "<C-y>", desc = "Redo", icon = "󰑖" },

                -- find
                { "<leader>ff", desc = "Find files", icon = "" },
                { "<leader>fg", desc = "Live grep", icon = "" },
                { "<leader>fb", desc = "Find buffers", icon = "﬘" },
                { "<leader>fh", desc = "Help tags", icon = "󰞋" },
                { "<leader>fr", desc = "Recent files", icon = "" },

                -- diagnostics
                { "<leader>e", desc = "Show line diagnostics", icon = "" },
                { "<leader>dn", desc = "Next diagnostic", icon = "" },
                { "<leader>dp", desc = "Prev diagnostic", icon = "" },
                { "<leader>dl", desc = "List diagnostics", icon = "" },

                -- git
                { "<leader>gh", desc = "Preview hunk", icon = "" },
                { "<leader>gb", desc = "Blame line", icon = "" },
                { "<leader>gs", desc = "Stage hunk", icon = "" },
                { "<leader>gu", desc = "Unstage hunk", icon = "" },
                { "<leader>gr", desc = "Reset hunk", icon = "󰕌" },
                { "<leader>gR", desc = "Reset buffer", icon = "󰕌" },
                { "<leader>gd", desc = "Diff this", icon = "" },
                { "<leader>gD", desc = "Diff vs last commit", icon = "" },
                { "<leader>gj", desc = "Next hunk", icon = "" },
                { "<leader>gk", desc = "Prev hunk", icon = "" },

                -- buffers
                { "<leader>bn", desc = "Next buffer", icon = "" },
                { "<leader>bp", desc = "Prev buffer", icon = "" },
                { "<leader>bd", desc = "Delete buffer", icon = "" },
                { "<leader>bD", desc = "Delete all except current", icon = "" },

                -- python
                { "<leader>vs", desc = "Select venv", icon = "󰌠" },

                -- project
                { "<leader>pp", desc = "Switch project", icon = "" },
                { "<leader>ps", desc = "Project session", icon = "" },

                -- todos
                { "<leader>tT", desc = "Search TODOs", icon = "" },
                { "<leader>tt", desc = "List TODOs", icon = "" },

                -- refactor
                { "<leader>rf", desc = "Refactor", icon = "󰛔" },
                { "<leader>ra", desc = "Refactor (prompt)", icon = "󰛔" },
                { "<leader>rr", desc = "Select refactor", icon = "󰛔" },

                -- search/replace
                { "<leader>ss", desc = "Search/Replace project", icon = "󱐋" },
                { "<leader>sw", desc = "Search word", icon = "" },
                { "<leader>sf", desc = "File replace", icon = "" },

                -- folds
                { "zR", desc = "Open all folds", icon = "" },
                { "zM", desc = "Close all folds", icon = "" },
                { "zT", desc = "Toggle fold", icon = "" },
                { "<leader>zz", desc = "Peek fold", icon = "" },

                -- illuminate
                { "]r", desc = "Next reference", icon = "" },
                { "[r", desc = "Prev reference", icon = "" },

                -- LSP buffer local
                { "gd", desc = "Go to definition", icon = "󰌹" },
                { "gD", desc = "Go to declaration", icon = "󰌹" },
                { "gr", desc = "List references", icon = "󰌹" },
                { "gi", desc = "Go to implementation", icon = "󰌹" },
                { "K",  desc = "Hover docs", icon = "󰉺" },
                { "<C-k>", desc = "Signature help", icon = "󰊕" },
                { "<leader>lr", desc = "Rename symbol", icon = "󰑕" },
                { "<leader>la", desc = "Code action", icon = "󰆹" },
                { "<leader>lf", desc = "Format", icon = "󰉼" },
            }
        }
    }
}
