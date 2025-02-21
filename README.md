# NixOs Configuration

## Work Setup

For now, the work setup will use manual partitioning in order to preserve the already installed windows

```sh
sudo -i

lsblk
cfdisk /dev/<disk>

pvcreate /dev/<lvm_partition>
vgcreate nixos-vg /dev/<lvm_partition>

lvcreate -L 24G -n swap nixos-vg
lvcreate -l 100%FREE -n root nixos-vg

mkfs.fat -F 32 -n boot /dev/<boot_partition>
mkfs.ext4 -L root /dev/nixos-vg/root
mkswap -L swap /dev/nixos-vg/swap

mount /dev/nixos-vg/root /mnt
mkdir /mnt/boot

mount /dev/<boot_partition> /mnt/boot
swapon /dev/nixos-vg/swap

nixos-generate-config --root /mnt

cd /mnt/etc/nixos
git clone https://github.com/danielscf/nixos-config.git

mv nixos-config/* .
rm configuration.nix
mv hardware-configuration.nix ./hosts/work/

nixos-install --flake .#work
```

## Virtual Machine Setup

Minimal setup with non-encrypted ext4 and xfce as desktop environment using `disko-install`

```sh
sudo nix --experimental-features "nix-command flakes" \
run 'github:nix-community/disko/latest#disko-install' -- \
--write-efi-boot-entries \
--flake 'github:danielscf/nixos-config#vm' \
--disk main /dev/sda \
--mount-point /mnt 
```

## WSL Setup

Install nixos-wsl and run

```sh
sudo nixos-rebuild switch --flake 'github:danielscf/nixos-config#wsl'
```