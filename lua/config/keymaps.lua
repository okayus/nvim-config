-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>fd", function()
  require("snacks").picker.files({ cwd = vim.fn.expand("~/obsidian-memo/Diary") })
end, { desc = "Find Diary" })

vim.keymap.set("n", "<leader>fo", function()
  require("snacks").picker.files({ cwd = vim.fn.expand("~/obsidian-memo") })
end, { desc = "Find Obsidian" })

vim.keymap.set("i", ";dd", function()
  return vim.fn.strftime("%Y-%m-%d")
end, { expr = true, desc = "Insert date (YYYY-MM-DD)" })

vim.keymap.set("i", ";tt", function()
  return vim.fn.strftime("- %H:%M ")
end, { expr = true, desc = "Insert timestamped bullet" })

vim.keymap.set("i", ";dh", function()
  return vim.fn.strftime("## %Y-%m-%d")
end, { expr = true, desc = "Insert date H2 header" })

vim.keymap.set("i", ";nd", function()
  return vim.fn.strftime("\n## %Y-%m-%d\n\n- %H:%M ")
end, { expr = true, desc = "Start new day section" })
