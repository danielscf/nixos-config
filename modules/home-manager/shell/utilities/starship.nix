{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableNushellIntegration = true;

    settings = {
      add_newline = false;

      character = { 
        success_symbol = " ➜";
        error_symbol = " ➜(bold red)";
      };

      line_break.disabled = false;
      cmd_duration.disabled = true;
      battery.disabled = true;
      format = "$all";

      # TODO: icons

    };
  };
}