{
  programs.zsh = {
    enable = true;

    defaultKeymap = "viins";
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      SUDO_EDITOR = "nvim";
    };

    shellAliases = {
      "ls" = "eza -1";
      "ll" = "eza -alh";
      "tree" = "eza --tree";

      "cat" = "bat";
      "man" = "batman";

      "trash" = "gio trash";

      # TODO: Change for the current profile
      "re" = "sudo nixos-rebuild switch --flake ~/nixos-config#work";
      "ruh" = "sudo nixos-rebuild switch --upgrade-all --flake ~/nixos-config#work";
    };
  };
}
