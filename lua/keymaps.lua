vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }
-- 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 左右比例控制
map("n", "<leader>,", ":vertical resize -20<CR>", opt)
map("n", "<leader>.", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "<leader>j", ":resize +10<CR>", opt)
map("n", "<leader>k", ":resize -10<CR>", opt)
-- 等比例
map("n", "<leader>=", "<C-w>=", opt)

-- 关闭当前
map("n", ";c", "<C-w>c", opt)
-- 关闭其他
map("n", ";o", "<C-w>o", opt)
-- Mac 下option + hjkl  窗口之间跳转
map("n", "∑", "<C-w>w", opt)
map("n", "˙", "<C-w>h", opt)
map("n", "∆", "<C-w>j", opt)
map("n", "˚", "<C-w>k", opt)
map("n", "¬", "<C-w>l", opt)
-- Mac 下option + hjkl  左右移动
map("i", "˙", "<Left>", opt)
map("i", "∆", "<Down>", opt)
map("i", "˚", "<Up>", opt)
map("i", "¬", "<Right>", opt)
-- Terminal相关
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
-- map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
-- map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
-- map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
-- map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "K", ":move '<-2<CR>gv-gv", opt)
map("v", "J", ":move '>+1<CR>gv-gv", opt)

-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP', opt)

-- 退出
--map("n", "q", ":qa<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "ww", ":w<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)

-- insert 模式下，跳到行首行尾
map("i", "<C-b>", "<ESC>I", opt)
map("i", "<C-e>", "<ESC>A", opt)
-- map("i", "<C-o>", "<ESC>:w<CR>", opt)

-- bufferline
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
--map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找项目
map("n", "<leader>P", ":Telescope projects<CR>", opt)
-- 查找文件 picker
map("n", "<leader>p", ":Telescope find_files<CR>", opt)
-- 全局搜索 
map("n", "<leader>f", ":Telescope live_grep<CR>", opt)


-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
	-- 打开文件或文件夹
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	-- 分屏打开文件
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	-- 显示隐藏文件
	{ key = "i", action = "toggle_ignored" }, -- Ignore (node_modules)
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	-- 文件操作
	{ key = "<F5>", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
}

map('n', '<Leader>b', [[:lua require"dap".toggle_breakpoint()<CR>]], opt)
map('n', '<F5>', [[:lua require"dap".continue()<CR>]], opt)
--map('n', '<s-F5>', [[:lua require'dap'.terminal()<CR>]], opt)
--map('n', '<F17>', [[:lua require'dap'.run_last()<CR>]], opt)
map('n', '<F10>', [[:lua require"dap".step_over()<CR>]], opt)
map('n', '<F11>', [[:lua require"dap".step_into()<CR>]], opt)
map('n', '<s-F11>', [[:lua require"dap"step_out()<CR>]], opt)

--    nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
--    nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
--    nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>



