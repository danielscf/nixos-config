{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.nushell = {
    enable = true;

    # TODO: Complete settings
    settings = {
      show_banner = false;

      rm.always_trash = true;
      edit_mode = "vi";

      completions.external = {
        enable = true;
        max_results = 200;
      };
    };

    shellAliases = {
      ll = "ls -l";

      re = "sudo nixos-rebuild switch --flake ~/nixos-config#default";
      ru = "sudo nixos-rebuild switch --upgrade-all --flake ~/nixos-config#default";
    };

    # TODO: Add path env vars
    environmentVariables = {
      TRANSIENT_PROMPT_COMMAND = lib.hm.nushell.mkNushellInline ''{|| " ➜ " }'';
      TRANSIENT_PROMPT_INDICATOR = lib.hm.nushell.mkNushellInline ''{|| "" }'';
      TRANSIENT_PROMPT_INDICATOR_VI_INSERT = lib.hm.nushell.mkNushellInline ''{|| "" }'';
      TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = lib.hm.nushell.mkNushellInline ''{|| "" }'';
      TRANSIENT_PROMPT_MULTILINE_INDICATOR = lib.hm.nushell.mkNushellInline ''{|| "" }'';
      TRANSIENT_PROMPT_COMMAND_RIGHT = lib.hm.nushell.mkNushellInline ''{|| "" }'';
    };
  };
}
