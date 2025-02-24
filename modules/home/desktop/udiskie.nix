{
  config,
  pkgs,
  ...
}: {
  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
    settings = {
      program_options = {
        udisks_version = 2;
      };
    };
  };
}
