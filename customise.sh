# POSIX compliant scripts for both linux and macos

echo "== git setup =="
GITCONFIG_FILE=~/.gitconfig
if [ -f "$GITCONFIG_FILE" ]; then
    echo "replacing existing $GITCONFIG_FILE."
    rm $GITCONFIG_FILE
fi

ln -s dev/dotfiles/git/.gitconfig ~/.gitconfig
echo "symlink to new .gitconfig created"

echo "== zsh setup =="
ZSHRC_FILE=~/.zshrc
if [ -f "$ZSHRC_FILE" ]; then
    echo "replacing existing $ZSHRC_FILE."
    rm $ZSHRC_FILE
fi
ln -s dev/dotfiles/zsh/.zshrc ~/.zshrc
echo "symlink to new .zshrc created"

# TODO:
# - nvm

# note:
# first ln argument is understood as a relative path to the parent directory of the symlink
