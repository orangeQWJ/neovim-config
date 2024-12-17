local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

map("i", "<C-f>", "<Right>", opt)
--map("n", "<leader>b", ":Toc<CR>", opt)
map("n", "<leader>f", ":Format<CR>:w<CR>", opt)
-- 在Neovim中按下Ctrl+q时调用外部脚本
--map('i', '<C-j>', '<Esc>:silent! !osascript ~/.config/nvim/apple/simulate_keys.scpt<CR>', opt)

map('n', '<leader>l', ':LazyGit<CR>', opt)

map('n', '<leader>b', ":lua require'dap'.toggle_breakpoint()<CR>", opt)
map('n', '<leader>x', ":lua require'dap'.continue()<CR>", opt)
map('n', 'bs', ":lua require'dap'.step_into()<CR>", opt)
map('n', 'bn', ":lua require'dap'.step_over()<CR>", opt)
map('n', 'bo', ":lua require'dap'.step_out()<CR>", opt)

--DB
-- Open/close/toggle the UI.
map('n', 'eo', ":lua require'dbee'.toggle<CR>", opt)
--require("dbee").open()
--require("dbee").close()
--require("dbee").toggle()
---- Run a query on the currently active connection.
--require("dbee").execute(query)
---- Store the current result to file/buffer/yank-register (see "Getting Started").
--require("dbee").store(format, output, opts)



