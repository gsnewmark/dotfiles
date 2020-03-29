# gsnewmark's *nix configuration

A set of [NixOS](https://nixos.org/)-based system definitions & configuration
files for Emacs ([Doom
Emacs](https://github.com/hlissner/doom-emacs/tree/develop)), [Fish
shell](https://fishshell.com/),
[Firefox](https://www.mozilla.org/en-US/firefox/new/)/[Tridactyl](https://github.com/tridactyl/tridactyl),
[i3 wm](http://i3wm.org/)/[i3blocks](https://github.com/vivien/i3blocks),
[rofi](https://github.com/DaveDavenport/rofi),
[mpd](http://www.musicpd.org/)/[ncmpcpp](http://ncmpcpp.rybczak.net/), [ranger
file manager](http://ranger.nongnu.org/),
[termite](https://github.com/thestinger/termite),
[zathura](https://pwmt.org/projects/zathura/),
[dunst](https://github.com/knopwob/dunst) and other tools.

## Installation

### Preparing encrypted partition

Start with adding boot and root partitions with `gdisk /dev/nvme0n1` and then
- `o` (create new empty partition table)
- `n` (add partition, start at default, end at +512M, type ef00 EFI)
- `n` (add partition, start at default and use all remaining space, type 8300 Linux LVM)
- `w` (write partition table and exit)

Follow it by encrypting the root one:

``` shell
sudo cryptsetup -y -v luksFormat /dev/nvme0n1p2
sudo cryptsetup open /dev/nvme0n1p2 cryptroot
sudo mkfs.ext4 -L root /dev/mapper/cryptroot
sudo mount /dev/mapper/cryptroot /mnt
```

And finish by creating a filesystem on the boot partition and mounting it:

``` shell
sudo mkfs.fat -F32 /dev/nvme0n1p1
sudo mkdir /mnt/boot
sudo mount /dev/nvme0n1p1 /mnt/boot
```

### Installing NixOS

Checkout dotfiles without sub-modules for the initial installation:

``` shell
sudo nix-env -iA nixos.git
cd /mnt/etc
sudo git clone -b nixos https://github.com/gsnewmark/dotfiles.git
```

Generate default config to check the hardware config and adjust the one in
the dotfiles:

``` shell
sudo nixos-generate-config --root /mnt
```

Install the system:

``` shell
sudo ./mnt/etc/dotfiles/deploy <orithena/hyperion>
```

### Post-installation cleanup

Chroot and set password for the created user:

``` shell
sudo nixos-enter
passwd gsnewmark
```

Actually check out dotfiles _for the created user_ and link them to the system's
`configuration.nix`:

``` shell
cd ~
git clone -b nixos --recursive git@github.com:gsnewmark/dotfiles.git .dotfiles
cp /etc/dotfiles/hardware-configuration.<host>.nix dotfiles/hardware-configuration.<host>.nix
sudo rm -rf /etc/dotfiles
sudo ln -s /home/gsnewmark/.dotfiles /etc/dotfiles
```

### Linking dotfiles

I use [GNU Stow](https://www.gnu.org/software/stow/) to manage the dotfiles:

```shell
mkdir -p ~/{bin,.config}
stow --target=/home/gsnewmark/bin bin
stow --dir=config --target=/home/gsnewmark browser
stow --dir=config --target=/home/gsnewmark desktop
stow --dir=config --target=/home/gsnewmark dev
stow --dir=config --target=/home/gsnewmark emacs
stow --dir=config --target=/home/gsnewmark music
stow --dir=config --target=/home/gsnewmark shell

# TODO fisher
```

### Unlinking dotfiles

To remove a particular configuration module use stow's `-D` option:

``` shell
stow --target=/home/gsnewmark/bin -D bin
stow --dir=config --target=/home/gsnewmark -D browser
stow --dir=config --target=/home/gsnewmark -D desktop
stow --dir=config --target=/home/gsnewmark -D dev
stow --dir=config --target=/home/gsnewmark -D emacs
stow --dir=config --target=/home/gsnewmark -D music
stow --dir=config --target=/home/gsnewmark -D shell
```

## License

Configuration is licensed under the MIT license, available at
[MIT](http://opensource.org/licenses/MIT) and also in the [LICENSE](LICENSE) file.
