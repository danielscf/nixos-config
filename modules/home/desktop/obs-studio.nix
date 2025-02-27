{
  config,
  pkgs,
  ...
}: {
  programs.obs-studio = {
    enable = true;

    # TODO: Add plugins
    plugins = [];
  };
}
