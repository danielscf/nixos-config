# NixOs Configuration

## Non `disko-install` Setup

```sh
git clone https://github.com/danielscf/nixos-config.git

sudo nix --experimental-features 'nix-command' \
run 'github:nix-community/disko' -- \
--mode disko \
./hosts/<host>/disk-configuration.nix

nixos-install --flake .#<host>
```

## Virtual Machine Setup

Minimal setup with non-encrypted ext4 and xfce as desktop environment

```sh
sudo nix --experimental-features "nix-command flakes" \
run 'github:nix-community/disko/latest#disko-install' -- \
--write-efi-boot-entries \
--flake 'github:danielscf/nixos-config#vm' \
--disk main /dev/sda \
--mount-point /mnt 
```

## Work Setup

Create the key for disk encryption

```sh
echo '<password>' > /tmp/secret.key
```

Install system (Change disk)

```sh
sudo nix --experimental-features "nix-command flakes" \
run 'github:nix-community/disko/latest#disko-install' -- \
--write-efi-boot-entries \
--flake 'github:danielscf/nixos-config#work' \ 
--disk main /dev/sda \
--mount-point /mnt 
```

## WSL Setup

Install nixos-wsl and run

```sh
sudo nixos-rebuild switch --flake 'github:danielscf/nixos-config#wsl'
```

## Oracle VPS Setup

