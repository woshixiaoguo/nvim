-- mason mason-lspconfig nvim-lspconfig 顺序不能乱
local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("mason not found!")
  return
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  vim.notify("mason-lspconfig not found!")
  return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	vim.notiry("lspconfig not found")
	return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

mason_lspconfig.setup({
	ensure_installed = { "sumneko_lua", "rust_analyzer", "gopls", "jsonls", "tsserver", "pyright" },
	automatic_installation = true,
})

mason_lspconfig.setup_handlers {
		-- The first entry (without a key) will be the default handler
		-- and will be called for each installed server that doesn't have
		-- a dedicated handler.
		function (server_name) -- default handler (optional)
				require("lspconfig")[server_name].setup {}
		end,
		-- Next, you can provide a dedicated handler for specific servers.
		-- For example, a handler override for the `rust_analyzer`:
		["sumneko_lua"] = function ()
			lspconfig.sumneko_lua.setup {
				 settings = {
						 Lua = {
								 diagnostics = {
										 globals = { "vim" }
								 }
						 }
				 }
			}
		end,

}

