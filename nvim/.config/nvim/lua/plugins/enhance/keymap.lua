local map = require("editor.utils").map
local nmap = require("editor.utils").nmap

--
-- Markdown preview
--
nmap("<leader>m", ":MarkdownPreview<CR>")

--
-- EasyAlign
--
map("v", ";e", ":EasyAlign<CR>")

--
-- nvim-tree
--
nmap("<space>t", function()
  local view = require("nvim-tree.view")
  if view.is_visible() then
    view.close()
  else
    require("nvim-tree").open_replacing_current_buffer()
  end
end)
nmap(";d", ":NvimTreeToggle<CR>")

-- yank file path
map("n", "yf", [[:let @* = expand("%:p")<CR>]])

--
-- fterm
--
-- float terminal
nmap("<C-\\>", [[:ToggleTerm direction=float<CR>:startinsert<CR>]])
map("t", "<C-\\>", [[<C-\><C-n>:ToggleTerm<CR>]])
map("t", "<A-s>", [[<C-\><C-n>:ToggleTerm<CR>]])

-- horizontal terminal
nmap("<A-s>", [[:ToggleTerm direction=horizontal<CR>:startinsert<CR>]])
map("t", "<M-`>", [[<C-\><C-n>:ToggleTerm<CR>]])
map("t", "<C-n>", [[<C-\><C-n>]])

-- terminal windows movement
map("t", "<C-k>", [[<C-\><C-n><C-w>k]])

--
-- telescope
--

nmap(";f", function()
  require("telescope.builtin").git_files(require("telescope.themes").get_ivy())
end)

nmap(";l", function()
  require("telescope.builtin").oldfiles(require("telescope.themes").get_ivy())
end)

nmap(";j", function()
  require("telescope.builtin").live_grep(require("telescope.themes").get_ivy())
end)

nmap(";s", function()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local builtin = require("telescope.builtin")
  local opts = {
    sorting_strategy = "ascending",
    results_title = false,
    layout_strategy = "center",
    layout_config = {
      width = 50,
      height = 9,
    },
    borderchars = {
      prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
  }

  pickers
    .new(opts, {
      prompt_title = "Search",
      finder = finders.new_table({
        results = { "live grep", "buffer symbols", "workspace symbols" },
      }),
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr, _)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()

          local response = {
            ["live grep"] = "live_grep",
            ["buffer symbols"] = "lsp_document_symbols",
            ["workspace symbols"] = "lsp_workspace_symbols",
          }

          local func = response[selection[1]]
          if func == nil then
            return
          end

          builtin[func](require("telescope.themes").get_ivy())
        end)
        return true
      end,
    })
    :find()
end)

--
-- bufferline
--
nmap("<C-c>", ":BufferLinePickClose<CR>") -- close tab
-- move between tabs
nmap("<Tab>", "<CMD>BufferLineCycleNext<CR>")
nmap("<M-right>", [[<Cmd>BufferLineCycleNext<CR>]])

nmap("<M-left>", [[<Cmd>BufferLineCyclePrev<CR>]])
nmap("<S-Tab>", [[<Cmd>BufferLineCyclePrev<CR>]])

nmap(";p", [[<CMD>:BufferLinePick<CR>]])
-- move tabs
nmap("<M-S-right>", [[<CMD>BufferLineMoveNext<CR>]])
nmap("<M-S-left>", [[<CMD>BufferLineMovePrev<CR>]])

--
-- dispatch
--
nmap(";D", ":Dispatch ", { noremap = true, silent = false })

--
-- vim-matchup
--
map({ "n", "x", "o" }, ",", "<Plug>(matchup-%)")
