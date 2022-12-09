-- mason mason-lspconfig nvim-lspconfig 顺序不能乱
local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("mason not found!")
  return
end

local status_ok, mason_nvim_dap = pcall(require, "mason-nvim-dap")
if not status_ok then
	vim.notify('mason-nvim-dap not found!')
	return
end

local status_ok, dap = pcall(require, "dap")
if not status_ok then
  vim.notify("dap not found!")
  return
end

mason.setup()

mason_nvim_dap.setup({
	ensure_installed = {"codelldb"},
	automatic_setup = true,
})

mason_nvim_dap.setup_handlers {
	function(source_name)
		-- all sources with no handler get passed here
		-- Keep original functionality of `automatic_setup = true`
		require('mason-nvim-dap.automatic_setup')(source_name)
	end,
	python = function(source_name)
			dap.adapters.python = require 'nvim-dap.dap-python'.adapters
			dap.configurations.python =  require 'nvim-dap.dap-python'.configurations
	end,
}


local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
	vim.api.nvim_command("DapVirtualTextEnable")
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dap.repl.close()
	dapui.close()
	vim.api.nvim_command("DapVirtualTextDisable")
end
dap.listeners.before.event_exited["dapui_config"]     = function()
	dap.repl.close()
	dapui.close()
	vim.api.nvim_command("DapVirtualTextDisable")
end
dap.listeners.before.disconnect["dapui_config"]       = function()
	dap.repl.close()
	dapui.close()
	vim.api.nvim_command("DapVirtualTextDisable")
end


