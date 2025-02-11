#!/bin/bash
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
brew tap hashicorp/tap
brew tap supabase/tap

apps=(
  awscli
  deno
  go
  helm
  htop
  kubectl
  minikube
  nvm
  ollama
  pyenv
  pyenv-virtualenv
  stow
  tmux
  tree
  vim

  hashicorp/tap/terraform
  supabase/tap/supabase
  stripe/stripe-cli/stripe
)

brew install "${apps[@]}"

cask_apps=(
  dbeaver-community
  docker
  ghostty
  google-chrome
  google-cloud-sdk
  obsidian
  postico
  pycharm-ce
  rectangle
  visual-studio-code
)

brew install --cask "${cask_apps[@]}"
