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
}
