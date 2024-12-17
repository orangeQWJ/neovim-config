local dap = require('dap')

local dapui = require("dapui")
dapui.setup({})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open({})
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close({})
end


dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close({})
end

require("nvim-dap-virtual-text").setup({
	enabled = false,
	enable_commands = true,
	highlight_changed_variables = true,
	highlight_new_as_changed = false,
	show_stop_reason = true,
	commented = false,
	only_first_definition = true,
	all_references = false,
	filter_references_pattern = '<module',
	--virt_text_pos = 'eol',
	virt_text_pos = 'inline',
	all_frames = false,
	virt_lines = false,
	virt_text_win_col = nil
})



--dap.adapters.gdb = {
--	type = "executable",
--	command = "gdb",
--	args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
--}
--
--dap.adapters.delve = {
--	type = 'server',
--	port = '${port}',
--	executable = {
--		command = 'dlv',
--		args = { 'dap', '-l', '127.0.0.1:${port}' },
--		-- add this if on windows, otherwise server won't open successfully
--		-- detached = false
--	}
--}
--
---- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
--dap.configurations.go = {
--	{
--		type = "delve",
--		name = "Debug",
--		request = "launch",
--		program = "${file}"
--	},
--	{
--		type = "delve",
--		name = "Debug test", -- configuration for debugging test files
--		request = "launch",
--		mode = "test",
--		program = "${file}"
--	},
--	-- works with go.mod packages and sub packages
--	{
--		type = "delve",
--		name = "Debug test (go.mod)",
--		request = "launch",
--		mode = "test",
--		program = "./${relativeFileDirname}"
--	}
--}
require("dap-python").setup("python3")
-- If using the above, then `python -m debugpy --version`
-- must work in the shell
require('dap-go').setup {
	-- Additional dap configurations can be added.
	-- dap_configurations accepts a list of tables where each entry
	-- represents a dap configuration. For more details do:
	-- :help dap-configuration
	dap_configurations = {
		{
			-- Must be "go" or it will be ignored by the plugin
			type = "go",
			name = "Attach remote",
			mode = "remote",
			request = "attach",
		},
	},
	-- delve configurations
	delve = {
		-- the path to the executable dlv which will be used for debugging.
		-- by default, this is the "dlv" executable on your PATH.
		path = "dlv",
		-- time to wait for delve to initialize the debug session.
		-- default to 20 seconds
		initialize_timeout_sec = 20,
		-- a string that defines the port to start delve debugger.
		-- default to string "${port}" which instructs nvim-dap
		-- to start the process in a random available port.
		-- if you set a port in your debug configuration, its value will be
		-- assigned dynamically.
		port = "${port}",
		-- additional args to pass to dlv
		args = {},
		-- the build flags that are passed to delve.
		-- defaults to empty string, but can be used to provide flags
		-- such as "-tags=unit" to make sure the test suite is
		-- compiled during debugging, for example.
		-- passing build flags using args is ineffective, as those are
		-- ignored by delve in dap mode.
		-- avaliable ui interactive function to prompt for arguments get_arguments
		build_flags = {},
		-- whether the dlv process to be created detached or not. there is
		-- an issue on Windows where this needs to be set to false
		-- otherwise the dlv server creation will fail.
		-- avaliable ui interactive function to prompt for build flags: get_build_flags
		detached = vim.fn.has("win32") == 0,
		-- the current working directory to run dlv from, if other than
		-- the current working directory.
		cwd = nil,
	},
	-- options related to running closest test
	tests = {
		-- enables verbosity when running the test.
		verbose = false,
	},
}


local dap_breakpoint_color = {
	breakpoint = {
		ctermbg = 0,
		fg = '#993939',
		--fg = '#DC2626',
		--bg='#31353f',
		bg = nil,
	},
	logpoint = {
		ctermbg = 0,
		fg = '#61afef',
		--bg = '#31353f',
		bg = nil
	},
	stopped = {
		ctermbg = 0,
		--fg = '#98c379',
		fg = '#10B981',
		--bg='#31353f'
		bg = nil
	},
}

vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoint)
vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)

--
-- icon = " ", -- icon used for the sign, and in search results
-- TODO = { icon = " ", color = "info" },
--    HACK = { icon = " ", color = "warning" },
--    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
--    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
--    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
--    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
--   error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
--    warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
--    info = { "DiagnosticInfo", "#2563EB" },
--    hint = { "DiagnosticHint", "#10B981" },
--    default = { "Identifier", "#7C3AED" },
--    test = { "Identifier", "#FF00FF" }
--
local dap_breakpoint = {
	error = {
		text = '',
		--text = ' ',
		texthl = "DapBreakpoint",
		linehl = nil,
		numhl = nil,
	},
	condition = {
		text = '',
		texthl = 'DapBreakpoint',
		linehl = nil,
		numhl = nil,
	},
	rejected = {
		text = "",
		texthl = "DapBreakpoint",
		linehl = nil,
		numhl = nil,
	},
	logpoint = {
		text = '',
		texthl = 'DapLogPoint',
		linehl = nil,
		numhl = nil,
	},
	stopped = {
		--text = '',
		text = ' ',
		texthl = 'DapStopped',
		linehl = nil,
		numhl = nil,
	},
}

vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)


dap.adapters.lldb = {
	--	type : 表示启动调试器的方式， executable 表示由客户端自行启动调试器； server 表示 调试器已经单独启动了，后续客户端只需要将调试请求发送到服务器即可。
	-- command: 表示启动调试器的命令
	-- args: 表示启动调试器的命令行参数
	type = 'executable',
	--command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
	command = '/opt/homebrew/opt/llvm/bin/lldb-dap',
	name = 'lldb'
}


dap.adapters.cppdbg = {
	id = "cppdbg",
	type = 'executable',
	command = "/Users/orange/.local/share/nvim/mason/bin/OpenDebugAD7",
}

dap.configurations.c = {
	{
		name = 'Launch',
		type = 'lldb',
		request = 'launch',
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		args = {},
		--name : 是一个字符串它表示当前配置的名称，你可以理解为一个id
		--type: 使用哪个调试器，跟我们之前配置的 dap.adapters相关
		--request：调试的方式，支持 attach 附加到一个已有的进程或者 launch 启动一个新进程。
		--由于在上一步我们指定由客户端来启动调试器，因此这里应该选择 launch 来启动一个新调试进程
		--program: 需要调试的代码， ${file} 表示当前 buffer 所对应文件
		--pythonPath： 执行该文件需要使用的 python 解析器路径


		-- 💀
		-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
		--
		--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
		--
		-- Otherwise you might get the following error:
		--
		--    Error on launch: Failed to attach to the target process
		--
		-- But you should be aware of the implications:
		-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
		-- runInTerminal = false,
	},
	{
		name = "Attach to process",
		type = "lldb",
		request = "attach",
		pid = function()
			local output = vim.fn.input('Process ID: ')
			return tonumber(output) -- 输入要附加的进程 ID
		end,
		cwd = '${workspaceFolder}', -- 设置为当前工作目录
		stopOnEntry = false,  -- 是否在附加后立即暂停程序
		args = {},            -- 附加后程序的参数（如果有）
	},
	{
		name = "Launch file by cppdbg",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
	},
	{
		name = 'Attach to gdbserver :25501',
		type = 'cppdbg',
		request = 'launch',
		MIMode = 'gdb',
		miDebuggerServerAddress = 'localhost:25501',
		miDebuggerPath = '/opt/homebrew/bin/riscv64-unknown-elf-gdb',
		cwd = '${workspaceFolder}',
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		setupCommands = {
			{
				text = '-enable-pretty-printing',
				description = 'enable pretty printing',
				ignoreFailures = false
			},
		},
	},

}
