return {
    'lewis6991/gitsigns.nvim',
    config = function()
	require('gitsigns').setup {
	    on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local opts = {buffer = bufnr, noremap = true, silent = true}

		-- Navigation
		vim.keymap.set('n', '<leader>gn', gs.next_hunk, opts)
		vim.keymap.set('n', '<leader>gp', gs.prev_hunk, opts)
		-- Reset hunk
		vim.keymap.set('n', '<leader>gr', gs.reset_hunk, opts)
		-- Preview hunk
		vim.keymap.set('n', '<leader>gp', gs.preview_hunk, opts)
	    end
	}
    end
}
