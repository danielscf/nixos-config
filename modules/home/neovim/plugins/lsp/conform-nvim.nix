{
  lib,
  pkgs,
  ...
}:
{
  programs.nixvim = {
    keymaps = [
      {
        key = "<leader>fo";
        action = ''
          function()
            require("conform").format({
              lsp_fallback = true,
              async = false,
              timeout_ms = 1000,
            })
          end
        '';
        mode = [
          "n"
          "v"
        ];
        options.desc = "Conform: Format file";
      }
    ];

    plugins.conform-nvim = {
      enable = true;

      settings = {
        formatters_by_ft = {
          bash = [ "shellcheck" ];
          sh = [ "shellharden" ];
          javascript = [ "prettierd" ];
          typescript = [ "prettierd" ];
          javascriptreact = [ "prettierd" ];
          typescriptreact = [ "prettierd" ];
          svelte = [ "prettierd" ];
          css = [ "prettierd" ];
          html = [ "prettierd" ];
          yaml = [ "prettierd" ];
          json = [ "prettierd" ];
          jsonc = [ "prettierd" ];
          markdown = [ "prettierd" ];
          graphql = [ "prettierd" ];
          lua = [ "stylua" ];
          python = [ "black" ];
          nix = [
            "alejandra"
            "nixfmt"
          ];
        };

        formatters = {
          shellcheck.command = lib.getExe pkgs.shellcheck;
          shellharden.command = lib.getExe pkgs.shellharden;
          stylua.command = lib.getExe pkgs.stylua;
          black.command = lib.getExe pkgs.black;
          prettierd.command = lib.getExe pkgs.prettierd;
          alejandra.command = lib.getExe pkgs.alejandra;
          nixfmt.command = lib.getExe pkgs.nixfmt-rfc-style;
        };

        format_on_save = {
          lsp_fallback = true;
          async = false;
          timeout_ms = 1000;
        };
      };
    };
  };
}
