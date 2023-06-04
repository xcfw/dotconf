-- [[
-- Components:
--   autoload,          (This plugins will always be sources)
--   markdown_plugins,  (markdown plugins)
--   git_tools,         (git plugins)
--   editor_enhance,    (plugins to enhance neovim)
--   colorscheme,       (colorscheme plugins)
--   completion,        (nvim-cmp and its plugins)
--   coding_enhance,    (plugins for coding)
-- ]]

local autoload = {
  -- deserialize code to generate text object for highlight and other enhancement
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("plugins").load_cfg("treesitter_cfg")
    end,
    ft = vim.g.enable_treesitter_ft,
  },

  {
    "tpope/vim-fugitive",
    tag = 'v3.7',
    cmd = {
      "G",
      "Git",
      "Ggrep",
      "Gdiffsplit",
      "GBrowse",
    },
  },

  -- Show git information in neovim
  {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    event = "BufRead",
    config = function()
      require("plugins").load_cfg("gitsign_cfg")
    end,
  },

  -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
  {
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("diffview").setup({
        -- see configuration in
        -- https://github.com/sindrets/diffview.nvim#configuration
      })
    end,
    cmd = {
      "DiffviewOpen",
      "DiffviewFileHistory",
    },
  },

  -- Flog is a lightweight and powerful git branch viewer that integrates with fugitive.
  {
    "rbong/vim-flog",
    branch = "v2",
    -- please don't use this plugin directly, I embed it with vim-fugitive
    -- See lua/core/commands.lua
    opt = true,
  },
}

local editor_enhance = {
  {
    "sindrets/winshift.nvim",
    cmd = {
      "WinShift",
    },
    config = function()
      require("winshift").setup({})
    end,
  },

  -- speed up neovim!
  {
    "nathom/filetype.nvim",
    config = function()
      require("filetype").setup({
        -- overrides the filetype or function for filetype
        -- See https://github.com/nathom/filetype.nvim#customization
        overrides = {},
      })
    end,
  },
  -- github copilot

  -- adjust the shiftwidth and expandtab settins
  {
    "tpope/vim-sleuth",
  },

  --[[ -- tmux navigation
  {
    "christoomey/vim-tmux-navigator",
  }, ]]

  -- Fix the CursorHold performance bug
  {
    "antoinemadec/FixCursorHold.nvim",
  },

  {
    "ethanholz/nvim-lastplace",
    config = function ()
      require'nvim-lastplace'.setup{
        lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
        lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
        lastplace_open_folds = true
      }
    end
  },

  -- cache everything!
  {
    "lewis6991/impatient.nvim",
  },
}

local markdown_plugins = {
  -- markdown toc
  {
    "mzlogin/vim-markdown-toc",
    cmd = {
      "GenTocGFM",
    },
  },

  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      require("plugins").load_cfg("markdown_preview_cfg")
    end,
    ft = {
      "markdown",
    },
  },

  -- markdown editing enhancement
  {
    "plasticboy/vim-markdown",
    ft = {
      "markdown",
    },
  },

  -- table editing enhancement
  {
    "dhruvasagar/vim-table-mode",
    cmd = "TableModeToggle",
  },
}

