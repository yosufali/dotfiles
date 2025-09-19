#!/bin/zsh

current_dir=$(pwd)

if ! command -v zsh 2>&1 >/dev/null; then
    echo "zsh could not be found, installing it"
    # https://ohmyz.sh/#install
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    chsh -s $(which zsh)
    echo "zsh installed and set as default shell"
    echo "you will need to log out and back in for the changes to take effect"
else
    echo "zsh is already installed, updating ..."
    # using stow prevents git pull with omz, stash and symlink again after update
    cd ~/.oh-my-zsh && git stash
    $ZSH/tools/upgrade.sh
    cd $current_dir
    stow --adopt -t ~ .
    echo "zsh is updated. check dotfiles for any new changes that need to be commited"
fi
