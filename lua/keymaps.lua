vim.g.mapleader = ","

-- Окна
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Grep
vim.api.nvim_create_user_command("Grep", "silent grep! <args> | redraw! | cwindow", { nargs = "+", complete = "file" })
vim.api.nvim_create_user_command("Ggrep", "silent grep! <args> `git ls-files` | redraw! | cwindow", { nargs = "+" })
vim.keymap.set("n", "<leader>*", ":Ggrep <C-R><C-W><CR>", { noremap = true })

-- Копировать/вставить через системный буфер
vim.keymap.set("v", "<Space>", '"+y', { noremap = true })
vim.keymap.set("n", "<Space>", '"+', { noremap = true })

-- Очистка поиска
vim.keymap.set("n", "<leader><Space>", ":nohlsearch<CR>", { noremap = true })

-- Run code using `make run`
vim.keymap.set("n", "<leader>m", ":w<CR>:!make run<CR>", { noremap = true })
