return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-project.nvim",
      "ahmedkhalf/project.nvim",
      "cljoly/telescope-repo.nvim",
      "stevearc/aerial.nvim",
      "nvim-telescope/telescope-frecency.nvim",
    },
    cmd = "Telescope",
    -- stylua: ignore
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
      { "<leader>fo", "<cmd>Telescope frecency theme=dropdown previewer=false<cr>", desc = "Recent" },
      { "<leader>fr", "<cmd>Telescope file_browser<cr>", desc = "Browser" },
      { "<leader>ps", "<cmd>Telescope repo list<cr>", desc = "Search" },
{
        "<leader>pp",
        function()
          require("telescope").extensions.project { display_type = "minimal" }
        end,
        desc = "List",
      },
      { "<leader>sw", "<cmd>Telescope live_grep<cr>", desc = "Workspace" },
      {
        "<leader>sb",
        function()
          require("telescope.builtin").current_buffer_fuzzy_find()
        end,
        desc = "Buffer",
      },
      { "<leader>vo", "<cmd>Telescope aerial<cr>", desc = "Code Outline" },
      {
        "<leader>zc",
        function()
          require("telescope.builtin").colorscheme { enable_preview = true }
        end,
        desc = "Colorscheme",
      },
    },
    opts = function(_, opts)
      local actions = require "telescope.actions"
      local actions_layout = require "telescope.actions.layout"
      local mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,
          ["?"] = actions_layout.toggle_preview,
        },
      }
      return {
        defaults = {
          mappings = mappings,
          pickers = {
            find_files = {
              theme = "dropdown",
              previewer = false,
              hidden = true,
              find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
            },
            git_files = {
              theme = "dropdown",
              previewer = false,
            },
            buffers = {
              theme = "dropdown",
              previewer = false,
            },
          },
          extensions = {
            file_browser = {
              theme = "dropdown",
              previewer = false,
              hijack_netrw = true,
              mappings = mappings,
            },
            project = {
              hidden_files = false,
              theme = "dropdown",
            },
          },
        },
      }
    end,
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)
      telescope.load_extension "fzf"
      telescope.load_extension "file_browser"
      telescope.load_extension "project"
      telescope.load_extension "projects"
      telescope.load_extension "aerial"
      telescope.load_extension "dap"
      telescope.load_extension "frecency"
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      -- triggers = "auto",
      win = {
        border = "single", -- none, single, double, shadow
        padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
      },
      layout = {
        -- height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        -- align = "left", -- align columns left, center or right
      },
      replace = {
        key = {
          { "<Space>", "SPC" },
        },
      },
      show_help = true,
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>f", group = "+File" },
          { "<leader>q", group = "+Quit/Session" },
          { "<leader>qq", "<cmd>q<cr>", mode = { "n", "v" }, desc = "Quit" },
          { "<leader>w", "<cmd>update!<cr>", mode = { "n", "v" }, desc = "Save" },
        },
      },
    },
  },
  -- config = function(_, opts)
  --   local wk = require "which-key"
  --   wk.setup(opts)
  --   wk.add {
  --     {
  --       mode = { "n", "v" },
  --       { "<leader>f", group = "+File" },
  --       { "<leader>q", group = "+Quit/Session" },
  --       { "<leader>qq", "<cmd>q<cr>", desc = "Quit" },
  --       { "<leader>w", "<cmd>update!<cr>", desc = "Save" },
  --     },
  --   }
  -- end,
}
