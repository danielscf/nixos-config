{
  config,
  pkgs,
  ...
}: {
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
    };
    # style = '''';
  };
}
