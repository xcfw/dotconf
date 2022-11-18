local utils = require("editor.utils")
local map = utils.map
local nmap = utils.nmap
local xmap = utils.xmap
local d = utils.new_desc

vim.g.mapleader = " "

-- quicker motion
nmap("J", "5j", d("Jump 5 lines down"))
xmap("J", "5j", d("Jump 5 lines down"))

nmap("K", "5k", d("Jump 5 lines up"))
xmap("K", "5k", d("Jump 5 lines up"))

map("i", "<C-h>", "<Home>")
map("i", "<C-e>", "<End>")
map("i", "<C-b>", "<ESC>bi")
map("i", "<C-f>", "<ESC>wa")

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
nmap("<C-T>h", ":tabprevious<CR>", d("Goto previous tab"))
nmap("<C-T>l", ":tabnext<CR>", d("Goto next tab"))
nmap("<C-T>n", ":tabnew<CR>", d("Create a new tab"))

-- save quickly
nmap(";w", ":w<CR>", d("Save buffer"))

-- shut down the search high light
nmap("<ESC>", ":nohlsearch<CR>", d("Close search highlight"))
-- no more finger expansion
map("i", "<A-;>", "<ESC>", d("Exit the insert mode"))

-- resize the window
nmap("<C-S-up>", ":res +5<CR>", d("Extend the upper boundary of the current window"))
nmap("<C-S-down>", ":res -5<CR>", d("Extend the lower boundary of the current window"))
nmap("<C-S-right>", ":vertical resize-5<CR>", d("Extend the right boundary of the current window"))
nmap("<C-S-left>", ":vertical resize+5<CR>", d("Extend the right boundary of the current window"))

-- kill buffer with ;q , quit window with :q.
nmap(";q", require("plugins.libs.bufdel").delete_buffer)

-- exit nvim
nmap(";;", "ZZ", d("Quit with saving"))

-- move around the window
nmap("<A-k>", "<C-w>k", d("Jump to window above"))
nmap("<A-j>", "<C-w>j", d("Jump to window below"))
nmap("<C-l>", "<C-w>l", d("Jump to the left window"))
nmap("<C-h>", "<C-w>h", d("Jump to the righ window"))

nmap('d', '"_d', d('map d to unnamed buffers ass'))
nmap('dd', '"_dd', d('map dd to unnamed buffers ass'))
nmap('cc', '"_cc', d('map cc to unnamed buffers ass'))
nmap('C', '"_C', d('map C to unnamed buffers ass'))
nmap('c', '"_c', d('map c to unnamed buffers ass'))

-- open Telescope
nmap("<leader><leader>", ":Telescope<CR>", d("Open Telescope"))
-- % is so hard to reach...
-- map({ "n", "x", "o" }, ",", "%", { noremap = false, silent = false })

-- Do not yank when pressing x
-- nmap("x", [["_x]])

-- Delete word backward and do not yank
-- nmap("dw", [[vb"_d]])
map({ "n", "x" }, "d", [["_d]])
