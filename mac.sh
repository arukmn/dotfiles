#!/bin/bash

# homebrew
echo "Installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "Run brew update..."
which brew >/dev/null 2>&1 && brew update

echo $(tput setaf 2)OK. run brew upgrade. ✔︎$(tput sgr0)

# packages
brew upgrade --all

formulas=(
    git
    wget
    curl
    tree
    "--without-etcdir zsh"
    cask
    ansible
    peco
    tig
    lua
    "vim --with-lua"
    mysql
    ghq
    hub
)

"Brew tap..."
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap sanemat/font

echo "Start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

# cask
casks=(
    google-chrome
    google-japanese-ime
    slack
    alfred
    iterm2
    atom
    sequal-pro
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew cask install $cask
done

brew cleanup
brew cask cleanup

echo $(tput setaf 2)Complete Homebrew installing. ✔︎$(tput sgr0)
