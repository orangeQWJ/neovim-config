--- 基础设置
require("basic")
-- 快捷键设置
require("keybindings")
-- 插件管理
require("plugins")
-- 主题设置
require("colorscheme")
-- 配置侧边栏目录树
require("plugin-config.nvim-tree")
-- 底部状态栏设置
require("plugin-config.lualine")
-- 模糊查找
require("plugin-config.telescope")
-- 更好的语法增强
require("plugin-config.nvim-treesitter")
-- rainbow
--require("plugin-config.rainbow")
-- 缩进提示线
require("plugin-config.indent-blankline")
--neorim-markdown
require("plugin-config.neovim-markdown")
-- 补全coc.nvim
require("coc")
-- 一些自动命令
require("autoCmd")
-- 自制插件
require("app")
-- 尝试性键位绑定
require("temp_keybind")
-- gitsigns
require("plugin-config.gitsigns")
-- rainbow
--require("plugin-config.rainbow")
-- 开屏导航
--require("plugin-config.dashboard")
-- 项目插件
require("plugin-config.project")
-- 添加标签栏
--require("plugin-config.bufferline")
require("keybindings")
--vim.o.foldlevel = 99
require("plugin-config.todo")
require("plugin-config.chatgpt")
require("plugin-config.dap")

require("avante_lib").load()
require("avante").setup()


if vim.g.neovide then
	vim.o.guifont = "AnonymicePro Nerd Font:h18"
	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_refresh_rate_idle = 5

	vim.g.neovide_profiler = false
	vim.g.neovide_fullscreen = true


	--vim.g.neovide_cursor_vfx_molde = "railgun"
	--vim.g.neovide_cursor_vfx_mode = "torpedo"
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
	vim.g.neovide_hide_mouse_when_typing = true

end

require("which-key").setup({})
require("mason").setup()
