# Overview

Outlines installation and bug fixes when using `wezterm` on Linux Fedora

## Installation

For Fedora, it's as simple as running these commands:

```sh
sudo dnf copr enable wezfurlong/wezterm-nightly -y &&
sudo dnf install wezterm -y
```

If you're not on Fedora, refer to this [documentation](https://wezterm.org/install/linux.html)

Side note, if this is the first time installing wezterm on the machine you're on, look onto the section below to patch some weird behaviors on wezterm.

After that, do this command to use my sane defaults (don't forget to install the fonts!):

```sh
mkdir -p ~/.config/wezterm/ && \
cp linux/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
```

## Wezterm Variables Displayed on Terminal

In Fedora 43, using `wezfurlong/wezterm-nightly` Copr would result in wezterm vars being displayed on the terminal when inside a `neovim` instance and using `tmux`. Message looks like this:

```txt
1337;SetUserVar=WEZTERM_PROG=1337;SetUserVar=WEZTERM_USER=bmljYjExMg==1337;SetUserVar=WEZTERM_IN_TMUX=MQ==1337;SetUserVar=WEZTERM_HOST=ZmVkb3JhLTQzLXZt7;file://f...
```

To fix that, refer to this [GitHub](https://github.com/wezterm/wezterm/issues/5007#issuecomment-2481674933) issue.

In summary, run these commands:

```sh
sudoedit /etc/profile.d/wezterm.sh
```

And insert this text before L23:
```
if [ -n "$NVIM" ]; then
  WEZTERM_SHELL_SKIP_ALL=1
fi

```

Then kill the tmux server and source the latest shell. Everything should work just fine. You probably need to do this every updates happening on wezterm. Enjoy!
