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

#### Update Git

Install KeepassXC (and Nextcloud, optional).  Enable SSH Agent in Keepass.  Right-click on Home key and select "Add key to SSH Agent".

.ssh/config
```sh
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
```

Run `ssh-add -l` to verify.

Update the dotfiles repo local config user email to `jlong4096@gmail.com`.  Without this step, later commits may be associated with the work email address setup in the global config.

```sh
git config user.email jlong4096@gmail.com
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

In Neovim, run `:PackerSync` or `:PackerCompile`.  Run `:Mason` to install language servers, linters, formatters, etc.

TODO:  Preconfigure Mason with preferred language servers, linters, formatters, etc.  Current list includes:
    ◍ bash-language-server bashls
    ◍ black
    ◍ css-lsp cssls
    ◍ eslint_d
    ◍ flake8
    ◍ gofumpt
    ◍ goimports
    ◍ golangci-lint
    ◍ golangci-lint-langserver
    ◍ golines
    ◍ gopls
    ◍ graphql-language-service-cli graphql
    ◍ html-lsp html
    ◍ isort
    ◍ ltex-ls ltex
    ◍ lua-language-server lua_ls
    ◍ prettierd
    ◍ prisma-language-server prismals
    ◍ python-lsp-server pylsp
    ◍ shfmt
    ◍ stylua
    ◍ taplo
    ◍ typescript-language-server ts_ls
    ◍ vim-language-server vimls
