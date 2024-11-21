# set .zshrc
ZSHRC_FILE=~/.zshrc
if [ -f "$ZSHRC_FILE" ]; then
    echo "removing existing $ZSHRC_FILE."
    rm $ZSHRC_FILE
fi
# first argument is understood as a relative path to the parent directory of the symlink
ln -s dev/dotfiles/zsh/.zshrc ~/.zshrc
echo "created symlink to new .zshrc"
