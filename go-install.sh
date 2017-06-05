#!/bin/bash

#git clone https://github.com/syndbg/goenv.git ~/.goenv

# not confirmed
#echo 'export GOENV_ROOT="$HOME/.goenv"' >> ~/.zshenv
#echo 'export PATH="$HOME/.goenv/bin:$PATH"' >> ~/.zshenv
# it dont good
#exec $SHELL

#goenv install 1.8.3
#goenv global 1.8.3
#goenv rehash
curl -O https://storage.googleapis.com/golang/go1.8.darwin-amd64.tar.gz
tar -C /usr/local/src -xzf go1.8.darwin-amd64.tar.gz

echo 'export GOROOT="/usr/local/src/go"' >> ~/.zshrc
echo 'export PATH="$GOROOT/bin:$PATH"' >> ~/.zshrc
exec $SHELL -l

git config --global ghq.root ~/go/src

go get github.com/motemen/ghq
