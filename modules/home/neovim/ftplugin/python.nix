''
  local map = vim.keymap.set

  -- Nvim-dap-python: Run tests
  map("n", "<leader>dt", function()
    require("dap-python").test_method()
  end, { desc = "Debug break point" })
''
