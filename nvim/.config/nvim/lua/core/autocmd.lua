local au = vim.api.nvim_create_autocmd

-- use relativenumber when editing
au({ "InsertEnter" }, { pattern = { "*" }, command = "set nornu" })
au({ "InsertLeave" }, { pattern = { "*" }, command = "set rnu" })

-- auto compile when editing the load.lua file
au({ "BufWritePost" }, { pattern = "load.lua", command = "source <afile> | PackerCompile" })

-- start insert when enter the terminal
au({ "TermOpen" }, { pattern = "term://*", command = "startinsert" })

-- Return to last edit position when opening files
-- au({ "BufReadPost" }, { pattern = { "*" }, command = "if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif" })
