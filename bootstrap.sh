#!/usr/bin/env zsh

cp -R shell/ ~/.shell/
cp .gitconfig ~/.gitconfig
cp .gitignore ~/.gitignore

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
"
