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

Check hardware configuration using

```sh
sudo nixos-generate-config --root /tmp/config --no-filesystems
```

Install the whole system using

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

## Oracle VPS Setup

