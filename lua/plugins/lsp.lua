return {
    "neovim/nvim-lspconfig",
    config = function()
	local lspconfig = require('lspconfig')
	lspconfig.pyright.setup{}
	lspconfig.solargraph.setup{}
	-- lspconfig.ruby_lsp.setup{}
	lspconfig.clangd.setup{}

	vim.api.nvim_create_autocmd("LspAttach", {
	    callback = function(ev)
		local opts = { buffer = ev.buf }
		-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>fmt", vim.lsp.buf.format, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	    end,
	})

	-- Off by default
	vim.diagnostic.enable(false, …)

	-- Toggle Lsp diagnostics
	local diagnostics_enabled = false

	vim.api.nvim_create_user_command("LspToggleDiagnostic", function()
	    diagnostics_enabled = not diagnostics_enabled

	    if diagnostics_enabled then
		vim.diagnostic.enable(true)
		vim.diagnostic.config({
		    virtual_text = false,
		    virtual_lines = true,
		})
		print("✅ LSP diagnostics enabled (virtual lines)")
	    else
		vim.diagnostic.enable(false)
		print("🚫 LSP diagnostics disabled")
	    end
	end, {})
    end,
}
