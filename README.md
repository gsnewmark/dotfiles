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
cryptsetup -y -v luksFormat /dev/nvme0n1p2
cryptsetup open /dev/nvme0n1p2 cryptroot
mkfs.ext4 -L root /dev/mapper/cryptroot
mount /dev/mapper/cryptroot /mnt
```

And finish by creating a filesystem on the boot partition and mounting it:

``` shell
mkfs.fat -F32 /dev/nvme0n1p1
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot
```

### Installing

Checkout dotfiles:

TODO check if this actually works :see_no_evil:
``` shell
mkdir -p /mnt/home/gsnewmark/
cd /mnt/home/gsnewmark/
nix-env -iA nixos.git
git clone -b nixos --recursive git@github.com:gsnewmark/dotfiles.git .dotfiles
cd .dotfiles
ln -s .dotfiles /etc/dotfiles
```

Generate default config to adjust the hardware configuration in dotfiles:

``` shell
nixos-generate-config --root /mnt
```

Install the system:

``` shell
./mnt/etc/dotfiles/deploy <orithena/hyperion>
```

Chroot and set password for the created user:

``` shell
nixos-enter
passwd gsnewmark
chown -R gsnewmark:users /home/gsnewmark/.dotfiles
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
[MIT](http://opensource.org/licenses/MIT) and also in the LICENSE file.

Installation instructions are based on the [@martijnvermaat
post](https://gist.github.com/martijnvermaat/76f2e24d0239470dd71050358b4d5134#partitioning),
[ArchLinux
wiki](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LUKS_on_a_partition)
and [NixOS manual](https://nixos.org/nixos/manual/).

NixOS deploy script and some of the configs are based on the Henrik Lissner's
[dotfiles](https://github.com/hlissner/dotfiles/tree/nixos) which is licensed
under the MIT license (Copyright (c) 2016-2020 Henrik Lissner).

[Doom Emacs](https://github.com/hlissner/doom-emacs/tree/develop) is licensed
under the MIT license (Copyright (c) 2016-2020 Henrik Lissner).

[nord-xresources](https://github.com/arcticicestudio/nord-xresources),
[nord-termite](https://github.com/arcticicestudio/nord-termite) are licensed
under the MIT license (Copyright (c) 2016-present Arctic Ice Studio).

[Tridactyl theme](config/tridactyl/themes/base16-nord.css) is based on Chris
Kempson's (http://chriskempson.com)
[base16-nord](https://github.com/bezmi/base16-tridactyl/blob/092a88c2233c10a1b28cad647b2bf3fd667aaa84/base16-nord.css).
