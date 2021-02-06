#!/bin/bash


# Brew lists to install

BREWS=(
    angular-cli 
    ant
    autoconf
    awscli
    azcopy
    azure-cli
    azure-functions-core-tools
    bash
    bash-completion
    boost
    curl
    dfc
    figlet
    freetype
    gpg
    git
    git-crypt
    gh
    gnutls
    go
    gotop
    hub
    handbrake
    helm
    highlight
    htop
    jenv
    kafka
    kubernetes-cli
    mas
    maven
    minikube
    neofetch
    neovim
    node
    nvim
    openssl
    openjdk
    openjdk@8
    openjdk@11
    python
    powerlevel9k
    powerlevel10k
    rustup-init
    terraform
    tmux
    toilet
    tree
    vf
    wget
    wireshark
    zsh
    zsh-syntax-highlighting
)
CASKS=(
    alacritty
    amazon-chime
    android-studio
    azure-data-studio
    bot-framework-emulator
    cyberduck
    docker
    dropbox
    dotnet-sdk
    eclipse-java
    firefox
    github
    google-chrome
    goland
    handbrake
    intellij-idea
    istat-menus
    iterm2
    kitematic
    microsoft-azure-storage-explorer
    microsoft-edge
    microsoft-teams
    musicbrainz-picard
    mysqlworkbench
    ngrok
    obs
    postman
    powershell
    slack
    sql-power-architect-jdbc
    transmission
    virtualbox
    vagrant
    visual-studio-code
    vlc
    xquartz
    webex-meetings
    wireshark
    yacreader
    zoomus
)
FONTS=(
    font-anonymous-pro
    font-fira-code
    font-hack-nerd-font
    font-inconsolata
    font-input
    font-liberation-sans
    font-meslo-lg
    font-nixie-one
    font-office-code-pro
    font-pt-mono
    font-raleway
    font-roboto
    font-source-code-pro
    font-source-sans-pro
    font-ubuntu
)
MAS=(
    405399194   #Kindle
    497799835   #Xcode
    409183694   #Keynote
    408981434   #iMovie
    982124349   #FLAC MP3 Converter
    1295203466  #Microsoft Remote Desktop
    441258766   #Magnet
    434808346   #SimpleMind Pro
    409201541   #Pages
    682658836   #GarageBand
    1274494218  #iFlicks 3 
    409203825   #Numbers
    1274495053  #Microsoft To-Do 
)

echo "Configuring Brew Taps"
# Brew Taps
brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew tap azure/functions
echo "Brew Taps configured"

echo "Installing brew packages"
# Install Brew Packages
brew install ${BREWS[@]} 
echo "Brew Apps Installed"

# Install MacOS Applications via Brew Casks
echo "Installing apps from Brew casks"
brew install --cask ${CASKS[@]}

# Install Fonts via brew
echo "Installing brew fonts"
brew cask install ${FONTS[@]}

#Install Mac Appstore Apps
echo "Installing apps from Mac Appstore"
mas install ${MAS[@]}

echo "Done Installing apps and utilities"
