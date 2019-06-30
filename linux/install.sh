sudo apt upgrade
sudo apt update

sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt install nvidia-390
sudo update-initramfs -k all -u
sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo update-initramfs -u

# power
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install tlp tlp-rdw
# thinkpad power
sudo apt-get install tp-smapi-dkms acpi-call-dkms

sudo apt install -y neovim mc zsh tmux

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
