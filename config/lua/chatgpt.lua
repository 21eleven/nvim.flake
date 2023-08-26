vim.api.nvim_create_user_command('StartChatGpt',
  function()
    local openai_api = vim.fn.expand('~/bin/openai-api.sh')
    if vim.fn.filereadable(openai_api) then
      require("chatgpt").setup({
        api_key_cmd = openai_api
      })
    else
      vim.api.nvim_err_writeln(openai_api .. "not present")
    end
  end, {}
)



    -- <C-Enter> [Both] to submit.
    -- <C-y> [Both] to copy/yank last answer.
    -- <C-o> [Both] Toggle settings window.
    -- <Tab> [Both] Cycle over windows.
    -- <C-f> [Chat] Cycle over modes (center, stick to right).
    -- <C-c> [Both] to close chat window.
    -- <C-u> [Chat] scroll up chat window.
    -- <C-d> [Chat] scroll down chat window.
    -- <C-k> [Chat] to copy/yank code from last answer.
    -- <C-n> [Chat] Start new session.
    -- <C-d> [Chat] draft message (create message without submitting it to server)
    -- <C-r> [Chat] switch role (switch between user and assistant role to define a workflow)
    -- <C-s> [Both] Toggle system message window.
    -- <C-i> [Edit Window] use response as input.
    -- <C-d> [Edit Window] view the diff between left and right panes and use diff-mode commands
