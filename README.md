### Setup

```sh
$ apt install fonts-firacode curl zsh neovim
$ chsh	# Input /bin/zsh
$ touch .env_vars
$ # Do the following if not done automatically by apt.
$ sudo update-alternative --install /usr/bin/vi vi /usr/bin/nvim
$ sudo update-alternative --install /usr/bin/vim vim /usr/bin/nvim
$ sudo update-alternative --install /usr/bin/editor editor /usr/bin/nvim
```

### Installation

```sh
$ source ./install.sh
```
