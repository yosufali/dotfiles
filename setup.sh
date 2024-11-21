echo "== git setup =="
GITCONFIG_FILE=~/.gitconfig
if [ -f "$GITCONFIG_FILE" ]; then
    echo "removing existing $GITCONFIG_FILE."
    rm $GITCONFIG_FILE
fi

ln -s dev/dotfiles/git/.gitconfig ~/.gitconfig
echo "created symlink to new .gitconfig"

echo "== zsh setup =="
# set .zshrc
ZSHRC_FILE=~/.zshrc
if [ -f "$ZSHRC_FILE" ]; then
    echo "removing existing $ZSHRC_FILE."
    rm $ZSHRC_FILE
fi
ln -s dev/dotfiles/zsh/.zshrc ~/.zshrc
echo "created symlink to new .zshrc"

# note:
# first ln argument is understood as a relative path to the parent directory of the symlink
