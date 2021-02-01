#!/usr/bin/env zsh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade

brew install fzf # Required for gcob function (git branch hotness)

brew install rbenv ruby-build

brew cleanup
