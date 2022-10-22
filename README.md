# My dotfiles

A set of configuration files for Emacs ([Doom
Emacs](https://github.com/hlissner/doom-emacs/tree/develop)), [Fish
shell](https://fishshell.com/),
[Firefox](https://www.mozilla.org/en-US/firefox/new/)/[Tridactyl](https://github.com/tridactyl/tridactyl),
[alacritty](https://github.com/alacritty/alacritty),
[zathura](https://pwmt.org/projects/zathura/), and other tools.

Setup script installs all the tools I use and meant to be used under the [Pop!_OS](https://pop.system76.com/).

## Installation

### Linking dotfiles

I use [GNU Stow](https://www.gnu.org/software/stow/) to manage the dotfiles:

```shell
mkdir -p ~/{bin,.config}
stow --target=~/bin bin
stow --dir=config --target=~ browser
stow --dir=config --target=~ desktop
stow --dir=config --target=~ dev
stow --dir=config --target=~ emacs
stow --dir=config --target=~ shell
```

### Unlinking dotfiles

To remove a particular configuration module use stow's `-D` option:

``` shell
stow --target=~/bin -D bin
stow --dir=config --target=~ -D browser
stow --dir=config --target=~ -D desktop
stow --dir=config --target=~ -D dev
stow --dir=config --target=~ -D emacs
stow --dir=config --target=~ -D shell
```

## License

Configuration is licensed under the MIT license, available at
[MIT](http://opensource.org/licenses/MIT) and also in the [LICENSE](LICENSE) file.
