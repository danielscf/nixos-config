{pkgs, ...}: {
  security.sudo = {
    enable = true;
    extraRules = [
      {
        groups = ["wheel"];
        commands = [
          {
            command = "/run/current-system/sw/bin/nixos-rebuild";
            options = ["NOPASSWD"];
          }
        ];
      }
    ];
  };
}
