{
  config,
  pkgs,
  lib,
  ...
}: {
  home.activation.ensureDirs = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p ~/Pictures/screenshots \
      ~/Pictures/wallpapers \
      ~/Videos/recording \
      ~/nixos-config \
      ~/projects \
      ~/practice
  '';

  gtk = {
    enable = true;
    gtk3.bookmarks = [
      "file:///home/daniel/Downloads"
      "file:///home/daniel/Pictures"
      "file:///home/daniel/Videos"
      "file:///home/daniel/Documents"
      "file:///mnt/external"
      "file:///home/daniel/Videos/recording"
      "file:///home/daniel/Pictures/screenshots"
      "file:///home/daniel/Pictures/wallpapers"
      "file:///home/daniel/nixos-config"
      "file:///home/daniel/projects"
      "file:///home/daniel/practice"
    ];
  };
}
