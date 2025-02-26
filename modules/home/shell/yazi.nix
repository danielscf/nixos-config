{
  config,
  pkgs,
  system,
  inputs,
  ...
}: let
  pluginsModule = inputs.nix-yazi-plugins.legacyPackages.${system}.homeManagerModules.default;
  pluginsPkg = inputs.nix-yazi-plugins.packages.${system};
in {
  # TODO: Evaluate if this import should be moved
  # TODO: Create bookmark plugin
  imports = [
    pluginsModule
  ];

  programs.yazi = {
    enable = true;

    enableBashIntegration = true;
    enableNushellIntegration = true;
    shellWrapperName = "y";

    settings = {
      manager = {
        sort_by = "extension";
        sort_dir_first = false;
        sort_sensitive = true;
        sort_reverse = true;
        show_hidden = true;
        show_symlink = true;
      };
    };

    # initLua =

    plugins = {
      system-clipboard = pluginsPkg.system-clipboard;
      ouch = pluginsPkg.ouch;
    };

    yaziPlugins = {
      enable = true;

      plugins = {
        starship.enable = true;
        chmod.enable = true;
        full-border.enable = true;
        hide-preview.enable = true;
        smart-filter.enable = true;
        relative-motions = {
          enable = true;
          show_numbers = "relative_absolute";
          show_motion = true;
        };
      };
    };

    keymap = {
      manager.append_keymap = [
        {
          on = ["g" "e"];
          run = "cd /run/media/daniel/EXTERNAL/";
          desc = "Go to external drive";
        }
        {
          on = "<C-y>";
          run = ["plugin system-clipboard"];
        }
      ];
    };
  };
}
