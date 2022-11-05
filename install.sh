# vim-plugのインストール
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# シンボリックリンクを貼る
ln -sf ~/.dotfiles/.vim/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.latex/.latexmkrc ~/.latexmkrc
ln -sf ~/.dotfiles/.zsh/.zshrc ~/.zshrc

# homebrewのインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile

# すぐにコマンドが使えるように呼び出し
. /Users/$(whoami)/.zprofile

# google driveの導入
brew install google-backup-and-sync

# chromeのインストール
brew install google-chrome

# itermのインストール
brew install iterm2

# git のインストール
brew install git

# pyenvのインストール
brew install pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
source ~/.zshrc

pyenv install 3.10.6
pyenv global 3.10.6

# tex関連のインストール
brew install basictex
sudo tlmgr update --self --all
sudo tlmgr paper a4
sudo tlmgr install collection-langjapanese

# slackのインストール
brew install slack

# python開発環境関連
# pi
pip install flake 8
