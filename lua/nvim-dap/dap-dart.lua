local status_ok, dap = pcall(require, "dap")
if not status_ok then
  vim.notify("dap not found!")
  return
end

dap.configurations.dart = {
  {
    type = 'dart',
    request = 'launch',
    name = "launch file",
		program = "${file}",
		dartPath = function()
			return '/opt/homebrew/bin/dart'
		end;
  }
}

dap.adapters.dart = {
	type = 'executable',
	command = '/opt/homebrew/bin/dart',
	args = { }
}
