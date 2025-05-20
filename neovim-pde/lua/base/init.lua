return {
  { "tpope/vim-sleuth", event = "VeryLazy" },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "nvim-lua/plenary.nvim" },
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "GBrowse", "Gdiffsplit", "Gvdiffsplit" },
    dependencies = {
      "tpope/vim-rhubarb",
    },
    -- stylua: ignore
    keys = {
      { "<leader>gs", "<cmd>Git<cr>", desc = "Status" },
    },
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
    },
    config = function(_, opts)
      local wk = require "which-key"
      wk.setup(opts)
      wk.add {
        { "<leader>g", group = "+Git" },

        {
          mode = { "n", "v" },
          { "<leader>f", group = "+File" },
          { "<leader>q", group = "+Quit/Session" },
          { "<leader>qq", "<cmd>q<cr>", desc = "Quit" },
          { "<leader>w", "<cmd>update!<cr>", desc = "Save" },
        },

        { "<leader>d", group = "+DAP" },

        { "<leader>l", group = "+LSP" },

        { "<leader>t", group = "+Test" },
        { "<leader>tt", group = "+Task" },
      }
    end,
  },
}
