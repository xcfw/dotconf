local utils = require("mappings.utils")
local map = utils.map
local nmap = utils.nmap
local xmap = utils.xmap
local d = utils.new_desc

vim.g.mapleader = " "

-- load plugin's keymapping
require("mappings.other")

-- quicker motion
nmap("J", "8j", d("Jump 5 lines down"))
xmap("J", "8j", d("Jump 5 lines down"))

nmap("K", "8k", d("Jump 5 lines up"))
xmap("K", "8k", d("Jump 5 lines up"))

nmap("L", "g_", d("Jump to the end of the character"))
nmap("H", "^", d("Jump to the beginning of the character"))

xmap("L", "g_", d("Jump to the end of the character"))
xmap("H", "^", d("Jump to the beginning of the character"))

nmap("W", "5w", d("Jump 5 word forward"))
nmap("B", "5b", d("Jump 5 word backward"))

-- no more background key
nmap("<C-z>", "u", d("Revert change"))

-- move block easily
nmap("<", "<<", d("Decrease indent"))
nmap(">", ">>", d("Increase indent"))
xmap("<", "<gv", d("Increase indent"))
xmap(">", ">gv", d("Decrease indent"))

-- create tab like window
nmap("<S-Tab>", ":bprevious<CR>", d("Goto previous tab"))
nmap("<leader><Tab>", ":bnext<CR>", d("Goto next tab"))
nmap("<C-n>", ":tabnext<CR>", d("Next tab"))
nmap("<C-q>", ":tabclose<CR>", d("Close a tab"))

-- source current config file
nmap(";r", [[<CMD>so %<CR>]])

-- quit buffer
nmap(";;", [[ZZ]])

-- save quickly
nmap(";w", ":update<CR>", d("Save buffer"))

-- kill buffer with ;q , quit window with :q . This make sense.
nmap(";q", require("plugins.bufdel").delete_buffer)

-- do thing like ctrl c and ctrl v
xmap("<C-y>", [["+y]], d("Copy to system clipboard"))
nmap("<C-p>", [["+p]], d("Paste from system clipboard"))
map("i", "<C-p>", [[<ESC>"+pa]], d("Paste from system clipboard"))

-- shut down the search high light
nmap("<ESC>", ":nohlsearch<CR>", d("Close search highlight"))
-- no more finger expansion
map("i", "<A-;>", "<ESC>", d("Exit the insert mode"))

-- move around the window
nmap("<C-k>", "<C-w>k", d("Jump to window above"))
nmap("<C-j>", "<C-w>j", d("Jump to window below"))
nmap("<C-l>", "<C-w>l", d("Jump to the left window"))
nmap("<C-h>", "<C-w>h", d("Jump to the righ window"))

-- resize the window
nmap("<C-S-up>", ":res +5<CR>", d("Extend the upper boundary of the current window"))
nmap("<C-S-down>", ":res -5<CR>", d("Extend the lower boundary of the current window"))
nmap("<C-S-right>", ":vertical resize-5<CR>", d("Extend the right boundary of the current window"))
nmap("<C-S-left>", ":vertical resize+5<CR>", d("Extend the right boundary of the current window"))

-- center editing line
map("i", "<C-c>", "<ESC>zzi", d("Place the current line to the middle of the screen"))
