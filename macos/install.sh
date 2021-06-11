# before running this script remember to run 
# xcode-select --install

CURRENT_DIR=$(pwd -P)

# Homebrew (https://brew.sh/)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install --cask google-chrome
brew install --cask slack
brew install --cask microsoft-teams
brew install --cask zoom
brew install --cask visual-studio-code
brew install --cask virtualbox
brew install --cask vagrant
brew install --cask rectangle
brew install --cask spotify
brew install --cask karabiner-elements

brew install --cask --no-quarantine alacritty 
git clone https://github.com/alacritty/alacritty.git /tmp/alacritty
cd /tmp/alacritty
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
cd $CURRENT_DIR 
rm -rf /tmp/alacritty

brew install tmux
brew install jq
brew install autoconf
brew install wxmac
brew install gpg
brew install gawk
brew install svn
brew install neovim
brew install nnn
brew install azure-cli
brew tap azure/functions
brew install azure-functions-core-tools@3
brew install telnet

brew tap homebrew/cask-fonts
brew install --cask font-source-code-pro

# ASDF
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0

asdf plugin-add dotnet-core https://github.com/emersonsoares/asdf-dotnet-core.git
asdf plugin-add nodejs 
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin-add elm https://github.com/asdf-community/asdf-elm.git

asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git
asdf plugin-add kubectl https://github.com/Banno/asdf-kubectl.git
asdf plugin-add helm https://github.com/Antiarchitect/asdf-helm.git



