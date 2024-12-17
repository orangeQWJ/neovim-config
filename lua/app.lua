local function speakWord()
    local word = vim.fn.expand('<cword>')
    local cmd = 'trans'
    local args = {'-sp', ':zh', vim.fn.shellescape(word, true)}

    -- 使用 vim.loop.spawn 来异步执行命令
    vim.loop.spawn(cmd, {
        args = args,
        stdio = {nil, nil, nil}  -- 可以通过这里控制 stdout, stderr 的输出
    }, function(code, signal)
        -- 这个回调函数会在命令执行完成后调用
        -- code 是进程退出码，signal 是结束信号
        if code == 0 then
            print("Translation and speech done successfully.")
        else
            print("Failed with exit code " .. code .. " and signal " .. signal)
        end
    end)
end

-- 设置键位映射，将 <leader>d 映射到 speakWord 函数
vim.keymap.set('n', '<leader>d', speakWord, {desc = "Translate and speak word under cursor"})
