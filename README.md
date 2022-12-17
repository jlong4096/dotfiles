### Setup

```sh
$ apt install fonts-firacode curl zsh neovim kitty
$ chsh	# Input /bin/zsh
$ touch .env_vars
$ # Do the following if not done automatically by apt.
$ sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
$ sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
$ sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
```

### Installation

```sh
$ source ./install.sh
```

### Font

FiraCode Nerd Font

```sh 
$ brew tap homebrew/cask-fonts && brew install --cask font-fira-code-nerd-font
```
