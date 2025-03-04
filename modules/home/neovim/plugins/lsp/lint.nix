{
  lib,
  pkgs,
  ...
}:
{
  programs.nixvim.plugins.lint = {
    enable = true;

    linters = {
      ruff.cmd = lib.getExe pkgs.ruff;
      selene.cmd = lib.getExe pkgs.selene;
      eslint_d.cmd = lib.getExe pkgs.eslint_d;
      shellcheck.cmd = lib.getExe pkgs.shellcheck;
      djlint.cmd = lib.getExe pkgs.djlint;
    };

    lintersByFt = {
      javascript = [ "eslint_d" ];
      typescript = [ "eslint_d" ];
      javascriptreact = [ "eslint_d" ];
      typescriptreact = [ "eslint_d" ];
      svelte = [ "eslint_d" ];

      sh = [ "shellcheck" ];
      bash = [ "shellcheck" ];

      python = [ "ruff" ];
      htmldjango = [ "djlint" ];

      lua = [ "selene" ];
      nix = [ "nix" ];
    };
  };
}
