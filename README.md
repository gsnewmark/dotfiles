# gsnewmark's *nix configuration

A set of configuration files for Emacs
([Doom Emacs](https://github.com/hlissner/doom-emacs/tree/develop)), [Fish
shell](https://fishshell.com/),
[Firefox](https://www.mozilla.org/en-US/firefox/new/)/[Tridactyl](https://github.com/tridactyl/tridactyl),
[i3 wm](http://i3wm.org/)/[i3blocks](https://github.com/vivien/i3blocks),
[rofi](https://github.com/DaveDavenport/rofi),
[mpd](http://www.musicpd.org/)/[ncmpcpp](http://ncmpcpp.rybczak.net/),
[ranger file manager](http://ranger.nongnu.org/),
[termite](https://github.com/thestinger/termite),
[zathura](https://pwmt.org/projects/zathura/),
[dunst](https://github.com/knopwob/dunst) and other tools.

## Installation

git, Python 3, and [Fisher](https://github.com/jorgebucaran/fisher) are required
for the installation.

```
git clone git@gitlab.com:gsnewmark/dotfiles.git
cd dotfiles
git submodule init
git submodule update
./bootstrap
fisher
```

## License

Configuration is licensed under the MIT license, available at
[MIT](http://opensource.org/licenses/MIT) and also in the LICENSE file.

[Doom Emacs](https://github.com/hlissner/doom-emacs/tree/develop) is licensed
under the MIT license (Copyright (c) 2016-2019 Henrik Lissner).

[nord-xresources](https://github.com/arcticicestudio/nord-xresources),
[nord-termite](https://github.com/arcticicestudio/nord-termite) are licensed
under the MIT license (Copyright (c) 2016-present Arctic Ice Studio).

[Tridactyl theme](config/tridactyl/themes/base16-nord.css) is based on Chris
Kempson's (http://chriskempson.com)
[base16-nord](https://github.com/bezmi/base16-tridactyl/blob/092a88c2233c10a1b28cad647b2bf3fd667aaa84/base16-nord.css).
