#!/bin/bash

# コマンドの有無は今後よく使うので
has() {
  type "$1" > /dev/null 2>&1
}


if has "brew"; then
  echo "exists";
fi

DOT_DIRECTORY="${HOME}/dotfiles"
DOT_TARBALL="https://github.com/koolii/dotfiles/tarball/master"

# ディレクトリがなければダウンロード（と解凍）する
if [ ! -d ${DOT_DIRECTORY} ]; then
  echo "Downloading dotfiles..."
  mkdir ${DOT_DIRECTORY}


  curl -fsSLo ${HOME}/dotfiles.tar.gz ${DOT_TARBALL}
  tar -zxf ${HOME}/dotfiles.tar.gz --strip-components 1 -C ${DOT_DIRECTORY}
  rm -f ${HOME}/dotfiles.tar.gz

  echo $(tput setaf 2)Download dotfiles complete!. ✔︎$(tput sgr0)
fi

sh ${HOME}/dotfiles/mac.sh

# prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done


#ln -sf ${HOME}/dotfiles/_vimrc ~/.vimrc
ln -sf ${HOME}/dotfiles/_zshrc ~/.zshrc

sh ${HOME}/dotfiles/mac.sh

# git
# atom,alfred,spectacle,f.lux,karabiner
# atom-package-manager
# zsh
# prezto
# nvm(node.js:8系?)
# pyenv
# peco
# vimrc
# zshrc
# ssh-keygen
