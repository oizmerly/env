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

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
