
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  vim.notify("telescope not found!")
  return
end

telescope.setup {
  defaults = {

  },
  pickers = {
    find_files = {
      theme = "dropdown",
			previewer = false,  -- 搜索文件时的预览
    }
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
}

--telescope.extensions.projects.projects{}

telescope.load_extension('fzf')
-- telescope.load_extension("frecency")
-- telescope.load_extension('dap')
-- telescope.load_extension('vim_bookmarks')
-- load project extension. see project.lua file
