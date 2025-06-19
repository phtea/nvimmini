-- Цветовая схема
vim.cmd.colorscheme("wildcharm") -- заменим позже, если нужно

-- Поиск и интерфейс
vim.opt.path:append("**")
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Grep
vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.opt.grepformat = "%f:%l:%c:%m"
