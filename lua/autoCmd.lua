vim.cmd [[
augroup MyAutoCmds
    autocmd!
	autocmd TermOpen * :set signcolumn=no
	autocmd BufEnter * if &buftype != 'terminal' | :set signcolumn=yes | endif
    autocmd BufEnter * if &buftype != 'terminal' | :TSBufEnable highlight | endif

augroup END
]]
--autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
-- 仅在 Markdown 文件中设置自动换行
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  command = "setlocal textwidth=80 formatoptions+=t"
})

vim.api.nvim_create_user_command(
  'GoOrganizeImports',
  function()
    vim.fn.CocAction('runCommand', 'editor.action.organizeImport')
  end,
  {}
)
vim.api.nvim_set_keymap('n', '<leader>i', ':call CocAction(\'runCommand\', \'editor.action.organizeImport\')<CR>', {noremap = true, silent = true})
