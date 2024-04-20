local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

local WhichKeyOpts = require("helper.util").WhichKeyOpts

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
	local signs = {

		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false, -- disable virtual text
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_keymaps(bufnr)
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", WhichKeyOpts("Goto Declaration"))
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", WhichKeyOpts("Goto Definition"))
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", WhichKeyOpts("Hover"))
	keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", WhichKeyOpts("Goto Implementation"))
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", WhichKeyOpts("Goto Reference"))
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", WhichKeyOpts("Diagnostic"))
	keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", WhichKeyOpts("Format"))
	keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", WhichKeyOpts("LspInfo"))
	keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", WhichKeyOpts("LspInstallInfo"))
	keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", WhichKeyOpts("Code Action"))
	keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", WhichKeyOpts("Goto Next"))
	keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", WhichKeyOpts("Goto Previous"))
	keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", WhichKeyOpts("Rename"))
	keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", WhichKeyOpts("Signature Help"))
end

M.on_attach = function(client, bufnr)
	if client.name == "lua_ls" then
		client.server_capabilities.documentFormattingProvider = false
	end

	lsp_keymaps(bufnr)
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

M.settings = function(client)
	local settings = {}
	if client.name == "pyright" then
		settings = {
			pyright = {
				autoImportCompletion = true,},
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = 'openFilesOnly',
						useLibraryCodeForTypes = true,
						typeCheckingMode = 'off',
					}}}
	end
	return settings
end

return M