return {
    {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
	    require("nvim-treesitter.configs").setup {
		ensure_installed = {
		    "lua", "python", "bash", "vim", "javascript", "typescript", "json", "yaml", "markdown", "ruby"
		},
		highlight = {
		    enable = true,
		    additional_vim_regex_highlighting = false,
		},
		indent = {
		    enable = true,
		},
	    }
	end,
    },
    {
	"nvim-treesitter/nvim-treesitter-context",
	event = "BufReadPre",
	config = function()
	    require("treesitter-context").setup {
		enable = true,
		max_lines = 10,
		trim_scope = "outer",
		min_window_height = 0,
	    }
	end,
    },
}
