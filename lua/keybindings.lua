vim.g.mapleader = " "
vim.g.maplocalleader = " "

--------------------------------------------------------------------------------
-- 为了配置更清晰干练
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

--------------------------------------------------------------------------------

map("n", "<leader>ee", ":source $MYVIMRC<CR>", { silent = true, noremap = true })

--------------------------------------------------------------------------------
-- 插件无关快捷键配置
map("n", "s", "", opt)
-- 选中代码后上下移动代码
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- Terminal相关
map("n", "<leader>t", ":sp | set nonumber | set signcolumn=no | terminal <CR>i", opt)
map("n", "<leader>ct", ":sp | set nonumber | set signcolumn=no | execute 'lcd ' . expand('%:p:h') . ' | terminal' <CR>i",
	opt)
map("n", "<leader>vt", ":vsp | set nonumber  | set signcolumn=no | terminal <CR>i", opt)
map("n", "<leader>vct",
	":vsp | set nonumber | set signcolumn=no | execute 'lcd ' . expand('%:p:h') . ' | terminal' <CR>i", opt)

--map("t", "<C-k>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<C-w>h", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<C-w>l", [[ <C-\><C-N><C-w>l ]], opt)
map("t", "<C-w>j", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<C-w>k", [[ <C-\><C-N><C-w>k ]], opt)
map('t', '<C-n>', "<Tab>", opt)

-- 上下滚动浏览
map("n", "<C-j>", "6j", opt)
map("n", "<C-k>", "6k", opt)

-- 左右比例控制
map("n", "sh", ":vertical resize -5<CR>", opt)
map("n", "sl", ":vertical resize +5<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +5<CR>", opt)
map("n", "sk", ":resize -5<CR>", opt)

-- 个人偏好
map('i', '<C-f>', "<Right>", opt)
map('i', '<C-s>', "<Left>", opt)
map('i', '<C-b>', "<Left>", opt)
map("i", "<C-e>", "<ESC>A", opt)
map("i", "<C-a>", "<ESC>I", opt)

-- 复制当前buffer中的内容到系统剪贴板
map('n', '<leader>y', ':%y+<CR>', opt)
map("n", "<leader>0", ":vsplit hint.md <CR>", opt)
map('n', '<leader>9', [[:lua OpenMdFile()<CR>]], opt)
-- 定义 OpenMdFile 函数
function OpenMdFile()
	-- 获取当前文件的完整路径
	local current_file_path = vim.fn.expand('%:p')
	-- 获取当前文件的目录路径
	local current_file_dir = vim.fn.expand('%:p:h')
	-- 获取当前文件的名字（不包括扩展名）
	local current_file_name = vim.fn.expand('%:t:r')
	-- 生成新的文件路径
	local new_file_path = current_file_dir .. '/' .. current_file_name .. '.md'
	-- 打开新的文件
	vim.cmd('vsplit ' .. new_file_path)
end

--------------------------------------------------------------------------------
--插件相关配置

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- <leader> + m 键打开关闭tree
map("n", "<leader>m", ":NvimTreeToggle<CR>", opt)
--map("n", "<leader>wf", ":NvimTreeFindFileToggle<CR>", opt)
map("n", "<leader>wf", ":NvimTreeFindFile<CR>", opt)
-- Telescope
-- 查找文件
map("n", "<leader><C-f>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<leader><C-g>", ":Telescope live_grep<CR>", opt)
-- buf搜索
map("n", "<leader><C-b>", ":Telescope current_buffer_fuzzy_find<CR>", opt)
-- 符号
map("n", "<leader><C-d>", ":Telescope treesitter<CR>", opt)
-- 搜索project
map("n", "<leader><C-p>", ":Telescope projects<CR>", opt)
-- 搜索符号
map("n", "<leader><C-s>", ":Telescope symbols<CR>", opt)
-- 查看打开的buffer
map("n", "<leader><C-o>", ":Telescope buffers<CR>", opt)
-- 查看git文件状态变更
map("n", "<leader>gs", ":Telescope git_status<CR>", opt)
-- 查看git提交记录
map("n", "<leader>gc", ":Telescope git_commits<CR>", opt)
-- 查看 mark 
map("n", "<leader><C-m>", ":Telescope marks<CR>", opt)
-- 查看剪贴板
map("n", "<leader><C-r>", ":Telescope registers<CR>", opt)
-- TODO list
map("n", "<leader><C-t>", ":TodoTelescope<CR>", opt)

pluginKeys.telescopeList = {
	i = {
		-- 上下移动
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
		-- 历史记录
		["<C-n>"] = "cycle_history_next",
		["<C-p>"] = "cycle_history_prev",
		-- 关闭窗口
		["<C-c>"] = "close",
		-- 预览窗口上下滚动
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}

-- 悬浮终端快捷键

vim.g.floaterm_position = "topright"
vim.g.floaterm_width = 0.4
vim.g.floaterm_height = 0.85
--vim.g.floaterm_title = " 🤖 $1|$2)"
vim.g.floaterm_title = "$1|$2"


map("t", "<C-i>h", [[<C-\><C-N> :FloatermHide <CR>]], opt)
map("t", "<C-i>p", [[<C-\><C-N> :FloatermPrev <CR>]], opt)
map("t", "<C-i>n", [[<C-\><C-N> :FloatermNext <CR>]], opt)
map("t", "<C-i>x", [[<C-\><C-N> :FloatermKill <CR>]], opt)
map("t", "<C-i>c", [[<C-\><C-N> :FloatermNew <CR>]], opt)

map("n", "<leader>1", ":FloatermNew nvim %:p <CR>", opt)
map("n", "<leader>2", ":FloatermNew <CR>", opt)
map("n", "<leader>3", ":FloatermShow <CR>", opt)

--GPT
map("n", "<leader>gt", ":ChatGPT <CR>", opt)
map("n", "<leader>ge", ":ChatGPTEditWithInstructions <CR>", opt)
map("v", "<leader>ge", ":ChatGPTEditWithInstructions <CR>", opt)


--g? 查看案件映射
---- 列表快捷键
--pluginKeys.nvimTreeList = {
--	-- 打开文件或文件夹
--	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
--	-- 分屏打开文件
--	{ key = "v",                              action = "vsplit" },
--	{ key = "h",                              action = "split" },
--	-- 显示隐藏文件
--	--{ key = "i",                              action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
--	{ key = ".",                              action = "toggle_dotfiles" }, -- Hide (dotfiles)
--	-- 文件操作
--	{ key = "<F5>",                           action = "refresh" },
--	{ key = "a",                              action = "create" },
--	{ key = "d",                              action = "remove" },
--	{ key = "r",                              action = "rename" },
--	{ key = "x",                              action = "cut" },
--	{ key = "y",                              action = "copy" },
--	{ key = "p",                              action = "paste" },
--	{ key = "s",                              action = "system_open" },
--}
return pluginKeys
