#/data/data/com.termux/files/usr/bin/env bash
# WARNING: If you want to try my termux environment
# MAKE SURE BACKUP YOUR HOME & TERMUX DIRECTORY
# More in here: https://wiki.termux.com/wiki/Backing_up_Termux
# update package
pkg update && pkg upgrade -y
apt install git python2 python3 nodejs wget curl termux-tools tur-repo firefox zsh starship exa -y
# Setup Home dir
mkdir Coding Github Project downloads
termux-setup-storage
rm -rf storage/
ln -s /storage/emulated/0 Main
# setup env Main
curl https://raw.githubusercontent.com/crischutu07/crischutu07/main/.dotfiles/config/starship.toml > ~/.config/starship.toml
curl https://raw.githubusercontent.com/crischutu07/crischutu07/main/.dotfiles/termux/asciimotd > ~/.termux/asciimotd
curl https://raw.githubusercontent.com/crischutu07/crischutu07/main/.dotfiles/termux/ascii44 > ~/.termux/ascii44
curl https://raw.githubusercontent.com/crischutu07/crischutu07/main/.dotfiles/termux/termux.properties > ~/.termux/termux.properties
curl https://raw.githubusercontent.com/crischutu07/crischutu07/main/.dotfiles/ssh/config > ~/.ssh/config
# Install omz + plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Finishing everything
rm -f $PREFIX/etc/motd
mv $PREFIX/etc/motd.sh backup-motd.sh
echo "" > $PREFIX/etc/motd.sh
omz reload
chsh -s zsh
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerUpdate
nvim +PackerSync
