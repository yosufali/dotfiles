## Dotfiles

Personal OS configurations.

Install oh-my-zsh
```
./install/ohmyzsh.sh
```

Install brew packages
```
./install/brew.sh
```

Symlink dotfiles
```
stow --adopt -t ~ .
```

Note: if there is a conflict, `--adopt` here replaces the contents of this cloned dotfiles repo with the existing contents of your relevant dotfile before symlinking. You can then view the difference with a git diff, and if you'd like to revert back to the contents of this repo, you can `git reset --hard`.

Install VS Code extensions
```
./vscode/install.sh
```

TODO:
- global gitignore
- .config/Code/...
- .config/...
- gpg + git signing

Manual:
- Set git config details
- Docker Desktop
- 

- Delete Chrome + try cask? 
