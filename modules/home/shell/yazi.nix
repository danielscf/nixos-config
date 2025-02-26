{
  config,
  pkgs,
  inputs,
  ...
}: {
  # TODO: Replace with system variable
  # TODO: Evaluate if this import should be moved
  # TODO: Create bookmark plugin
  imports = [
    (inputs.nix-yazi-plugins.legacyPackages.x86_64-linux.homeManagerModules.default)
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
      system-clipboard = inputs.nix-yazi-plugins.packages.x86_64-linux.system-clipboard;
      ouch = inputs.nix-yazi-plugins.packages.x86_64-linux.ouch;
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
