### Setup

```sh
$ apt install fonts-firacode curl zsh neovim kitty nvm
$ chsh	# Input /bin/zsh
$ touch .env_vars
$ # Do the following if not done automatically by apt.
$ sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
$ sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
$ sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
```

#### Mac

```sh
brew install --cask font-fira-code
brew install nvm
mkdir ~/.nvm # Install script below should link a .zshrc with the additional env setup.
nvm install --lts
nvm use --lts
brew install neovim
brew install kitty
```

#### Installation

```sh
$ source ./install.sh
```

