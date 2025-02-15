# NixOs Configuration

## Virtual machine setup

Check hardware configuration using

```sh
sudo nixos-generate-config --root /tmp/config --no-filesystems
```

Install the whole system using

```sh
sudo nix --experimental-features "nix-command flakes" \
run 'github:nix-community/disko/latest#disko-install' -- \
--write-efi-boot-entries \
--flake 'github:danielscf/nixos-config#vm' \ --disk main /dev/sda \
--mount-point /mnt 
```

## Work setup

## WSL setup

## Oracle VPS setup

