#!/bin/sh

if ! [ -e ~/dotfiles ]; then
  echo "Download dotfiles git repository."
  git clone git@github.com:yuta-hayashi/dotfiles
fi

file_names=(".zshrc" ".zimrc" ".p10k.zsh")

for file_name in ${file_names[@]}; do
  if [ -e ~/$file_name ]; then
    mv ~/$file_name ~/$file_name.old
  fi

  ln -s ~/dotfiles/$file_name ~/$file_name
done

# install zim
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
