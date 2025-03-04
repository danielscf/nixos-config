{
  programs.nixvim = {
    autoGroups = {
      ImageBuffer.clear = true;
    };

    autoCmd = [
      {
        event = [ "BufEnter" ];
        callback.__raw = ''
          function ()
            vim.opt.formatoptions:remove({ "c", "r", "o" })
          end
        '';
        desc = "Disable new comment line";
      }
      {
        event = [ "BufWinEnter" ];
        callback.__raw = ''
          function (event)
            if vim.bo[event.buf].filetype == "help" then
              vim.cmd.only()
            end
          end
        '';
        desc = "Open help page on a buffer";
      }
      {
        event = [ "BufReadPost" ];
        group = "ImageBuffer";
        pattern = [
          "*.png"
          ".jpeg"
          "*.jpg"
        ];
        command = "setlocal nonumber norelativenumber";
        desc = "Disable numberrs on image buffers";
      }
    ];
  };
}
