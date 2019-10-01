symlink() {
  ln -svf $PWD/$1  $HOME/$1
}

echo "Script should be run as source; ie, 'source ./install.sh'"
echo "apt install fonts-firacode curl zsh neovim kitty"
echo "chsh; /bin/zsh"
echo ""

if [[ ! -d ${ZSH:-~/.oh-my-zsh} ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [[ ! -e ~/.vim/autoload/plug.vim ]]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [[ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]]; then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

symlink .aliases
symlink .zshrc
symlink .vimrc
symlink .ideavimrc
symlink .bash_profile

mkdir -p ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes
mkdir -p ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins
ln -svf $PWD/prompt/common.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/common.zsh-theme

mkdir -p ~/.config/nvim
ln -svf $PWD/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -svf $PWD/.vimrc ~/.config/nvim/rc.vim

mkdir -p ~/.config/kitty
ln -svf $PWD/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf

if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search ]]; then
    git clone https://github.com/zsh-users/zsh-history-substring-search.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
fi

source ~/.zshrc
