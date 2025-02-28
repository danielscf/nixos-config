{
  fileSystems."/mnt/external" = {
    # WARNING: Hard-coded UUID
    device = "/dev/disk/by-uuid/68A8D5B3A8D5804C";

    fsType = "ntfs3";
    options = [
      "defaults"
      "users"
      "nofail"
      "noatime"
      "gid=100"
      "uid=1000"
      "windows_names"
    ];
  };

  # TODO: Add home variable
  fileSystems."/home/daniel/notes" = {
    device = "/mnt/external/vaults/personal";
    fsType = "none";
    options = ["bind" "x-systemd.automount" "x-systemd.idle-timeout=600"];
  };
}
