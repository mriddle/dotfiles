#!/usr/bin/env zsh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# One-off load, bootstrap.sh will take care of it going forward
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew upgrade

brew install fzf # Required for gcob function (git branch hotness)

brew install rbenv ruby-build

brew cleanup
