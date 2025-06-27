return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "polarmutex/git-worktree.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local themes = require("telescope.themes")

    telescope.setup({
      pickers = {
        lsp_references = { initial_mode = "normal" },
        lsp_definitions = { initial_mode = "normal" },
        lsp_type_definitions = { initial_mode = "normal" },
        buffers = { initial_mode = "normal" },
        grep_string = { initial_mode = "normal" },
      },
    })

    telescope.load_extension("git_worktree")

    vim.keymap.set("n", "<leader>fw", function()
      telescope.extensions.git_worktree.git_worktree(themes.get_dropdown({ initial_mode = "normal" }))
    end, { desc = "Switch worktree" })

    -- Remove default LSP keymaps if present
    pcall(vim.keymap.del, "n", "gri")
    pcall(vim.keymap.del, "n", "grr")
    pcall(vim.keymap.del, "x", "gra")
    pcall(vim.keymap.del, "n", "gra")
    pcall(vim.keymap.del, "n", "grn")
    pcall(vim.keymap.del, "n", "gd")

    -- Keymaps
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fF", function() builtin.find_files({ hidden = true }) end, { desc = "Find files (all)" })

    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fG", function() builtin.live_grep({ hidden = true }) end, { desc = "Live grep (all)" })

    vim.keymap.set("n", "<leader>*", function() builtin.grep_string({ search = vim.fn.expand("<cword>") }) end, { desc = "Grep word under cursor" })
    vim.keymap.set("n", "<leader>8", function() builtin.grep_string({ search = vim.fn.expand("<cword>") }) end, { desc = "Grep word under cursor" })

    vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Grep in current file" })

    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
    vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Find references" })
    vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Find definitions" })
    vim.keymap.set("n", "gt", builtin.lsp_type_definitions, { desc = "Find type definitions" })
  end,
}
