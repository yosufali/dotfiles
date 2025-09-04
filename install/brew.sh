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
brew tap FelixKratz/formulae
brew tap hashicorp/tap
brew tap supabase/tap

apps=(
  awscli
  borders
  codex
  deno
  go
  helm
  htop
  kubectl
  minikube
  neovim
  nmap
  node
  nvm
  ollama
  pre-commit
  pytest
  stats
  stow
  tmux
  tree
  uv
  vim

  hashicorp/tap/terraform
  stripe/stripe-cli/stripe
  supabase/tap/supabase
)

brew install "${apps[@]}"

cask_apps=(
  chatgpt
  claude
  cursor
  dbeaver-community
  docker
  ghostty
  google-chrome
  google-cloud-sdk
  insomnia
  neo4j
  obsidian
  postico
  pycharm-ce
  raspberry-pi-imager
  rectangle
  screen-studio
  sdformatter
  slack
  todoist
  visual-studio-code
  wireshark

  nikitabobko/tap/aerospace
)

brew install --cask "${cask_apps[@]}"
