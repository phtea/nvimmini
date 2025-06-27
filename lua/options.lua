-- Colorscheme
vim.cmd.colorscheme("wildcharm")

-- Search and interface
vim.opt.path:append("**")
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Grep
vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.opt.grepformat = "%f:%l:%c:%m"

-- Enable persistent undo
vim.opt.undofile = true

-- Set undo directory
local undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undodir = undodir

-- Auto-create the undo directory if it doesn't exist
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end
