# Dotfiles

Here is a bunch of config files for my development environment. These are used to setup new physical/virtual machines that I use because I'm not bothered enough to use NixOS and its declarative package manager, it's a rabbit-hole on its own :)

One thing though, this README is written with Linux Fedora in mind, so MacOS commands, etc. are not written/updated. Expect things to break on MacOS.

## Git

Using Version Control System (VCS) is a required skill to be working in the Software Engineering domain. If you can't use one, you're cooked man.

### SSH Key Setup

Make sure to run these command to setup the SSH key files permissions (if created by copy-pasting):

```sh
chmod 600 ~/.ssh/<key> &&
chmod 600 ~/.ssh/<key>.pub
```

If you didn't copy-paste the SSH keys, you can just run this command to generate a new one. Taken from [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

```sh
ssh-keygen -t ed25519-sk -C "your_email@example.com"
```

### Git Sensible Defaults

Run these commands to set everything needed to get started quickly:

```sh
git config --global user.email "your_email@example.com" && \
git config --global user.name "your full name" && \
git config --global init.defaultbranch "main" && \
git config --global gpg.format ssh && \
git config --global user.signingkey ~/.ssh/<key>.pub && \
git config --global commit.gpgsign true
```

This can be run immediately, assuming that they secret key has been added to GitHub

References: [Sign commits with SSH keys](https://docs.gitlab.com/user/project/repository/signed_commits/ssh/)

### Using SSH Key to Authenticate to GitHub

Make sure you copy the default config located at `universal/ssh-config` into your SSH config directory using this command:

```sh
cp universal/ssh-config ~/.ssh/config
```

Make sure to update it accordingly as placeholder values are used there :)

## Z Shell (zsh)

Linux comes with Bash installed as the default shell, but that shell sucks man, so let's install zsh and set it as the default shell:

```sh
sudo dnf install zsh -y && \
chsh -s $(which zsh) && \
exec zsh # open up zsh immediately
```

When you open up the zsh instance for the first time, you are asked to configure the defaults, etc. I only change the keyboard-editing mode to `vi` mode cuz i like terminals lol, and make sure to save whatever you have set so you get a default `~/.zshrc` file.

### OMZ on Z Shell (zsh) 

Install [OMZ](https://ohmyz.sh/):

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Then install the cracked plug-ins:

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting && \
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```

Head on to your `~/.zshrc` file and replace `plugins=(git)` with:

```
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  fast-syntax-highlighting
)
```

Voila, you get a cracked terminal, but there's more to it, read on below.

### Extra Binaries for ZSH

List of things to install to make your terminal experience great:

- [jesseduffield/lazygit](https://github.com/jesseduffield/lazygit) -> Terminal-based UI to run git commands
- [sdkman](https://sdkman.io/) -> Java version manager
- [pyenv/pyenv](https://github.com/pyenv/pyenv) -> Python version manager
- [nvm-sh/nvm](https://github.com/nvm-sh/nvm) -> Node version manager
- [junegunn/fzf](https://github.com/junegunn/fzf) -> Fuzzy-searching in the terminal. Requires `ripgrep` (`sudo dnf install rg -y` IIRC)
- [junegunn/fzf-git.sh](https://github.com/junegunn/fzf-git.sh) -> Plug-in for fzf, to filter git-related files
- [ajeetdsouza/zoxide](https://github.com/ajeetdsouza/zoxide) -> `cd`, but on steroids
- [eza-community/eza](https://github.com/eza-community/eza) -> Better `ls`

## VI, VIM, and NVIM

Most of the time, basic Linux installation has `vi` pre-installed, so i'd usually install `nvim` and then set an alias of `vim="nvim"`. Just copy-paste this:

```sh
sudo dnf install neovim -y && \
echo 'alias vim="nvim"' >> ~/.zshrc # append some settings to your zsh
```

Run these commands to setup the defaults for both `vi`, `vim`, and `nvim` settings.

```sh
cp ./universal/.exrc ~/ && \
cp ./universal/.vimrc ~/
```

One caveat though, for `nvim`, you gotta pull my git repo for [nvim](https://github.com/nbean452/nvim-config) using this command:

```sh
git clone github:/nbean452/nvim-config ~/.config/nvim
```

Then run Neovim, it'll automatically install all the plugins, etc. How to use Neovim? out of this documentation's scope :)

## Terminal Multiplexer (TMUX)

You're almost done, just a few more items to check and your terminal will be awesum.

Copy the `.tmux.conf` file to `~/.tmux.conf` to enable the custom tmux settings. Run this command:

```sh
cp .tmux.conf ~/.tmux.conf
```

After that, you need to install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) using this command:

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Once that's done, just open a new tmux session (e.g., `tmux new -s session`) and run `prefix + I` to install the plugins.

After that, head on to configuring `wezterm`, a nice terminal emulator for linux :)
