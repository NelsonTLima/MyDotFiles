#!/bin/bash

case $OSTYPE in linux*)

	echo "INSTALLING NELSON'S ENVIROGNMENT FOR LINUX\n\n"

	echo "INSTALLING ZSH\n\n"

	sudo apt install zsh

	echo "\n\nINSTALLING GIT\n\n"

	sudo apt install git

	echo "\n\nINSTALLING TMUX\n\n"

	sudo apt install tmux

	echo "\n\nINSTALLING NODEJS\n\n"

	sudo apt install nodejs

	echo "\n\nINSTALLING NGROK\n\n"

	sudo apt install ngrok

	echo "\n\nINSTALLING OPEN-SSH\n\n"

	sudo apt-get install openssh-server
	sudo apt-get install openssh-client

	echo "\n\nINSTALLING MYSLQ-SERVER\n\n"

	sudo apt-get install mysql-server
	sudo systemctl enable mysql

	echo "\n\nCOPYING DOT FILES\n\n"

	sudo cp ~/my-dot-files/zshrclinux ~/.zshrc
	sudo cp ~/my-dot-files/.vimrc ~/
	;;

darwin*)

	echo "\n\nINSTALLING NELSON'S ENVIROGNMENT FOR MAC\n\n"

	echo "\n\nINSTALLING HOMEBREW\n\n"

	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	echo "\n\nINSTALLING VIM COMPILED FOR BREW\n\n"

	brew install vim

	echo "\n\nINSTALLING GIT\n\n"

	brew install git

	echo "\n\nINSTALLING TMUX\n\n"

	brew install tmux

	echo "\n\nINSTALLING NODEJS\n\n"

	brew install nodejs

	echo "\n\nINSTALLING NGROK\n\n"

	brew install ngrok

	echo "\n\nINSTALLING OPEN-SSH\n\n"

	brew install openssh-server
	brew install openssh-client

	echo "\n\nINSTALLING MYSLQ\n\n"

	brew install mysql
	brew services start mysql

	echo "\n\nCOPYING DOT FILES\n\n"

	sudo cp ~/my-dot-files/.zshrc ~/.zshrc
	sudo cp ~/my-dot-files/.vimrc ~/
	;;
esac

echo "INSTALLING RUST"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "\n\nINSTALLING OH MY ZSH\n\n"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "\n\nINSTALLING AUTO-SUGGESTIONS\n\n"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "\n\nMAKING VIM PLUGIN DIRECTORY\n\n"

mkdir ~/.vim/plugin

echo "\n\nVIM - INSTALLING NERDTREE\n\n"

git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q

echo "\n\n VIM - INSTALLING JAVASCRIPT HIGHLIGHT"

git clone https://github.com/pangloss/vim-javascript.git ~/.vim/pack/vim-javascript/start/vim-javascript

echo "\n\nVIM - INSTALLING RUST HIGHLIGHT"

git clone https://github.com/rust-lang/rust.vim ~/.vim/pack/plugins/start/rust.vim

echo "\n\nVIM - INSTALLING IDENTLINE\n\n"

git clone https://github.com/Yggdroot/indentLine.git ~/.vim/pack/vendor/start/indentLine
vim -u NONE -c "helptags  ~/.vim/pack/vendor/start/indentLine/doc" -c "q"

echo "\n\nVIM - INSTALLING AUTOPAIRS\n\n"

git clone https://github.com/jiangmiao/auto-pairs.git ~/.vim/auto-pairs
cp -rf ~/.vim/auto-pairs/plugin/* ~/.vim/plugin
rm -rf ~/.vim/auto-pairs

echo "\n\nVIM - INSTALLING CLOSETAG\n\n"

git clone https://github.com/alvan/vim-closetag.git ~/.vim/vim-closetag
cp -rf ~/.vim/vim-closetag/plugin/* ~/.vim/plugin
rm -rf ~/.vim/vim-closetag

echo "\n\nINSTALLING VIM-CODE-DARK\n\n"

mkdir -p ~/.vim/pack/themes/start
cd ~/.vim/pack/themes/start
git clone https://github.com/tomasiser/vim-code-dark

echo "\n\nVIM - INSTALLING AIRLINE\n\n"

git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline

echo "\n\nVIM - INSTALLING GITGUTTER\n\n"

mkdir -p ~/.vim/pack/airblade/start
cd ~/.vim/pack/airblade/start
git clone https://github.com/airblade/vim-gitgutter.git
vim -u NONE -c "helptags vim-gitgutter/doc" -c q

echo "\n\ninstalling vim fugitive.\n\n"

mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/fugitive.git
vim -u NONE -c "helptags fugitive/doc" -c q

echo "\n\nVIM - INSTALLING PLUG\n\n"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
