local map = require("mappings.utils").map
local nmap = require("mappings.utils").nmap

-- EasyAlign
map("v", "<leader>e", ":EasyAlign<CR>")

-- nvim-tree
nmap(";d", ":NvimTreeToggle<CR>")

-- yank file path
map("n", "yu", [[vim.api.nvim_buf_get_name(0)]])

-- fterm
nmap("<C-\\>", [[:ToggleTerm direction=float<CR>]])
nmap("<C-s>", [[:ToggleTerm direction=horizontal<CR>]])
map("t", "<C-\\>", [[<C-\><C-n>:ToggleTerm<CR>]])
map("t", "<C-n>", [[<C-\><C-n>]])
-- This for horizontal terminal
map("t", "<C-k>", [[<C-\><C-n><C-w>k]])
-- This for vertical terminal
map("t", "<C-h>", [[<C-\><C-n><C-w>h]])

-- telescope
nmap(";c", function()
  require("telescope.builtin").find_files()
end)
nmap("<leader>l", function()
  require('telescope').extensions.frecency.frecency()
end)
nmap(";l", function()
  require("telescope.builtin").oldfiles()
end)
nmap(";f", function()
  require("telescope.builtin").git_files()
end)
nmap(";j", function()
  require("telescope.builtin").live_grep()
end)
nmap("<leader><leader>", function()
  require("telescope.command").load_command(nil, nil, nil, "builtin", "theme=ivy")
end)

-- Markdown preview
nmap("<leader>m", [[ZQ]])

-- fugitive
-- keep the same prefix as the git sign
-- See git-sign keymap in lua/plugins/config/gitsign_cfg.lua
nmap("<leader>cc", ":Git commit -sS<CR>")
nmap("<leader>gp", ":Git pu", { silent = false })
nmap(";gg", [[<CMD>Git<CR>]])
nmap(";gc", [[<CMD>GlogS<CR>]])
nmap(";gb", [[<CMD>Git blame --no-line-porcelain<CR>]])

-- dispatch
nmap(";x", ":Dispatch ", { noremap = true, silent = false })
