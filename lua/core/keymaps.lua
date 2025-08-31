local M = {}

function M.setup()
    local map = vim.keymap.set

    -- Basics
    map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
    map({"n", "i"}, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })

    map("n", "<leader>x", "<cmd>x<cr>", { desc = "Save and quit" })

    map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
    map("n", "<leader>Q", "<cmd>q!<cr>", { desc = "Quit without saving" })

    map({"n", "v"}, "<leader>y", '"+y', { desc = "Copy to clipboard" })
    map("n", "<leader>Y", '"+Y', { desc = "Copy line to clipboard" })
    map("i", "<C-c>", '<Esc>"+y', { desc = "Copy to clipboard" })

    map({"n", "v"}, "<leader>d", '"+d', { desc = "Delete to clipboard" })
    map("n", "<leader>D", '"+D', { desc = "Delete line to clipboard" })

    map("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
    map("n", "<leader>P", '"+P', { desc = "Paste before from clipboard" })
    map("i", "<C-v>", '<C-r>+', { desc = "Paste from clipboard" })

    map("i", "<C-z>", "<C-o>u", { desc = "Undo" })
    map("i", "<C-y>", "<C-o><C-r>", { desc = "Redo" })

    -- Find (telescope)
    map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
    map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
    map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
    map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
    map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })

    -- Diagnostics
    map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
    map("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
    map("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
    map("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { desc = "List diagnostics" })

    -- Git (gitsigns)
    local gs = function() return require("gitsigns") end
    map("n", "<leader>gh", gs().preview_hunk, { desc = "Preview hunk" })
    map("n", "<leader>gb", gs().blame_line, { desc = "Blame line" })
    map("n", "<leader>gs", gs().stage_hunk, { desc = "Stage hunk" })
    map("n", "<leader>gu", gs().undo_stage_hunk, { desc = "Unstage hunk" })
    map("n", "<leader>gr", gs().reset_hunk, { desc = "Reset hunk" })
    map("n", "<leader>gR", gs().reset_buffer, { desc = "Reset buffer" })
    map("n", "<leader>gd", gs().diffthis, { desc = "Diff this" })
    map("n", "<leader>gD", function() gs().diffthis("~") end, { desc = "Diff this with last commit" })
    map("n", "<leader>gj", function() if vim.wo.diff then return "]c" end return gs().next_hunk() end, { expr = true, desc = "Next hunk" })
    map("n", "<leader>gk", function() if vim.wo.diff then return "[c" end return gs().prev_hunk() end, { expr = true, desc = "Previous hunk" })

    -- Buffers
    map("n", "<leader>bn", "<cmd>bn<cr>", { desc = "Next buffer" })
    map("n", "<leader>bp", "<cmd>bp<cr>", { desc = "Previous buffer" })
    map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete buffer" })
    map("n", "<leader>bD", "<cmd>%bd|e#|bd#<cr>", { desc = "Delete all buffers except current" })

    -- Python (venv)
    map("n", "<leader>vs", "<cmd>VenvSelect<cr>", { desc = "Select Python virtual environment" })

    -- Project / Refactor / TODOs / Spectre / Folds
    local refactor = function() return require("refactoring") end

    map("n", "<leader>pp", "<cmd>Telescope projects<cr>", { desc = "Switch Project" })
    map("n", "<leader>ps", "<cmd>ProjectSession<cr>", { desc = "Project Session" })

    map("n", "<leader>tT", "<cmd>TodoTelescope<cr>", { desc = "Search TODOs" })
    map("n", "<leader>tt", "<cmd>TodoTrouble<cr>", { desc = "List TODOs" })

    map("n", "<leader>rf", refactor().refactor, { desc = "Refactor" })
    map("v", "<leader>rf", function() refactor().refactor({}) end, { desc = "Refactor" })
    map("n", "<leader>ra", function() refactor().refactor({ prompt = true }) end, { desc = "Refactor (with prompt)" })
    map("v", "<leader>ra", function() refactor().refactor({ prompt = true }) end, { desc = "Refactor (with prompt)" })
    map("n", "<leader>rr", refactor().select_refactor, { desc = "Select Refactor" })
    map("v", "<leader>rr", function() refactor().select_refactor() end, { desc = "Select Refactor" })

    local spectre = function() return require("spectre") end
    map("n", "<leader>ss", spectre().open, { desc = "Search/Replace (project)" })
    map("n", "<leader>sw", function() spectre().open_visual({ select_word = true }) end, { desc = "Search word" })
    map("v", "<leader>sw", function() spectre().open_visual() end, { desc = "Search selection" })
    map("n", "<leader>sf", function() spectre().open_file_search() end, { desc = "File replace" })

    map("n", "zR", function() require("ufo").openAllFolds() end, { desc = "Open all folds" })
    map("n", "zM", function() require("ufo").closeAllFolds() end, { desc = "Close all folds" })
    map("n", "zT", function() require("ufo").toggleFold() end, { desc = "Toggle fold" })
    map("n", "<leader>zz", function() require("ufo").peekFoldedLinesUnderCursor() end, { desc = "Peek fold" })

    -- Illuminate: jump between references
    map("n", "]r", function() return require("illuminate").goto_next_reference(false) end, { desc = "Next reference" })
    map("n", "[r", function() return require("illuminate").goto_prev_reference(false) end, { desc = "Previous reference" })
end

-- LSP buffer-local
function M.lsp_on_attach(_, bufnr)
    local map = function(mode, lhs, rhs, desc) vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc }) end
    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gr", vim.lsp.buf.references, "List references")
    map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
    map("n", "K", vim.lsp.buf.hover, "Hover documentation")
    map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
    map("n", "<leader>lr", vim.lsp.buf.rename, "Rename")
    map("n", "<leader>la", vim.lsp.buf.code_action, "Code action")
    map("n", "<leader>lf", function() require("conform").format({ async = true }) end, "Format")
end

return M