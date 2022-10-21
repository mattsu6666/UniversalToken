#!/bin/sh

OS="`uname`"

if [[ "$OS" =~ ^darwin ]]; then
  which yarn >/dev/null 2>&1
  if [ $? -ne 0 ]; then
    brew install yarn
  fi

  which nvm >/dev/null 2>&1
  if [ $? -ne 0 ]; then
    brew install nvm
  fi
elif [[ "$OS" =~ ^linux ]]; then
  which yarn >/dev/null 2>&1
  if [ $? -ne 0 ]; then
    npm install --global yarn
  fi

  which nvm >/dev/null 2>&1
  if [ $? -ne 0 ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
  fi
fi

source ~/.nvm/nvm.sh
nvm install v12.22.12
nvm use
yarn
yarn env
