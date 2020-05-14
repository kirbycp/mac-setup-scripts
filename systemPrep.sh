#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# requires xcode and tools!
xcode-select -p || exit "XCode must be installed! (use the app store)"

# Ask for the administrator password upfront
sudo -v

cd ~

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Chris' Customizations                                                       #
###############################################################################
echo "Hello $(whoami)! Let's get you set up."

echo "Installing oh-my-zsh"
#install oh-my-zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "Finishing installing oh-my-zsh"

echo "Cloning dotfiles from Github"
git clone --bare git@github.com:kirbycp/MacDotFiles.git $HOME/.dotfiles.git
git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME checkout
git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME config --local status.showUntrackedFiles no
git config --global core.excludesfile ~/.gitignore_global
echo "dot files cloned into home directory"

echo "Checking if homebrew is already installed"
# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "No brew found installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo "Brew installed"
fi

echo "Installing Pure Promt"
npm install --global pure-prompt

echo "Installing zsh auto suggestions"
github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo "Got to get my Yoda quotes"
gem install yodaism

echo "Reloading zshrc file"
source ~/.zshrc


echo "Done. Note that some of these changes require a logout/restart to take effect."
