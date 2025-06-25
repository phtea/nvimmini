return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2", -- important for v2
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    })

    -- Keymaps (customize as you like)
    local list = harpoon:list()

    vim.keymap.set("n", "<leader>ha", function() list:add() end, { desc = "Harpoon add file" })
    vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(list) end, { desc = "Harpoon menu" })

    vim.keymap.set("n", "<leader>1", function() list:select(1) end, { desc = "Harpoon file 1" })
    vim.keymap.set("n", "<leader>2", function() list:select(2) end, { desc = "Harpoon file 2" })
    vim.keymap.set("n", "<leader>3", function() list:select(3) end, { desc = "Harpoon file 3" })
    vim.keymap.set("n", "<leader>4", function() list:select(4) end, { desc = "Harpoon file 4" })

    vim.api.nvim_set_hl(0, "HarpoonWindow", { link = "NormalFloat" })
    vim.api.nvim_set_hl(0, "HarpoonBorder", { link = "FloatBorder" })

    -- Make NormalFloat transparent
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
  end,
}
