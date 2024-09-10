-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

-- disable comment on new line
vim.api.nvim_create_autocmd("BufEnter", {
	group = augroup("no_nl_comment"),
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- Telling the LSP server the capability of FoldingRange
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true
}

local lang_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(lang_servers) do
		require('lspconfig')[ls].setup({
				capabilities = capabilities
				-- you can add other fields for setting up lsp server in this table
		})
end

require("lspconfig").clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

-- Disable inlay hints in insert mode
vim.api.nvim_create_autocmd({ "LspAttach", "InsertEnter", "InsertLeave" }, {
       callback = function(args)
         local enabled = args.event ~= "InsertEnter"
         vim.lsp.inlay_hint.enable(enabled, { bufnr = args.buf })
       end,
})
