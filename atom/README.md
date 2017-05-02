# atom dotfiles

### **Packages**

To create a list of your installed packages:

`apm list --installed --bare > packages.list`

To restore a list of packages, assuming `packages.list` is in your current directory:

`apm install --packages-file packages.list`
