{
  programs.nixvim = {
    keymaps = [
      {
        key = "<leader>db";
        action.__raw = ''
          function()
            for i = 1, vim.fn.tabpagenr("$") do
              local win_list = vim.fn.tabpagebuflist(i)
              for _, buf in ipairs(win_list) do
                if vim.bo[buf].filetype == "dbui" then
                  vim.cmd("tabnext " .. i)
                  return
                end
              end
            end
            vim.cmd("tabnew | DBUI")
          end
        '';
        options.desc = "Open database ui on new tab";
      }
    ];

    plugins = {
      vim-dadbod.enable = true;
      vim-dadbod-ui.enable = true;
      vim-dadbod-completion.enable = true;
    };
  };
}
