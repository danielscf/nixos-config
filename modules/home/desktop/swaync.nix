{
  config,
  pkgs,
  ...
}: {
  services.swaync = {
    enable = true;
    settings = {};
    style = '''';
  };
}
