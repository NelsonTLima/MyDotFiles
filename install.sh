#!/bin/bash

case $OSTYPE in linux*)

	echo "Installing Nelson's dev environment for Linux"

	echo "installing ZSH"

	sudo apt install zsh

	echo "installing Git"

	sudo apt install git

	echo "Installing tmux"

	sudo apt install tmux

	echo "installing NodeJs"

	sudo apt install nodejs

	echo "installing ngrok"

	sudo apt install ngrok

	echo "installing open-ssh"

	sudo apt-get install openssh-server
	sudo apt-get install openssh-client

	echo "copying dotfiles"

	sudo cp ~/MyDotFiles/zshrclinux ~/.zshrc
	sudo cp ~/MyDotFiles/.vimrc ~/
	;;

darwin*)

	echo "Installing Nelson's dev environment for Mac"

	echo "installing homebrew"

	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	echo "installing full and updated vim"

	brew install vim

	echo "installing git"

	brew install git

	echo "Installing tmux"

	brew install tmux

	echo "installing NodeJs"

	brew install nodejs

	echo "installing ngrok"

	brew install ngrok

	echo "installing openssh"

	brew install openssh-server
	brew install openssh-client

	echo "copying dotfiles"

	sudo cp ~/MyDotFiles/.zshrc ~/.zshrc
	sudo cp ~/MyDotFiles/.vimrc ~/
	;;
esac

echo "Installing Oh My Zsh"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "installing auto-suggestions"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "installing NERDTree"

git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q

echo "installing identLime"

git clone https://github.com/Yggdroot/indentLine.git ~/.vim/pack/vendor/start/indentLine
vim -u NONE -c "helptags  ~/.vim/pack/vendor/start/indentLine/doc" -c "q"

echo "installing vim-code-dark - a vscode theme for VIM"

mkdir -p ~/.vim/pack/themes/start
cd ~/.vim/pack/themes/start
git clone https://github.com/tomasiser/vim-code-dark

echo "installing airline"

git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline

echo "instaling GitGutter"

mkdir -p ~/.vim/pack/airblade/start
cd ~/.vim/pack/airblade/start
git clone https://github.com/airblade/vim-gitgutter.git
vim -u NONE -c "helptags vim-gitgutter/doc" -c q

echo "installing vim-plug"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
