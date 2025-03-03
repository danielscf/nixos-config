{
  programs.nixvim.plugins.noice = {
    enable = true;
    settings = {
      presets = {
        command_palette = true;
        long_message_to_split = true;
        inc_rename = false;
        lsp_doc_border = false;
      };

      routes = [
        {
          filter = {
            event = "msg_show";
            kind = "";
            find = "written";
          };
          opts.skip = true;
        }
      ];
    };
  };
}
