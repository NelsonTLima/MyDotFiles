echo "installing ZSH"

sudo apt install zsh

echo "Installing Oh My Zsh"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "installing auto-suggestions"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "installing git"

brew install git

echo "installing NERDTree"

git clone https://github.com/NelsonTLima/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q

echo "installing vim-code-dark - a vscode theme for VIM"

mkdir -p ~/.vim/pack/themes/start
cd ~/.vim/pack/themes/start
git clone https://github.com/NelsonTLima/vim-code-dark

echo "installing airline"

git clone https://github.com/NelsonTLimavim-airline ~/.vim/pack/dist/start/vim-airline

echo "instaling GitGutter"

mkdir -p ~/.vim/pack/airblade/start
cd ~/.vim/pack/airblade/start
git clone https://github.com/NelsonTLima/vim-gitgutter.git
vim -u NONE -c "helptags vim-gitgutter/doc" -c q

echo "copying dotfiles"
sudo cp ~/MyDotFiles/zshrclinux ~/.zshrc
sudo cp ~/MyDotFiles/.vimrc ~/

echo "installing zsh auto-sugesstions"

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions


echo "Installing tmux"

sudo apt install tmux

echo "installing NodeJs"

sudo apt install nodejs

echo "installing ngrok"

sudo apt install ngrok
