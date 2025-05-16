if not require("config").pde.lua then
  return {}
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "lua", "luadoc", "luap" })
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "stylua" })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require "null-ls"
      table.insert(opts.source, nls.builtins.formatting.stylua)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Development of neodev.nvim is now EOL. If you're on Neovim >= 0.10, then I highly suggest you to use lazydev.nvim It's a much faster and better replacement for neodev.
      "folke/lazydev.nvim",
      opts = {},
    },
    opts = {
      servers = {
        lua_ls = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            completion = { callSinppet = "Replace" },
            telemetry = { enable = false },
            hint = {
              enable = false,
            },
          },
        },
      },
      setup = {
        lua_ls = function(_, _)
          local lsp_utils = require "base.lsp.utils"
          lsp_utils.on_attach(function(client, buffer)
            if client.name == "lua_ls" then
              vim.keymap.set("n", "<leader>dX", function() require("osv").run_this() end, { buffer = buffer, desc = "OSV Run" })
              vim.keymap.set("n", "<leader>dL", function() require("osv").launch({ port = 8086}) end, { buffer = buffer, desc = "OSV Launch" })
            end
          end)
        end,
      },
    },
  },
  -- Debugging
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "jbyuki/one-small-step-for-vimkind" },
    },
    opts = {
      setup = {
        osv = function(_, _)
          local dap = require "dap"
          dap.configuration.lua = {
            {
              type = "nlua",
              request = "attach",
              name = "Attach to running Neovim instance",
              host = function()
                local value = vim.fn.input "Host [172.0.0.1]: " 
                if value ~= "" then
                  return value
                end
                return "127.0.0.1"
              end,
              port = function()
                local val = tonumber(vim.fn.input("Port: ", "8086"))
                assert(val, "Please provide a port number")
                return val
              end,
            },
          }

          dap.adapters.nlua = function(callback, config)
            callback { type = "server", host = config.host, port = config.port }
          end
        end,
      },
    },
  },
}
