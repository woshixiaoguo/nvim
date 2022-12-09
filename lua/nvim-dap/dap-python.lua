local M = {}

M.adapters = {
  type = "executable",
  command = "/opt/homebrew/bin/python3",
  args = { "-m", "debugpy.adapter" },
}

M.configurations = {
  -- launch exe
  {
    type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = "launch",
    name = "Launch file",
    program = "${file}", -- This configuration will launch the current file if used.
		pythonPath = function()
			local venv_path = os.getenv("VIRTUAL_ENV")
      if venv_path then
        return venv_path .. "/bin/python"
      end
			return '/opt/homebrew/bin/python3'
		end;
	}
}

return M
