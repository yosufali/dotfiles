#!/bin/bash

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# is_mac=$(["$(uname)" = "Darwin" ] && echo true || echo false)

# add homebrew to path
# if [[ is_mac == true ]]; then
echo >> ~/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
# else
#   test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
#   test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
#   echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc
# fi

brew update
brew upgrade
brew analytics off

apps=(
  htop
  nvm
  ollama
  pyenv
  pyenv-virtualenv
  stow
  tmux
  vim
)

# TODO: move to it's own file
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

brew install "${apps[@]}"

cask_apps=(
  visual-studio-code
)

brew install --cask "${cask_apps[@]}"
