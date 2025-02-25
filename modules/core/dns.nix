{
  config,
  pkgs,
  ...
}: {
  # NetworkManager setup required
  networking = {
    useDHCP = false;
    dhcpcd.enable = false;

    networkmanager.dns = "none";

    # TODO: Ask for cloudflare or google dns
    nameservers = [
      # "1.1.1.1"
      # "1.0.0.1"
      # "2606:4700:4700::1111"
      # "2606:4700:4700::1001"

      "8.8.8.8"
      "8.8.4.4"
      "2001:4860:4860::8888"
      "2001:4860:4860::8844"
    ];
  };
}

