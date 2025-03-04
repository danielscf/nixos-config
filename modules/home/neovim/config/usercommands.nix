{
  programs.nixvim.userCommands = {
    "C" = {
      command = ''
        function (opts)
          local comment = vim.opts.args .. "%s"
          vim.bo.commentstring = comment
        end
      '';
      nargs = 1;
    };

    "Gc" = {
      command = ''
        function (opts)
          local message = tostring(opts.fargs[1])
          vim.cmd("Git commit -m " .. "'" .. message .. "'")
        end
      '';
      nargs = 1;
    };

    "Gca" = {
      command = ''
        function (opts)
          local message = tostring(opts.fargs[1])
          vim.cmd("Git commit --amend -m " .. "'" .. message .. "'")
        end
      '';
      nargs = 1;
    };
  };
}
