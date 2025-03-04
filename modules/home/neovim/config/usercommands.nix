{
  programs.nixvim.userCommands = {
    C = {
      command.__raw = ''
        function(opts)
          local comment = vim.opts.args .. "%s"
          vim.bo.commentstring = comment
        end
      '';
      nargs = 1;
      desc = "Set comment string for current buffer";
    };

    Gc = {
      command.__raw = ''
        function(opts)
          local message = tostring(opts.fargs[1])
          vim.cmd("Git commit -m " .. "'" .. message .. "'")
        end
      '';
      nargs = 1;
      desc = "Git commit message";
    };

    Gca = {
      command.__raw = ''
        function(opts)
          local message = tostring(opts.fargs[1])
          vim.cmd("Git commit --amend -m " .. "'" .. message .. "'")
        end
      '';
      nargs = 1;
      desc = "Git commit ammend message";
    };
  };
}
