local plugins = {
  {
    "nvim-neotest/neotest-python",
  },
  {
    "mfussenegger/nvim-dap-python",
    -- stylua: ignore
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    keys = {
      {
        "<leader>dPt",
        function()
          require("dap-python").test_method()
        end,
        desc = "Debug Method",
        ft = "python",
      },
      {
        "<leader>dPc",
        function()
          require("dap-python").test_class()
        end,
        desc = "Debug Class",
        ft = "python",
      },
    },
    config = function()
      local path = require("mason-registry").get_package("debugpy"):get_install_path()
      require("dap-python").setup(path .. "/venv/bin/python")
      local dap = require("dap")
      local configTable = dap.configurations.python
      -- configTable[1].cwd = vim.fn.getcwd()
      configTable[1].justMyCode = false
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    cmd = "VenvSelect",
    opts = function(_, opts)
      if LazyVim.has("nvim-dap-python") then
        opts.dap_enabled = true
      end
      return vim.tbl_deep_extend("force", opts, {
        name = {
          "venv",
          ".venv",
          "env",
          ".env",
        },
      })
    end,
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },
}
return plugins
