-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
-- Git related
map("n", ";g", "<cmd>Neogit<CR>", { desc = "Neogit" })
map("n", ";d", "<cmd>DiffviewOpen<CR>", { desc = "Diffview" })
map("n", ";x", "<cmd>DiffviewClose<CR>", { desc = "DiffviewClose" })

map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", ";q", LazyVim.ui.bufremove, { desc = "Delete Buffer" })
map("n", ";;", "ZZ", { desc = "Save and Quit" })

map({ "x", "n", "s" }, ";w", "<cmd>up<cr>", { desc = "Save File" })

map("n", ";e", function()
  require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
end, { desc = "Neotree" })
