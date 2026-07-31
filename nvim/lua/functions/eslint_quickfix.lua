local M = {}

function M.run_eslint_quickfix(folder)
  folder = folder or "."
  local buf = vim.api.nvim_create_buf(false, true)
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "⏳ Running ESLint check..." })

  vim.cmd("botright 1split")
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(win, buf)
  vim.api.nvim_win_set_height(win, 1)
  vim.bo[buf].modifiable = false

  local output = {}
  local cmd = { "npx", "eslint", folder, "--ext", ".js,.jsx,.ts,.tsx", "--format", "unix" }

  vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data)
      if data then
        vim.list_extend(output, data)
      end
    end,
    on_stderr = function(_, data)
      if data then
        vim.list_extend(output, data)
      end
    end,
    on_exit = function(_, code)
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end

      local items = {}
      for _, line in ipairs(output) do
        -- ESLint unix format: filename:line:col: message
        local filename, lnum, col, message = line:match("^(.-):(%d+):(%d+):%s*(.+)$")
        if filename and lnum then
          filename = vim.trim(filename)
          local absolute_path = vim.fn.fnamemodify(filename, ":p")
          table.insert(items, {
            filename = absolute_path,
            lnum = tonumber(lnum),
            col = tonumber(col),
            text = message,
          })
        end
      end

      vim.fn.setqflist({}, " ", { title = "ESLint Quickfix", items = items })

      if code == 0 then
        vim.notify("ESLint check passed! ✨", vim.log.levels.INFO)
      else
        vim.schedule(function()
          vim.cmd("Trouble quickfix")
          vim.keymap.set("n", "<Esc>", function()
            vim.cmd("Trouble quickfix close")
            vim.keymap.del("n", "<Esc>")
          end, { silent = true, desc = "Close ESLint Trouble" })
        end)
      end
    end,
  })
end

function M.pick_folder_and_run()
  local folders = { ".", "./src", "./src/components", "./src/navigation" } -- Customize for your project
  vim.ui.select(folders, { prompt = "Choose folder to ESLint:" }, function(choice)
    if choice then
      M.run_eslint_quickfix(choice)
    else
      vim.notify("Cancelled ESLint selection.", vim.log.levels.WARN)
    end
  end)
end

return M
