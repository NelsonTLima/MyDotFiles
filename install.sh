#!/bin/bash
shopt -s xpg_echo

case $OSTYPE in linux*)

	echo -e "\033[33mINSTALLING NELSON'S ENVIROGNMENT FOR LINUX\n\n\033[0m"

	echo "\033[32mINSTALLING ZSH\n\n\033[0m"

	sudo apt install zsh

	echo "\033[32m\n\nINSTALLING GIT\n\n\033[0m"

	sudo apt install git

	echo "\033[32m\n\nINSTALLING TMUX\n\n\033[0m"

	sudo apt install tmux

	echo "\033[32m\n\nINSTALLING NODEJS\n\n\033[0m"

	sudo apt install nodejs

	echo "\033[32m\n\nINSTALLING NGROK\n\n\033[0m"

	sudo apt install ngrok

	echo "\033[32m\n\nINSTALLING OPEN-SSH\n\n\033[0m"

	sudo apt-get install openssh-server
	sudo apt-get install openssh-client

	echo "\033[32m\n\nINSTALLING MYSLQ-SERVER\n\n\033[0m"

	sudo apt-get install mysql-server
	sudo systemctl enable mysql

	echo "\033[32m\n\n...COPYING DOT FILES...\n\033[0m"

	sudo cp zshrclinux ~/.zshrc
	sudo cp .vimrc ~/
	sudo cp .gitignore_global ~/
	;;

darwin*)

	echo -e "\033[33m\n\nINSTALLING NELSON'S ENVIROGNMENT FOR MAC\n\n\033[0m"

	echo "\033[32mINSTALLING HOMEBREW\n\n\033[0m"

	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	echo "\033[32m\n\nINSTALLING VIM COMPILED FOR BREW\n\n\033[0m"

	brew install vim

	echo "\033[32m\n\nINSTALLING GIT\n\n\033[0m"

	brew install git

	echo "\033[32m\n\nINSTALLING TMUX\n\n\033[0m"

	brew install tmux

	echo "\033[32m\n\nINSTALLING NODEJS\n\n\033[0m"

	brew install nodejs

	echo "\033[32m\n\nINSTALLING NGROK\n\n\033[0m"

	brew install ngrok

	echo "\033[32m\n\nINSTALLING MYSLQ\n\n\033[0m"

	brew install mysql
	brew services start mysql

	echo "\033[32m\n\n...COPYING DOT FILES...\n\033[0m"

	sudo cp .zshrc ~/.zshrc
	sudo cp .vimrc ~/
	sudo cp .gitignore_global ~/
	;;
esac

echo "\033[32m\n...CREATING GIT GLOBAL SETTINGS...\033[0m"

sudo git config --global core.excludesfile ~/.gitignore_global

echo "\033[32m\n\nINSTALLING RUST\n\n\033[0m"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "\033[32m\n\nINSTALLING OH MY ZSH\n\n\033[0m"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "\033[32m\n\nINSTALLING AUTO-SUGGESTIONS\n\n\033[0m"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "\033[32m\n\nMAKING VIM PLUGIN DIRECTORY\n\n\033[0m"

mkdir ~/.vim/plugin

echo "\033[32m\n\nVIM - INSTALLING NERDTREE\n\n\033[0m"

git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q

echo "\033[32m\n\nVIM - INSTALLING JAVASCRIPT HIGHLIGHT\n\n\033[0m"

git clone https://github.com/pangloss/vim-javascript.git ~/.vim/pack/vim-javascript/start/vim-javascript

echo "\033[32m\n\nVIM - INSTALLING RUST HIGHLIGHT\n\n\033[0m"

git clone https://github.com/rust-lang/rust.vim ~/.vim/pack/plugins/start/rust.vim

echo "\033[32m\n\nVIM - INSTALLING IDENTLINE\n\n\033[0m"

git clone https://github.com/Yggdroot/indentLine.git ~/.vim/pack/vendor/start/indentLine
vim -u NONE -c "helptags  ~/.vim/pack/vendor/start/indentLine/doc" -c "q"

echo "\033[32m\n\nVIM - INSTALLING CLOSETAG\n\n\033[0m"

git clone https://github.com/alvan/vim-closetag.git ~/.vim/vim-closetag
cp -rf ~/.vim/vim-closetag/plugin/* ~/.vim/plugin
rm -rf ~/.vim/vim-closetag

echo "\033[32m\n\nVIM - INSTALLING AUTO-SAVE\n\n\033[0m"

git clone https://github.com/907th/vim-auto-save.git ~/.vim/vim-auto-save
cp -rf ~/.vim/vim-auto-save/plugin/* ~/.vim/plugin
rm -rf ~/.vim/vim-auto-save

echo "\033[32m\n\nVIM - INSTALLING VIM-CODE-DARK\n\n\033[0m"

mkdir -p ~/.vim/pack/themes/start
cd ~/.vim/pack/themes/start
git clone https://github.com/tomasiser/vim-code-dark

echo "\033[32m\n\nVIM - INSTALLING AIRLINE\n\n\033[0m"

git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline

echo "\033[32m\n\nVIM - INSTALLING GITGUTTER\n\n\033[0m"

mkdir -p ~/.vim/pack/airblade/start
cd ~/.vim/pack/airblade/start
git clone https://github.com/airblade/vim-gitgutter.git
vim -u NONE -c "helptags vim-gitgutter/doc" -c q

echo "\033[32m\n\nVIM - INSTALLING FIGITIVE\n\n\033[0m"

mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/fugitive.git
vim -u NONE -c "helptags fugitive/doc" -c q

echo "\033[32m\n\nVIM - INSTALLING PLUG\n\n\033[0m"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
