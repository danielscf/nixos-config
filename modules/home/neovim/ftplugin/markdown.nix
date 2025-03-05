''
  local map = vim.keymap.set

  -- Markdown-preview: Toggle markdown preview server
  map("n", "<leader>fp", "<cmd>MarkdownPreview<cr>", { desc = "Markdown-preview: Start" })
  map("n", "<leader>fP", "<cmd>MarkdownPreviewStop<cr>", { desc = "Markdown-preview: Stop" })

  -- Obsidian: Notes
  map("n", "<leader>so", "<cmd>ObsidianSearch<cr>", { desc = "Obsidian: Search" })
  map("n", "<leader>tb", "<cmd>ObsidianBacklinks<cr>", { desc = "Obsidian: Backlinks" })

  -- Obsidian-bridge: Open obsidian graph on the app
  map("n", "<leader>og", "<cmd>ObsidianBridgeOpenGraph<cr>", { desc = "Open Obsidian Graph" })
  map("n", "<leader>op", "<cmd>ObsidianPasteImg<cr>", { desc = "Paste image to obsidian vault" })

  require("which-key").register({
    mode = { "n", "v" },
    ["<leader>o"] = { name = "+ Obsidian" },
  })
''
