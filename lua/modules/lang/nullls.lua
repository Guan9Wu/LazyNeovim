local null_ls = require("null-ls")
local cmd = vim.cmd

-- register any number of sources simultaneously
local sources = {
	null_ls.builtins.formatting.clang_format,
	null_ls.builtins.formatting.stylua,
}
_G.formatting = function(bufnr)
	bufnr = tonumber(bufnr) or vim.api.nvim_get_current_buf()

	vim.lsp.buf_request(
		bufnr,
		"textDocument/formatting",
		{ textDocument = { uri = vim.uri_from_bufnr(bufnr) } },
		function(err, res)
			if err then
				local err_msg = type(err) == "string" and err or err.message
				-- you can modify the log message / level (or ignore it completely)
				vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
				return
			end

			-- don't apply results if buffer is unloaded or has been modified
			if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
				return
			end

			if res then
				vim.lsp.util.apply_text_edits(res, bufnr)
				vim.api.nvim_buf_call(bufnr, function()
					cmd("silent noautocmd update")
				end)
			end
		end
	)
end

null_ls.setup({
	-- add your sources / config options here
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			-- wrap in an augroup to prevent duplicate autocmds
			cmd([[
        augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePost <buffer> lua formatting(vim.fn.expand("<abuf>"))
        augroup END
      ]])
		end
	end,
})
