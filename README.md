# dotfiles

Here is a bunch of config files for my development environment. I use them to set up a new machine or to keep my current environment in sync.

## SSH Key Setup

Make sure to run these command to setup the SSH key files permissions (if created by copy-pasting):

```sh
chmod 600 ~/.ssh/<key> &&
chmod 600 ~/.ssh/<key>.pub
```

## Karabiner-Elements

Copy the `karabiner.json` file to `~/.config/karabiner/` to enable the custom keybindings.
Run this command:

```bash
cp karabiner.json ~/.config/karabiner/
```

## .vimrc

Copy the `.vimrc` file to `~/.vimrc` to enable the custom vim settings.
Run this command:

```bash
cp .vimrc ~/.vimrc
```

## .tmux.conf

Copy the `.tmux.conf` file to `~/.tmux.conf` to enable the custom tmux settings.
Run this command:

```bash
cp .tmux.conf ~/.tmux.conf
```

Open up `tmux` session and run `prefix + I` to install the plugins.

## Wez Furlong's Terminal

Copy the `wezterm.lua` file to `~/.config/wezterm/` to enable the custom terminal settings.
Run this command:

```bash
cp wezterm.lua ~/.config/wezterm/
```
