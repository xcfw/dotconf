return {
  "nvim-telescope/telescope.nvim",
  optional = true,
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
    { "fdschmidt93/telescope-egrepify.nvim", lazy = true },
  },
  keys = {
    { "<leader>bl", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Find Buffers" },
    {
      "<leader>bb",
      function()
        require("neo-tree.command").execute({ source = "buffers", toggle = true })
      end,
      desc = "Checkout branch",
    },
    { "<leader><leader>", "<cmd>Telescope<cr>", desc = "Open Telescope" },
    { ";f", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    { ";o", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects" },
    { ";j", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
    { ";k", "<cmd>Telescope egrepify <cr>", desc = "Eripgrep Text" },
    { ";h", "<cmd>Telescope help_tags<cr>", desc = "Help" },
    { ";l", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
  },
  opts = function(_, opts)
    -- Load extensions
    local telescope = require("telescope")
    telescope.load_extension("fzf")
    telescope.load_extension("egrepify")

    -- Merge with existing LazyVim opts
    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
      color_devicons = true,
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
      mappings = {
        i = {
          ["<C-j>"] = require("telescope.actions").cycle_history_next,
          ["<C-k>"] = require("telescope.actions").cycle_history_prev,
        },
        n = {
          ["<esc>"] = require("telescope.actions").close,
          ["j"] = require("telescope.actions").move_selection_next,
          ["k"] = require("telescope.actions").move_selection_previous,
          ["q"] = require("telescope.actions").close,
        },
      },
    })

    -- Custom pickers
    opts.pickers = vim.tbl_deep_extend("force", opts.pickers or {}, {
      live_grep = {
        theme = "dropdown",
        additional_args = function()
          return { "--hidden", "--glob=!.git/" }
        end,
        path_display = { "relative" },
      },
      find_files = {
        theme = "dropdown",
        previewer = true,
        hidden = true,
        follow = true,
        find_command = { "rg", "--files", "--hidden", "--glob", "!.git/" },
        path_display = { "relative" },
      },
      oldfiles = {
        theme = "dropdown",
        cwd_only = true,
        path_display = { "relative" },
      },
      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
        mappings = {
          i = { ["<C-d>"] = require("telescope.actions").delete_buffer },
          n = { ["dd"] = require("telescope.actions").delete_buffer },
        },
      },
    })

    -- Extensions settings
    opts.extensions = {
      fzf = {
        fuzzy = true, -- exact matching
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      egrepify = {
        AND = true,
        permutations = false,
        lnum = true,
        title = true,
        filename_hl = "EgrepifyFile",
        prefixes = {
          ["!"] = { flag = "invert-match" },
        },
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").cycle_history_next,
            ["<C-k>"] = require("telescope.actions").cycle_history_prev,
            ["<C-z>"] = require("telescope._extensions.egrepify.actions").toggle_prefixes,
            ["<C-a>"] = require("telescope._extensions.egrepify.actions").toggle_and,
            ["<C-r>"] = require("telescope._extensions.egrepify.actions").toggle_permutations,
          },
        },
      },
    }
  end,
}
