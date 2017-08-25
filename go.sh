#!/bin/bash

which brew > /dev/null
export HAS_BREW=$?

if [ $HAS_BREW -ne 0 ]; then
	echo "Installing homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	echo "Installing git via brew..."
	brew install git

	echo "Installing zsh via brew..."
	brew install zsh
fi

if [ ! -d "$HOME/.oh-my-zsh/" ]; then
	echo "Installing oh-my-zsh..."
	git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
	
	echo -n
	ln -nsf ~/.dotfiles/zshrc ~/.zshrc

	if [ -e "/usr/local/bin/zsh" ]; then
		sudo sh -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
		chsh -s /usr/local/bin/zsh
	else
		chsh -s /bin/zsh
	fi
fi

if [ -d "$HOME/Library/Application Support/Code" ]; then
	echo "VSCode found, linking configs..."
	ln -nsf ~/.dotfiles/Code/settings.json ~/Library/Application\ Support/Code/User/settings.json
	ln -nsf ~/.dotfiles/Code/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
	ln -nsf ~/.dotfiles/Code/snippets ~/Library/Application\ Support/Code/User/snippets
fi

