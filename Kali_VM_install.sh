#!/bin/bash
#Kali Guest VM bash script.
#Install and clones the most used tools for work.
#2025-05-22 
#v.1.0
<<BANNER
    __ __      ___    ______                __ 
   / //_/___ _/ (_)  / ____/_  _____  _____/ /_
  / ,< / __ `/ / /  / / __/ / / / _ \/ ___/ __/
 / /| / /_/ / / /  / /_/ / /_/ /  __(__  ) /_  
/_/ |_\__,_/_/_/   \____/\__,_/\___/____/\__/  
                                               
    ____           __        ____         
   /  _/___  _____/ /_____ _/ / /__  _____
   / // __ \/ ___/ __/ __ `/ / / _ \/ ___/
 _/ // / / (__  ) /_/ /_/ / / /  __/ /    
/___/_/ /_/____/\__/\__,_/_/_/\___/_/     

BANNER

echo "Updating all packages"
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y

echo "Installing Ufw firewall"
sudo apt install -y ufw gufw
sudo systemctl enable ufw
sudo ufw enable
sudo ufw allow Office
sudo ufw default allow outgoing
sudo ufw default deny incoming

echo "Istalling Spice agent"
sudo apt install -y spice-vdagent
sudo apt install -y qemu-guest-agent
sudo systemctl start spice-vdagent
sudo systemctl enable spice-vdagent

echo "Installing Kali most used toolsets"
#Missing Bluetooth, WIFI, SDR etc. because not in use
sudo apt install -y kali-linux-default 
sudo apt install -y kali-tools-gpu kali-tools-hardware kali-tools-crypto-stego kali-tools-fuzzing kali-tools-voip kali-tools-windows-resources

echo "Installing Kali most used menus"
#Missing Bluetooth, WIFI, SDR etc. because not in use
sudo apt install -y kali-tools-information-gathering kali-tools-vulnerability kali-tools-web kali-tools-database kali-tools-passwords kali-tools-wireless kali-tools-reverse-engineering kali-tools-exploitation kali-tools-social-engineering kali-tools-sniffing-spoofing kali-tools-post-exploitation kali-tools-reporting

echo "Installing cargo & cargodeb"
sudo apt install -y rustup
cargo install cargo-deb

echo "Fetching Codemerx decompile"
mkdir /home/user/Downloads/Tools
cd /home/user/Downloads/Tools
wget https://github.com/codemerx/CodemerxDecompile/releases/latest/download/CodemerxDecompile-linux-x64.tar.gz
tar -xzf /home/user/Downloads/Tools/CodemerxDecompile-linux-x64.tar.gz
rm /home/user/Downloads/Tools/CodemerxDecompile-linux-x64.tar.gz

echo "Installing extra tools"
sudo apt install -y bloodyad
sudo apt install -y enum4linux-ng
sudo apt install -y certipy-ad
sudo apt install -y coercer
sudo apt install -y obsidian

echo "Cloning some extra repositories"
cd /home/user/Downloads/Tools
git clone https://github.com/bee-san/RustScan 
git clone https://github.com/g0h4n/RustHound-CE 
git clone https://github.com/aniqfakhrul/powerview.py 
git clone https://github.com/pigeonburger/global-address-list-owa 
git clone https://github.com/dirkjanm/krbrelayx 
git clone https://github.com/Greenwolf/ntlm_theft 
git clone https://github.com/dirkjanm/PKINITtools 
git clone https://github.com/wavestone-cdt/powerpxe 
git clone https://github.com/ShutdownRepo/pywhisker 
git clone https://github.com/ShutdownRepo/targetedKerberoast 
git clone https://github.com/Kevin-Robertson/Inveigh 
git clone https://github.com/sensepost/ruler 
git clone https://github.com/AlessandroZ/LaZagne 
git clone https://github.com/Mayyhem/SharpSCCM 
git clone https://github.com/pwntester/ysoserial.net 
git clone https://github.com/Flangvik/SharpCollection
