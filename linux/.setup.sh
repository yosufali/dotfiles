# note:
# this file is run as sudo.
# root priviliges are dropped for commands that do not require it.

echo "== update =="
apt-get update
apt-get upgrade

source ../zsh/install.sh

echo "== install docker desktop =="
# https://docs.docker.com/desktop/setup/install/linux/ubuntu/
apt install gnome-terminal
apt-get install ./docker-desktop-amd64.deb


# TODO:
# - node

