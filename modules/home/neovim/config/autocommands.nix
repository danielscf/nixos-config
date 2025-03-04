{
  programs.nixvim.autoCmd = [
    {
      event = [ "BufEnter" ];
      callback = ''
        function ()
          vim.opt.formatoptions:remove({ "c", "r", "o" })
        end
      '';
      desc = "Disable new comment line";
    }
    {
      event = [ "BufWinEnter" ];
      pattern = [ "*" ];
      callback = ''
        function ()
          if vim.bo[event.buf].filetype == "help" then
            vim.cmd.only()
          end
        end
      '';
      desc = "Open help page on a buffer";
    }
  ];
}