local git_tools = {
  -- A git tool like magit in Emacs

  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("plugins").load_cfg("toggleterm_cfg")
    end,
    cmd = "ToggleTerm",
  },

  -- list of nerdfont icons
  {
    "kyazdani42/nvim-web-devicons",
    event = "BufRead",
  },

  -- fancy status line
  {
    "Avimitin/galaxyline.nvim",
    branch = "main",
    after = "nvim-web-devicons",
    config = function()
      require("plugins").load_cfg("galaxyline_cfg")
    end,
  },

  -- Highlight unsafe SSL protocols
  {
    "chr4/sslsecure.vim"
  },

  -- nginx syntax highlight
  {
    "chr4/nginx.vim"
  },

  -- tree style file manager
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("plugins").load_cfg("nvimtree_cfg")
    end,
    cmd = {
      "NvimTreeRefresh",
      "NvimTreeToggle",
    },
  },

  -- generate color from hex/rgb code
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "*", -- Highlight all files, but customize some others.
        css = {
          rgb_fn = true,
        }, -- Enable parsing rgb(...) functions in css.
      })
    end,
    cmd = {
      "ColorizerToggle",
      -- this help generate color for no filetype file
      "ColorizerAttachToBuffer",
    },
  },

  -- editing with multiple cursor
  {
    "mg979/vim-visual-multi",
    event = "InsertEnter",
    branch = "master",
  },

  -- Linux coreutil in vim
  {
    "tpope/vim-eunuch",
    cmd = {
      -- Sudo needs you to configured the /etc/sudo.conf file to set the
      -- correct askpass executable.
      "SudoWrite",
      "SudoEdit",
      "Delete",
      "Unlink",
      "Move",
      "Rename",
      "Chmod",
      "Mkdir",
    },
  },

  -- cd into the root directory
  {
    "airblade/vim-rooter",
    event = "BufReadPost",
    config = function()
      vim.cmd("Rooter")
    end,
  },

  -- telescope: extensible fuzzy file finder
  {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins").load_cfg("telescope_cfg")
    end,
    module = "telescope",
  },

  -- record and manage your paste history
  {
    "AckslD/nvim-neoclip.lua",
    event = "TextYankPost",
    config = function()
      require("neoclip").setup()
      require("telescope").load_extension("neoclip")
    end,
  },

  -- Press enter to select text object
  {
    "gcmt/wildfire.vim",
    keys = {
      {
        "n",
        "<Enter>",
      },
    },
  },

  -- surrounding select text with given signs
  {
    "tpope/vim-surround",
    event = "BufRead",
    config = function()
      local map = require("mappings.utils").map
      -- release the S key to the lightspeed
      map("x", "S", "<Plug>Lightspeed_S", {
        noremap = false,
      })
      -- and remap it to gs
      map("x", "gs", "<Plug>VSurround", {
        noremap = false,
      })
    end,
  },

  -- a swiss knife for aligning text
  {
    "junegunn/vim-easy-align",
    cmd = "EasyAlign",
  },

  -- Move cursor by text search
  {
    "ggandor/lightspeed.nvim",
    keys = {
      { "n", "s" },
      { "v", "s" },
      { "n", "S" },
      { "v", "S" },
      { "n", "f" },
      { "n", "F" },
      { "n", "t" },
      { "n", "T" },
      { "v", "f" },
      { "v", "F" },
      { "v", "t" },
      { "v", "T" },
    },
  },

  -- Enhanced the `%` keymap
  {
    "andymass/vim-matchup",
    keys = {
      { "n", "%" },
      { "v", "%" },
    },
  },

  -- automatically pairs the bracket
  {
    "windwp/nvim-autopairs",
    config = function()
      require("plugins").load_cfg("autopairs_cfg")
    end,
    after = "nvim-cmp",
  },

  -- file manager without any dependency
  {
    "obaland/vfiler.vim",
    cmd = "VFiler",
    requires = {
      "obaland/vfiler-column-devicons",
    },
    config = function()
      require("vfiler/config").setup({
        options = {
          columns = "indent,devicons,name,mode,size,time",
        },
      })
    end,
  },

  -- split single line and join multiple lines, useful for closing bracket
  --[[ {
    "AndrewRadev/splitjoin.vim",
    keys = {
      { "n", "gJ" },
      { "n", "gS" },
    },
  },
 ]]
  -- generate line for guiding indent
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins").load_cfg("indent_cfg")
    end,
    event = "BufRead",
  },

  -- repeat your last action, what ever command or keymaps or inputs
  {
    "tpope/vim-repeat",
    keys = {
      { "n", "." },
    },
  },

  -- a curl wrapper in neovim
  {
    "NTBBloodbath/rest.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins").load_cfg("rest_nvim_cfg")
    end,
    ft = "http",
  },

  -- sort the number or text
  {
    "sQVe/sort.nvim",
    config = function()
      require("sort").setup({})
    end,
    cmd = "Sort",
  },

  -- scroll smoothly
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("plugins").load_cfg("neoscroll_cfg")
    end,
    keys = { { "n", "<C-e>" }, { "n", "<C-y>" }, { "n", "<C-f>" }, { "n", "<C-b>" } },
  },

  -- search and replace with a panel
  {
    "windwp/nvim-spectre",
    requires = { "nvim-lua/plenary.nvim" },
    module = "spectre",
  },

  {
    "beauwilliams/focus.nvim",
    event = "WinEnter",
    config = function()
      require("focus").setup({
        excluded_filetypes = { "fterm", "term", "toggleterm" },
        signcolumn = false,
      })
    end,
  },

  {
    "stevearc/dressing.nvim",
    module = "vim.ui",
    config = function()
      require("dressing").setup({})
    end,
  },

  -- add notify window
  {
    "rcarriga/nvim-notify",
    module = "vim",
    config = function()
      vim.notify = require("notify")
    end,
  },
}

local colorscheme = {
  -- dark green color scheme
  --[[ {
    "Avimitin/neovim-deus",
    cond = function()
      return require("core.colors").theme == "deus"
    end,
    config = function()
      require("core.colors").deus_setup()
    end,
  }, ]]

  -- dark purple color scheme
  {
    "rebelot/kanagawa.nvim",
    cond = function()
      return require("core.colors").theme == "kanagawa"
    end,
    config = function()
      require("core.colors").kanagawa_setup()
    end,
  },

  -- GitHub light and dark colorscheme
  {
    "projekt0n/github-nvim-theme",
    cond = function()
      local select = require("core.colors").theme
      for _, avail in ipairs({
        "github_dark",
        "github_dimmed",
        "github_light",
        "github_light_default",
      }) do
        if select == avail then
          return true
        end
      end
      return false
    end,
    config = function()
      require("core.colors").github_setup()
    end,
  },

  -- dark blue and light yellow color scheme
  {
    "EdenEast/nightfox.nvim",
    cond = function()
      local select = require("core.colors").theme
      for _, avail in ipairs({ "nightfox", "dayfox", "dawnfox", "nordfox", "duskfox" }) do
        if select == avail then
          return true
        end
      end
      return false
    end,
    config = function()
      require("core.colors").nightfox_setup()
    end,
  },
}

