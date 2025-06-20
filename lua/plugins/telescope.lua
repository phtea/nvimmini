-- Telescope
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local themes = require("telescope.themes")

    telescope.setup({
      pickers = {
        lsp_references = { initial_mode = "normal" },
      },
    })

    -- Remove default LSP keymaps if present
    pcall(vim.keymap.del, "n", "gri")
    pcall(vim.keymap.del, "n", "grr")
    pcall(vim.keymap.del, "x", "gra")
    pcall(vim.keymap.del, "n", "gra")
    pcall(vim.keymap.del, "n", "grn")
    pcall(vim.keymap.del, "n", "gd")

    -- Keymaps
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Find references" })
    vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Find definitions" })
  end,
}
