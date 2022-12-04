# vim-plug for vimのインストール
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo chown $USER 

# vim-plug for nvimのインストール
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# nvim用の設定ファイルの作成
mkdir ~/.config
mkdir ~/.config/nvim
ln -sf ~/.dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim

# シンボリックリンクを貼る
ln -sf ~/.dotfiles/.vim/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.latex/.latexmkrc ~/.latexmkrc
ln -sf ~/.dotfiles/.zsh/.zshrc ~/.zshrc


# homebrewのインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile

# すぐにコマンドが使えるように呼び出し
source ~/.zprofile

# google drive,dropboxのインストール
brew install google-backup-and-sync
brew install dropbox

# chromeのインストール
brew install google-chrome

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
sudo tlmgr install latexmk

# slackのインストール
brew install slack

# python開発環境関連
pip install flake8
pip install black
pip install mypy

# mouseの速度を早くする
defaults write "Apple Global Domain" com.apple.mouse.scaling 18.0
