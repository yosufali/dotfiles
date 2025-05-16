#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "\n ${GREEN}Updating & upgrading ${NC}"
sudo apt-get update
sudo apt-get upgrade -y

echo -e "\n ${GREEN}Preparing for installations ${NC}"

initial=(
  apt-transport-https
  curl
  gnupg
  software-properties-common
)
sudo apt-get install --yes "${initial[@]}"

echo -e "\n ${GREEN}Preparing for installations - Helm ${NC}"
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

echo -e "\n ${GREEN}Preparing for installations - Terraform ${NC}"
curl https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

echo -e "\n ${GREEN}Preparing for installations - Stripe ${NC}"
curl -s https://packages.stripe.dev/api/security/keypair/stripe-cli-gpg/public | gpg --dearmor | sudo tee /usr/share/keyrings/stripe.gpg
echo "deb [signed-by=/usr/share/keyrings/stripe.gpg] https://packages.stripe.dev/stripe-cli-debian-local stable main" | sudo tee -a /etc/apt/sources.list.d/stripe.list

sudo apt-get update

apps=(
  awscli
  helm
  htop
  kubectl
  neovim
  nodejs
  stow
  stripe
  terraform
  tmux
  tree
  vim
)

echo -e "\n ${GREEN}Installing listed application ${NC}"
sudo apt-get install -y "${apps[@]}"

# install cli tools without a repository

echo -e "\n ${GREEN}Installing deno ${NC}"
curl -fsSL https://deno.land/install.sh | sh

echo -e "\n ${GREEN}Installing Go ${NC}"
# https://pkg.go.dev/golang.org/x/tools/cmd/getgo#section-readme
# curl -LO https://get.golang.org/$(uname)/go_installer && chmod +x go_installer
curl -LO https://go.dev/dl/go1.24.3.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.24.3.linux-amd64.tar.gz
rm go1.24.3.linux-amd64.tar.gz

echo -e "\n ${GREEN}Installing minikube ${NC}"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
rm minikube_latest_amd64.deb

echo -e "\n ${GREEN}Installing nvm ${NC}"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

echo -e "\n ${GREEN}Installing ollama ${NC}"
curl -fsSL https://ollama.com/install.sh | sh

echo -e "\n ${GREEN}Installing uv ${NC}"
curl -LsSf https://astral.sh/uv/install.sh | sh

echo -e "\n ${GREEN}Installing supabase ${NC}"
curl -LO https://github.com/supabase/cli/releases/download/v2.23.1/supabase_2.23.1_linux_amd64.deb
sudo dpkg -i supabase_2.23.1_linux_amd64.deb
rm supabase_2.23.1_linux_amd64.deb

