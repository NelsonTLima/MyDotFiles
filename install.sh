echo "Installing Homebrew"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing Oh My Zsh"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing tmux"

brew install tmux

echo "installing NodeJs"

brew install node

echo "installing ngrok"

brew install ngrok

echo "Installing VS Code"

brew cask install visual-studio-code
