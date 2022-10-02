#!/usr/bin/env zsh

ln -s $PWD/shell/ ~/.shell
ln -s $PWD/.gitconfig ~/.gitconfig
ln -s $PWD/.gitignore ~/.gitignore
ln -s $PWD/.irbrc ~/.irbrc

echo "Add the following to your ~/.zshrc:"
echo "
# Executed for
# ✓ login shell
# ✓ interactive shell
# ✘ scripts
# ✓ Terminal.app

source ~/.shell/prompt
source ~/.shell/aliases
source ~/.shell/profile
source ~/.shell/exports
source ~/.shell/private
"
