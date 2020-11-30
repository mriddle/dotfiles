#!/usr/bin/env zsh

brew update
brew upgrade

brew install hub
brew install ack
brew install git
brew install bash
brew install bash-completion

brew install fzf # Required for gcob function (git branch hotness)

brew install rbenv rbenv-gem-rehash ruby-build

brew install postgres

brew cleanup
