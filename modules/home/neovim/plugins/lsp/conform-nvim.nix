{ lib, pkgs, ... }:
{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    autoLoad = true;
    settings = {
      formatters_by_ft = {
        bash = ["shellcheck"];
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
        python = [ "ruff_format" ];
        nix = [ "nixfmt" ];
      };

      formatters = {
        shellcheck.command = lib.getExe pkgs.shellcheck;
        shellharden.command = lib.getExe pkgs.shellharden;
	stylua.command = lib.getExe pkgs.stylua;
	ruff_format.command = lib.getExe pkgs.ruff_format;
	prettierd.command = lib.getExe pkgs.prettierd;
        nixfmt.command = lib.getExe pkgs.nixfmt-rfc-style;
      };

      format_on_save = {
        lsp_fallback = true;
        async = false;
        timeout_ms = 1000;
      };
    };
  };
}
