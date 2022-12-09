-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local M = {}

-- local starts_with = require("user.utils").starts_with
local ends_with = require("utils").ends_with

M.setup = function()
  local config_dir = vim.fn.stdpath('config') .. '/lua/conf'
  -- plugins do not need to load, NOTE: no .lua suffix required
  local unload_plugins = {  -- 不加载的插件
    "init", -- we don't need to load init again
--		"project",  -- 无法使用
  }

  local helper_set = {}
  for _, v in pairs(unload_plugins) do
    helper_set[v] = true
  end
  for _, fname in pairs(vim.fn.readdir(config_dir)) do
    if ends_with(fname, ".lua") then
      local cut_suffix_fname = fname:sub(1, #fname - #'.lua')
      if helper_set[cut_suffix_fname] == nil then
        local file = "conf." .. cut_suffix_fname
        local status_ok, _ = pcall(require, file)
        if not status_ok then
          vim.notify('Failed loading ' .. fname, vim.log.levels.ERROR)
        end
      end
    end
  end
end

M.setup()