local coding_enhance = {
  --[[ {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require"telescope".load_extension("frecency")
    end,
    --requires = {"tami5/sqlite.lua"}
  }, ]]

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
  },

  -- automatically download and manage lsp server
  {
    "williamboman/nvim-lsp-installer",
    ft = vim.g.enable_lspconfig_ft,
    config = function()
      require("lspconfig")
    end,
  },

  -- manage the lsp server
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins").load_cfg("lspconfig_cfg")
    end,
    module = "lspconfig",
  },

  -- enhance the lsp UI
  {
    "tami5/lspsaga.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("plugins").load_cfg("lspsaga_cfg")
    end,
  },

  -- enhance the Cargo dependencies management
  {
    "saecki/crates.nvim",
    event = {
      "BufRead Cargo.toml",
    },
    requires = {
      {
        "nvim-lua/plenary.nvim",
      },
    },
    config = function()
      require("crates").setup({
        popup = {
          autofocus = true,
          border = "single",
        },
      })
    end,
  },

  -- debugger plugin
  {
    "mfussenegger/nvim-dap",
    module = "dap",
    config = function()
      require("plugins").load_cfg("dap_cfg")
    end,
  },

  -- UI for nvim-dap
  {
    "rcarriga/nvim-dap-ui",
    module = "dapui",
  },

  -- generate quick jump list in side panel
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("plugins").load_cfg("symboloutline_cfg")
    end,
    cmd = "SymbolsOutline",
  },

  -- go coding enhancement
  {
    "fatih/vim-go",
    config = function()
      require("plugins").load_cfg("vim_go_cfg")
    end,
    ft = { "go" },
  },

  -- format code use clang-format
  {
    "rhysd/vim-clang-format",
    ft = {
      "cpp",
      "c",
      "h",
      "hpp",
    },
  },

  -- use `gcc` `gbc` to comment
  {
    "b3nj5m1n/kommentary",
      vim.api.nvim_set_keymap("n", "gcc", "<Plug>kommentary_line_default", {}),
      vim.api.nvim_set_keymap("n", "gc", "<Plug>kommentary_motion_default", {}),
      vim.api.nvim_set_keymap("v", "gc", "<Plug>kommentary_visual_default<C-c>", {})
  },

  -- find definition, reference
  {
    "pechorin/any-jump.vim",
    setup = function()
      vim.g.any_jump_window_width_ratio = 0.8
      vim.g.any_jump_window_height_ratio = 0.9
      vim.g.any_jump_disable_default_keybindings = 1
    end,
    cmd = {
      "AnyJump",
      "AnyJumpBack",
    },
  },

  -- run command in separate vim/nvim/tmux window
  {
    "tpope/vim-dispatch",
    cmd = "Dispatch",
  },

  -- add a progress bar for lsp server
  {
    "j-hui/fidget.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("fidget").setup({
        text = {
          spinner = "dots",
        },
      })
    end,
  },
}

local completion = {
  -- lot's of pre-set snippets
  {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",
    keys = {
      { "n", ":" },
      { "n", "/" },
    },
  },

  -- the completion core
  {
    "hrsh7th/nvim-cmp",
    after = "friendly-snippets",
    config = function()
      require("plugins").load_cfg("nvimcmp_cfg")
    end,
  },

  -- completion source for system path
  {
    "hrsh7th/cmp-path",
    after = {
      "nvim-cmp",
    },
  },

  -- completion source for lspconfig
  {
    "hrsh7th/cmp-nvim-lsp",
    after = {
      "nvim-cmp",
    },
  },

  -- completion source for word in current buffer
  {
    "hrsh7th/cmp-buffer",
    after = {
      "nvim-cmp",
    },
  },

  -- tmux completion
  {
    "andersevenrud/cmp-tmux",
    after = {
      "nvim-cmp",
    },
  },

  -- completion source for vsnip snippet plugin
  {
    "hrsh7th/cmp-vsnip",
    after = {
      "nvim-cmp",
    },
  },

  -- the snippet core
  {
    "hrsh7th/vim-vsnip",
    after = {
      "nvim-cmp",
    },
  },

  {
    "hrsh7th/cmp-cmdline",
    after = {
      "nvim-cmp",
    },
  },

  {
    "uga-rosa/cmp-dictionary",
    after = "nvim-cmp",
    config = function()
      require("cmp_dictionary").setup({
        dic = {
          ["*"] = "/usr/share/dict/en.dic",
        },
        first_case_insensitive = true,
        document = true,
      })
      require("cmp_dictionary").update() -- THIS
    end,
  },
}

return {
  autoload,
  markdown_plugins,
  git_tools,
  editor_enhance,
  colorscheme,
  completion,
  coding_enhance,
}
