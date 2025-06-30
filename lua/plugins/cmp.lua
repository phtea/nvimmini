return {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    opts = {
	signature = {
	    enabled = true,
	    window = { show_documentation = true, },
	},

	cmdline = { enabled = false, }, -- disable in command mode!!

	completion = {
	    documentation = { auto_show = true, auto_show_delay_ms = 100, },
	}
    },
}
