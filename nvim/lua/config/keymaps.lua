-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true, noremap = true }

keymap("i", "jk", "<ESC>", opts)
keymap("n", "<ESC>", "<cmd>nohlsearch<CR>", opts)

-- Folds
keymap("n", "zz", "za", opts)

-- Open Diffview mode
-- :window diffthis And close :window diffoff
-- keymap("n", "", rhs, opts)

-- remap ciw | Ciw to blackhole register
-- so that ciw does not override yank
-- keymap("n", "c", '"_c', opts)
-- keymap("n", "C", '"_C', opts)

-- Resize window using <alt> arrow keys
keymap("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

--
keymap("n", "M", vim.diagnostic.open_float)
keymap("n", "<leader>,", ":silent grep ", { silent = false })

-- Don't yank on put
vim.api.nvim_set_keymap("x", "p", 'p<cmd>let @+=@0<CR><cmd>let @"=@0<CR>', opts)

local typescript = require("functions.typescript_typecheck")
vim.keymap.set(
  "n",
  "<leader>xp",
  typescript.pick_tsconfig_and_run,
  { desc = "Choose tsconfig.json and run TypeScript check" }
)

local eslint = require("functions.eslint_quickfix")
vim.keymap.set("n", "<leader>xl", eslint.pick_folder_and_run, { desc = "Choose folder and run ESLint quickfix" })

vim.keymap.set("n", "<leader>qf", function()
  vim.ui.input({ prompt = "Filter quickfix by: " }, function(pattern)
    if pattern and pattern ~= "" then
      local qflist = vim.fn.getqflist()
      local filtered = {}

      for _, item in ipairs(qflist) do
        if string.match(item.text:lower(), pattern:lower()) then
          table.insert(filtered, item)
        end
      end

      vim.fn.setqflist({}, " ", { title = "Filtered: " .. pattern, items = filtered })
      vim.cmd("copen")
      vim.notify(#filtered .. " items after filter '" .. pattern .. "'", vim.log.levels.INFO)
    end
  end)
end, { desc = "Filter quickfix by string" })
