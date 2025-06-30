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
		vim.keymap.set('n', '<leader>grh', gs.reset_hunk, opts)
		vim.keymap.set('n', '<leader>grb', gs.reset_buffer, opts)
	    end
	}
    end
}
