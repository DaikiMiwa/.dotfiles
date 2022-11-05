# vim-plugのインストール
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# homebrewのインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile
# すぐにコマンドが使えるように呼び出し
. /Users/$(whoami)/.zprofile

# chromeのインストール
brew install google-chrome

# itermのインストール
brew install iterm2

# git のインストール
brew install git

# pythonのインストール

# tex関連のインストール
brew install basictex
sudo tlmgr update --self --all
sudo tlmgr paper a4
sudo tlmgr install collection-langjapanese

