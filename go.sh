#!/bin/bash

which brew > /dev/null
if [ $? -ne 0 ]; then
	echo "Installing homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	echo "Installing git via brew..."
	brew install git

	echo "Installing zsh via brew..."
	brew install zsh
fi

if [ ! -d "$HOME/.oh-my-zsh/" ]; then
	echo "Installing oh-my-zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	ln -nsf ~/.dotfiles/zshrc ~/.zshrc
fi

if [ -d "$HOME/Library/Application Support/Code" ]; then
	echo "VSCode found, linking configs..."
	ln -nsf ~/.dotfiles/Code/settings.json ~/Library/Application\ Support/Code/User/settings.json
	ln -nsf ~/.dotfiles/Code/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
	ln -nsf ~/.dotfiles/Code/snippets ~/Library/Application\ Support/Code/User/snippets
fi

