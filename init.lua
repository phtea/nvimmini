require("options")
require("keymaps")

vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")
require("lazy").setup("plugins")

require("plugins")
require("cmp_config")
require("lsp")
