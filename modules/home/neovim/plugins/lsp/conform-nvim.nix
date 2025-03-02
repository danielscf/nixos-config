{lib, pkgs, ...}:
{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    autoLoad = true;
    settings = {
      formatters_by_ft = {
	bash = ["shellcheck" "shellharden"];
        sh =  [ "shellharden" ];
        javascript =  [ "prettierd" ];
        typescript =  [ "prettierd" ];
        javascriptreact =  [ "prettierd" ];
        typescriptreact =  [ "prettierd" ];
        svelte =  [ "prettierd" ];
        css =  [ "prettierd" ];
        html =  [ "prettierd" ];
        yaml =  [ "prettierd" ];
        json =  [ "prettierd" ];
        jsonc =  [ "prettierd" ];
        markdown =  [ "prettierd" ];
        graphql =  [ "prettierd" ];
        lua =  [ "stylua" ];
        python =  [ "ruff_format" ];
        htmldjango =  [ "djlint" ];
	nix = [ "nixfmt" ];
      };

      formatters = {
	nixfmt = {
	  command = lib.getExe pkgs.nixfmt-rfc-style;
	};
      };
      
      format_on_save = {
        lsp_fallback = true;
        async = false;
        timeout_ms = 1000;
      };
    };
  };
}
