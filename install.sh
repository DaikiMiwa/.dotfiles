# 準備
mkdir ~/.local
mkdir ~/.local/bin
echo export PATH=$HOME/.local/bin$PATH >> ~/.bashrc

# nodeとpythonの配置
curl micro.mamba.pm/install.sh | bash
./bin/micromamba shell init -s bash -p ~/micromamba  # this writes to your .bashrc file
source ~/.bashrc
micromamba install 3.10
micromamba shell 3.10

# 仮想環境の配置
mkdir ~/.local/envs
cd ~/.local/envs
python -m venv .env
~/.local/envs/.env/bin/pip install -r ~/.dotfiles/requirements.txt
cd ~
wget https://nodejs.org/dist/v18.13.0/node-v18.13.0-linux-x64.tar.xz && tar xvf node-v18.13.0-linux-x64.tar.gz 
mv node-v18.13.0-linux-x64.tar.gz/* ~.local/

pip install pynvim
npm i -g neovim

# nvim用の設定ファイルの作成
mkdir ~/.config
mkdir ~/.config/nvim
ln -sf ~/.dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

# vim-plug for nvimのインストール
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# neovimの入手
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
mv nvim.appimage ~/.local/bin/nvim

# PlugInのインストール
nvim --headless +PlugInstall +qall

# Coc-PlugInのインストール
COC='coc-pyright coc-json'
cd ~/.config/coc/extensions && npm install $COC --global --only=prod
