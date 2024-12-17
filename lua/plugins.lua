local packer = require("packer")
packer.startup({
	function(use)
		-- Packer 可以管理自己本身
		use("wbthomason/packer.nvim")
		-- 你的插件列表
		--------------------- colorschemes --------------------
		-- tokyonight
		use("folke/tokyonight.nvim")
		-- OceanicNext
		use("mhartington/oceanic-next")
		-- gruvbox
		use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
		-- nord
		use("shaunsingh/nord.nvim")
		-- onedark
		use("ful1e5/onedark.nvim")
		-------------------------------------------------------
		-- nvim-tree 侧边栏
		use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
		-- bufferline 顶栏
		--use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
		-- lualine 底部信息栏
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use("arkav/lualine-lsp-progress")
		-- telescope
		use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
		use({ "nvim-telescope/telescope-symbols.nvim" })
		-- telescope 插件
		use("LinArcX/telescope-env.nvim")
		-- dashboard-nvim
		use {
			'nvimdev/dashboard-nvim',
			event = 'VimEnter',
			config = function()
				require('dashboard').setup {
					theme = 'hyper',
					config = {
						week_header = {
							enable = true,
						},
						shortcut = {
							--{
							--	icon = ' ',
							--	icon_hl = '@variable',
							--	desc = 'Files',
							--	group = 'Label',
							--	action = 'Telescope find_files',
							--	key = 'f',
							--},
							{
								desc = ' Projects',
								icon_hl = '@variable',
								group = 'DiagnosticHint',
								action = 'Telescope projects',
								key = 'p',
							},
							{
								desc = " Config",
								icon_hl = '@variable',
								group = 'Label',
								action = "edit ~/.config/nvim/init.lua",
								key = 'v',
							},
							{
								desc = " Edit Projects",
								icon_hl = '#DC2626',
								group = 'Label',
								action = "edit ~/.local/share/nvim/project_nvim/project_history",
								key = 'e',
							},
							--{
							--	desc = ' Recently',
							--	group = 'Number',
							--	action = 'Telescope oldfiles',
							--	key = 'r',
							--},
						},
					},

				}
			end,
			requires = { 'nvim-tree/nvim-web-devicons' }
		}
		--	{
		--		icon = ' ',
		--		icon_hl = '@variable',
		--		desc = 'Files',
		--		group = 'Label',
		--		action = 'Telescope find_files',
		--		key = 'f',
		--	},
		--	{
		--		icon = ' ',
		--		icon_hl = '@variable',
		--		decsc = 'Projects',
		--		group = 'Files',
		--		action = 'Telescope projects',
		--		key = 'p',
		--	},
		--	{
		--		icon = " ",
		--		icon_hl = '@variable',
		--		desc = "Recently",
		--		group = 'Label',
		--		action = 'Telescope oldfiles',
		--		key = 'r',
		--	},
		--	{
		--		icon = " ",
		--		icon_hl = '@variable',
		--		desc = "Config",
		--		group = 'Label',
		--		action = "edit ~/.local/nvim/init.lua",
		--		key = 'v',
		--	},

		--	{
		--		icon = " ",
		--		icon_hl = '@variable',
		--		desc = "Edit Projects",
		--		group = 'Label',
		--		action = "edit ~/.local/share/nvim/project_nvim/project_history",
		--		key = 'e',
		--	},
		-- Telescope project插件
		use("ahmedkhalf/project.nvim")
		-- treesitter
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		-- 中文帮助文档
		use({ 'yianwillis/vimcdoc', event = 'VimEnter' })
		-- coc-nvim
		use { 'neoclide/coc.nvim', branch = 'release' }

		-- 开屏小牛
		--use { 'mhinz/vim-startify' }
		-- 浮动终端
		use { 'voldikss/vim-floaterm' }

		-- indent-blankline 缩进提示线
		use("lukas-reineke/indent-blankline.nvim")
		-- 飞雷神
		use('easymotion/vim-easymotion')

		--------------------- Markdown --------------------
		use("ixru/nvim-markdown")
		--use {
		--'renerocksai/telekasten.nvim',
		--requires = { 'nvim-telescope/telescope.nvim' }
		--}
		--
		-------no--use("HiPhish/nvim-ts-rainbow2")
		-- 彩虹括号
		use("HiPhish/rainbow-delimiters.nvim")
		-- markdown
		--use({
		--	"OXY2DEV/markview.nvim",
		--	requires = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons"
		--	}
		--})
		--DAP (Debug Adapter Protocol)
		use 'mfussenegger/nvim-dap'


		use({
			"jackMort/ChatGPT.nvim",
			config = function()
				require("chatgpt").setup {
					api_key_cmd = nil,
					yank_register = "+",
					edit_with_instructions = {
						diff = false,
						keymaps = {
							close = "<C-c>",
							accept = "<C-y>",
							toggle_diff = "<C-z>",
							toggle_settings = "<C-o>",
							toggle_help = "<C-h>",
							cycle_windows = "<C-l>",
							use_output_as_input = "<C-i>",
						},
					},
					chat = {
						welcome_message = WELCOME_MESSAGE,
						loading_text = "Loading, please wait ...",
						question_sign = "", -- 🙂
						answer_sign = "ﮧ", -- 🤖
						border_left_sign = "",
						border_right_sign = "",
						max_line_length = 120,
						sessions_window = {
							active_sign = " ",
							--inactive_sign = " ",
							--
							inactive_sign = " ",
							current_line_sign = " ",
							border = {
								style = "rounded",
								text = {
									top = " Sessions ",
								},
							},
							win_options = {
								winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
							},
						},
						keymaps = {
							close = "<C-c>",
							yank_last = "<C-y>",
							yank_last_code = "<C-k>",
							scroll_up = "<C-u>",
							scroll_down = "<C-d>",
							new_session = "<C-n>",
							cycle_windows = "<C-l>",
							cycle_modes = "<C-x>",
							next_message = "<C-j>",
							prev_message = "<C-k>",
							select_session = "<Space>",
							rename_session = "r",
							delete_session = "d",
							draft_message = "<C-r>",
							edit_message = "e",
							delete_message = "d",
							toggle_settings = "<C-o>",
							toggle_sessions = "<C-p>",
							toggle_help = "<C-h>",
							toggle_message_role = "<C-r>",
							toggle_system_role_open = "<C-s>",
							stop_generating = "<C-x>",
						},
					},
					popup_layout = {
						default = "center",
						center = {
							width = "80%",
							height = "80%",
						},
						right = {
							width = "30%",
							width_settings_open = "50%",
						},
					},
					popup_window = {
						border = {
							highlight = "FloatBorder",
							style = "rounded",
							text = {
								top = " ChatGPT ",
							},
						},
						win_options = {
							wrap = true,
							linebreak = true,
							foldcolumn = "1",
							winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
						},
						buf_options = {
							filetype = "markdown",
						},
					},
					system_window = {
						border = {
							highlight = "FloatBorder",
							style = "rounded",
							text = {
								top = " SYSTEM ",
							},
						},
						win_options = {
							wrap = true,
							linebreak = true,
							foldcolumn = "2",
							winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
						},
					},
					popup_input = {
						prompt = "  ",
						border = {
							highlight = "FloatBorder",
							style = "rounded",
							text = {
								top_align = "center",
								top = " Prompt ",
							},
						},
						win_options = {
							winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
						},
						submit = "<C-Enter>",
						submit_n = "<Enter>",
						max_visible_lines = 20,
					},
					settings_window = {
						setting_sign = "  ",
						border = {
							style = "rounded",
							text = {
								top = " Settings ",
							},
						},
						win_options = {
							winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
						},
					},
					help_window = {
						setting_sign = "  ",
						border = {
							style = "rounded",
							text = {
								top = " Help ",
							},
						},
						win_options = {
							winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
						},
					},
					openai_params = {
						model = "gpt-4o-mini-2024-07-18",
						--model = "o1-mini",
						frequency_penalty = 0,
						presence_penalty = 0,
						max_tokens = 3000,
						temperature = 0,
						top_p = 1,
						n = 1,
					},
					openai_edit_params = {
						model = "gpt-4o-mini-2024-07-18",
						--model = "o1-mini",
						frequency_penalty = 0,
						presence_penalty = 0,
						temperature = 0,
						top_p = 1,
						n = 1,
					},
					use_openai_functions_for_edits = false,
					actions_paths = {},
					show_quickfixes_cmd = "Trouble quickfix",
					predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv",
					highlights = {
						help_key = "@symbol",
						help_description = "@comment",
					},
				}
			end,
			requires = {
				"MunifTanjim/nui.nvim",
				"nvim-lua/plenary.nvim",
				"folke/trouble.nvim",
				"nvim-telescope/telescope.nvim"
			}
		})

		use("lewis6991/gitsigns.nvim")
		use({
			"kdheepak/lazygit.nvim",
			-- optional for floating window border decoration
			requires = {
				"nvim-lua/plenary.nvim",
			},
		})
		use({
			"folke/todo-comments.nvim",
			-- optional for floating window border decoration
			requires = {
				"nvim-lua/plenary.nvim"
			},
		})
		use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })
		use('theHamsta/nvim-dap-virtual-text')
		use 'leoluz/nvim-dap-go'
		use 'mfussenegger/nvim-dap-python'

		--DB
		use {
			"kndndrj/nvim-dbee",
			requires = {
				"MunifTanjim/nui.nvim",
			},
			run = function()
				-- Install tries to automatically detect the install method.
				-- if it fails, try calling it with one of these parameters:
				--    "curl", "wget", "bitsadmin", "go"
				require("dbee").install()
			end,
			config = function()
				require("dbee").setup( --[[optional config]])
			end
		}
		use "tpope/vim-dadbod"
		use 'kristijanhusak/vim-dadbod-ui'
		use 'kristijanhusak/vim-dadbod-completion'



		use "linrongbin16/gentags.nvim"
		-- 显示快捷键
		use { "folke/which-key.nvim" }
		--
		use { "williamboman/mason.nvim" }

		-- 必需的插件
		use 'stevearc/dressing.nvim'
		use 'nvim-lua/plenary.nvim'
		use 'MunifTanjim/nui.nvim'

		-- 可选插件
		use 'hrsh7th/nvim-cmp'
		use 'nvim-tree/nvim-web-devicons' -- 或者用 'echasnovski/mini.icons'
		use 'HakonHarnes/img-clip.nvim'
		use 'zbirenbaum/copilot.lua'

		-- avante.nvim 插件及其配置
		use {
			'yetone/avante.nvim',
			branch = 'main',
			run = 'make',
			config = function()
				require('avante_lib').load()
				require('avante').setup()
			end
		}

		use {
			"Exafunction/codeium.vim",
		}




		--------------------- LSP --------------------
		-- 用于方便安装各类语言LSP服务端
		--use("williamboman/nvim-lsp-installer")
		-- Lspconfig 提供了一堆常用服务的配置
		--use({ "neovim/nvim-lspconfig" })
		-- 补全引擎
		--use("hrsh7th/nvim-cmp")
		-- snippet 引擎
		--use("hrsh7th/vim-vsnip")
		-- 补全源
		--use("hrsh7th/cmp-vsnip")
		--use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
		--use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
		--use("hrsh7th/cmp-path") -- { name = 'path' }
		--use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
		--
		-- 常见编程语言代码段
		--use("rafamadriz/friendly-snippets")
		-- 补全图标
		--use("onsails/lspkind-nvim")
		-- indent-blankline
		--use("lukas-reineke/indent-blankline.nvim")
		-- 格式化
		-- use("mhartington/formatter.nvim")
		--use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

		-- 括号匹配
		--use("jiangmiao/auto-pairs")
		-- 符号对齐
		--use("junegunn/vim-easy-align")
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})

---- 每次保存 plugins.lua 自动安装插件
--pcall(
--	vim.cmd,
--	[[
--	augroup packer_user_config
--	autocmd!
--	autocmd BufWritePost plugins.lua source <afile> | PackerSync
--	augroup end
--  ]]
--)
