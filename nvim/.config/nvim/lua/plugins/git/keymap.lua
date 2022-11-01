local nmap = require("editor.utils").nmap

-- fugitive
-- keep the same prefix as the git sign
-- See git-sign keymap in lua/plugins/config/gitsign_cfg.lua
nmap("gic", ":Git commit -sS<CR>")
nmap("giP", ":Dispatch! git push ", { silent = false })
nmap(";gg", [[<CMD>Git<CR>]])
nmap(";gf", [[<CMD>Git branch<CR>]])
nmap(";gb", [[<CMD>GBrowse<CR>]])
nmap(";gB", [[<CMD>Git blame<CR>]])
nmap(";gc", [[<CMD>Flogsplit<CR>]])
nmap("<leader>gp", ":Git pu", { silent = false })

-- lazygit
nmap("<LEADER>l", [[<CMD>LazyGit<CR>]])
