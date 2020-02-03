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

git, [GNU Stow](https://www.gnu.org/software/stow/), and
[Fisher](https://github.com/jorgebucaran/fisher) are required for the
installation:

```shell
git clone --recursive git@github.com:gsnewmark/dotfiles.git
cd dotfiles

stow foundation
stow desktop_environment
stow development
stow web
stow media
stow extras

# TODO fisher
```

To remove a particular configuration module use stow's `-D` option:

``` shell
stow -D foundation
```

## License

Configuration is licensed under the MIT license, available at
[MIT](http://opensource.org/licenses/MIT) and also in the LICENSE file.

NixOS deploy script and some of the configs are based on the Henrik Lissner's
[dotfiles](https://github.com/hlissner/dotfiles/tree/nixos) which is licensed
under the MIT license (Copyright (c) 2016-2019 Henrik Lissner).

[Doom Emacs](https://github.com/hlissner/doom-emacs/tree/develop) is licensed
under the MIT license (Copyright (c) 2016-2019 Henrik Lissner).

[nord-xresources](https://github.com/arcticicestudio/nord-xresources),
[nord-termite](https://github.com/arcticicestudio/nord-termite) are licensed
under the MIT license (Copyright (c) 2016-present Arctic Ice Studio).

[Tridactyl theme](config/tridactyl/themes/base16-nord.css) is based on Chris
Kempson's (http://chriskempson.com)
[base16-nord](https://github.com/bezmi/base16-tridactyl/blob/092a88c2233c10a1b28cad647b2bf3fd667aaa84/base16-nord.css).
