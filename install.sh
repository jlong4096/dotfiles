symlink() {
  ln -svf $PWD/$1  $HOME/$1
}

echo "Script should be run as source; ie, 'source ./install.sh'"

if [[ ! -d ${ZSH:-~/.oh-my-zsh} ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

symlink .hyper.js
symlink .aliases
symlink .zshrc
symlink .vimrc
symlink .bash_profile

ln -svf $PWD/prompt/common.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/common.zsh-theme

if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

source ~/.zshrc
