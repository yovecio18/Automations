#!/bin/bash
#Debian Host bash script.
#Install and configures the most used tools for work.
#2025-05-23 
#v.1.0
<<BANNER
   __  ____                __           __  __           __ 
  / / / / /_  __  ______  / /___  __   / / / /___  _____/ /_
 / / / / __ \/ / / / __ \/ __/ / / /  / /_/ / __ \/ ___/ __/
/ /_/ / /_/ / /_/ / / / / /_/ /_/ /  / __  / /_/ (__  ) /_  
\____/_.___/\__,_/_/ /_/\__/\__,_/  /_/ /_/\____/____/\__/  
                                                            
    ____           __        ____         
   /  _/___  _____/ /_____ _/ / /__  _____
   / // __ \/ ___/ __/ __ `/ / / _ \/ ___/
 _/ // / / (__  ) /_/ /_/ / / /  __/ /    
/___/_/ /_/____/\__/\__,_/_/_/\___/_/     
                                         
BANNER

#echo "Adding Debian's non-free and contrib repositories"
#echo "deb http://deb.debian.org/debian/ bookworm main non-free-firmware non-free contrib\ndeb-src http://deb.debian.org/debian/ bookworm main non-free-firmware non-free contrib\ndeb http://security.debian.org/debian-security bookworm-security main non-free-firmware non-free contrib\ndeb-src http://security.debian.org/debian-security bookworm-security main non-free-firmware non-free contrib\ndeb http://deb.debian.org/debian/ bookworm-updates main non-free-firmware contrib\ndeb-src http://deb.debian.org/debian/ bookworm-updates main non-free-firmware contrib\n" > /etc/apt/sources.list

echo "Disabling Ipv6"
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
sudo sysctl -p

echo "Updating all packages"
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y

echo "Installing kernel headers"
sudo apt install -y linux-headers-$(uname -r)
echo "Installing gcc"
sudo apt install -y build-essential
echo "Installing nala wrapper"
sudo apt install -y nala
echo "Installing ufw firewall"
sudo apt install -y ufw gufw
sudo systemctl enable ufw
sudo ufw enable
sudo ufw allow Office
sudo ufw default allow outgoing
sudo ufw default deny incoming
echo "Installing Gparted"
sudo apt install -y gparted
#echo "Istalling Spice agent"
#sudo apt install -y spice-vdagent
#sudo systemctl start spice-vdagent
#sudo systemctl enable spice-vdagent

#echo "Installing KVM"
#sudo apt install -y qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils libguestfs-tools genisoimage virtinst libosinfo-bin
#echo "Adding user permission to run kvm"
#sudo adduser user libvirt
#sudo adduser user kvm
#echo "Installing VM Manager"
#sudo apt install -y virt-manager
#echo "Autostaring KVM networks"
#sudo virsh net-autostart default
#sudo virsh net-start default

echo "Installing terminal theming"
sudo apt install -y dconf-cli zsh-syntax-highlighting git
cd /home/user/
mkdir Installers
cd Installers/
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
chmod +x ./install.sh
./install.sh

#echo "Installing Debian's Nvidia and Hashcat"
#sudo apt install -y nvidia-driver nvdia-smi nvidia-cuda-toolkit hashcat
echo "Installing Ubuntu's Nvidia and Hashcat"
sudo apt install -y ubuntu-drivers-common nvidia-cuda-toolkit hashcat
sudo ubuntu-drivers install
echo "Signing Nvidia drivers via MOK"
sudo mokutil --import /var/lib/dkms/mok.pub 
