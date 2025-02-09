## Dotfiles

Personal OS configurations.

Run setup script for relevant OS, then customise script.

Linux, sudo is required:
```
sudo ./linux/setup.sh
```

Customise:
```
./customise.sh
```

TODO:
- aws, go
- global gitignore
Manual:
- Set git config details
- Docker Desktop
- 

- Delete Chrome + try cask? 

```
stow --adopt -t ~ .
```

Note: if there is a conflict, `--adopt` here replaces the contents of this cloned dotfiles repo with the existing contents of your relevant dotfile before symlinking. You can then view the difference with a git diff, and if you'd like to revert back to the contents of this repo, you can `git reset --hard`.

