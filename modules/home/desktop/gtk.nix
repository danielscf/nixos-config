{
  config,
  pkgs,
  ...
}: {
  gtk = {
    enable = true;
    gtk3.bookmarks = [
      "file:///home/daniel/Downloads"
      "file:///run/media/daniel/EXTERNAL/"
      "file:///home/daniel/Pictures"
      "file:///home/daniel/Videos"
      "file:///home/daniel/Videos/recording"
      "file:///home/daniel/Pictures/screenshots"
      "file:///home/daniel/Pictures/wallpapers"
      "file:///home/daniel/projects"
      "file:///home/daniel/practice"
      "file:///home/daniel/.config"
      "file:///home/daniel/.cache"
    ];
  };
}
