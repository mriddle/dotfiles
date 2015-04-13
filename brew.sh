#!/usr/bin/env bash

brew update
brew upgrade

brew install hub
brew install ack
brew install git
brew install bash
brew install bash-completion

brew install rbenv rbenv-gem-rehash ruby-build

brew install postgres

brew cleanup
