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

#echo "Installing Ufw firewall"
#sudo apt install -y ufw gufw
#sudo systemctl enable ufw
#sudo ufw enable
#sudo ufw allow Office
#sudo ufw default allow outgoing
#sudo ufw default deny incoming

#echo "Istalling Spice agent"
#sudo apt install -y spice-vdagent
#sudo apt install -y qemu-guest-agent
#sudo systemctl start spice-vdagent
#sudo systemctl enable spice-vdagent

echo "Installing Kali most used toolsets"
#Missing Bluetooth, WIFI, SDR etc. because not in use
sudo apt install -y kali-linux-default 
sudo apt install -y kali-tools-gpu kali-tools-hardware kali-tools-crypto-stego kali-tools-fuzzing kali-tools-voip kali-tools-windows-resources

echo "Installing Kali most used menus"
#Missing Bluetooth, WIFI, SDR etc. because not in use
sudo apt install -y kali-tools-information-gathering kali-tools-vulnerability kali-tools-web kali-tools-database kali-tools-passwords kali-tools-wireless kali-tools-reverse-engineering kali-tools-exploitation kali-tools-social-engineering kali-tools-sniffing-spoofing kali-tools-post-exploitation kali-tools-reporting

echo "Installing cargo & cargodeb"
sudo apt install -y rustup
rustup default stable
cargo install cargo-deb

echo "Installing docker"
sudo apt install -y docker.io docker-compose docker-cli
sudo systemctl enable docker --now
sudo usermod -aG docker user

echo "Fetching Codemerx decompile"
mkdir /home/user/Downloads/Tools/CodemerxDecompile
cd /home/user/Downloads/Tools/
wget https://github.com/codemerx/CodemerxDecompile/releases/latest/download/CodemerxDecompile-linux-x64.tar.gz
tar -xzf /home/user/Downloads/Tools/CodemerxDecompile-linux-x64.tar.gz -C ./CodemerxDecompile
rm /home/user/Downloads/Tools/CodemerxDecompile-linux-x64.tar.gz

echo "Fetching Kerbrute"
cd /home/user/Downloads/Tools
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64
chmod +x ./pspy64

echo "Fetching Pspy"
cd /home/user/Downloads/Tools
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
chmod +x ./kerbrute_linux_amd64

echo "Fetching Ligolo-ng"
mkdir  /home/user/Downloads/Tools/LigoloNG
cd /home/user/Downloads/Tools/LigoloNG
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.2/ligolo-ng_agent_0.8.2_linux_amd64.tar.gz
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.2/ligolo-ng_agent_0.8.2_windows_amd64.zip
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.2/ligolo-ng_proxy_0.8.2_linux_amd64.tar.gz
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.2/ligolo-ng_proxy_0.8.2_windows_amd64.zip
unzip ligolo-ng_agent_0.8.2_windows_amd64.zip
rm LICENSE README.md
unzip ligolo-ng_proxy_0.8.2_windows_amd64.zip
rm LICENSE README.md
tar xfv ligolo-ng_agent_0.8.2_linux_amd64.tar.gz
rm LICENSE README.md
tar xfv ligolo-ng_proxy_0.8.2_linux_amd64.tar.gz
rm LICENSE README.md *.tar.gz *.zip

echo "Installing Burpsuite Professional"
cd /home/user/Downloads/Tools
curl -L 'https://portswigger.net/burp/releases/download?product=pro&version=2025.4.5&type=Linux' -o burpsuite_pro_2025.4.5.sh
chmod +x burpsuite_pro_2025.4.5.sh
sudo ./burpsuite_pro_2025.4.5.sh

echo "Fetching Bloodhound-CE"
mkdir  /home/user/Downloads/Tools/LigoloNG
cd /home/user/Downloads/Tools/LigoloNG
wget https://github.com/SpecterOps/bloodhound-cli/releases/latest/download/bloodhound-cli-linux-amd64.tar.gz
tar -xvzf bloodhound-cli-linux-amd64.tar.gz
rm bloodhound-cli-linux-amd64.tar.gz
wget https://github.com/SpecterOps/SharpHound/releases/download/v2.6.7/SharpHound_v2.6.7_windows_x86.zip
unzip SharpHound_v2.6.7_windows_x86.zip
rm SharpHound.exe.config SharpHound.pdb

echo "Installing Tilix + theming"
sudo apt install -y tilix
cd /opt
sudo wget https://github.com/dracula/tilix/archive/master.zip
sudo unzip -o master.zip && rm master.zip
mkdir /home/user/.config/tilix
mkdir /home/user/.config/tilix/schemes
cp tilix-master/Dracula.json /home/user/.config/tilix/schemes
rm -rf tilix-master

echo "Installing OnlyOffice"
cd /home/user/Downloads/Tools
wget https://github.com/ONLYOFFICE/DesktopEditors/releases/latest/download/onlyoffice-desktopeditors_amd64.deb
sudo apt install -y ./onlyoffice-desktopeditors_amd64.deb
rm -rf ./onlyoffice-desktopeditors_amd64.deb

echo "installing RustScan"
cd /home/user/Downloads/Tools
wget https://github.com/bee-san/RustScan/releases/download/2.4.1/rustscan.deb.zip
unzip rustscan.deb.zip
sudo apt install -y ./rustscan_2.4.1-1_amd64.deb 
rm rustscan*

echo "Installing extra tools"
sudo apt install -y bloodyad
sudo apt install -y enum4linux-ng
sudo apt install -y certipy-ad
sudo apt install -y coercer
sudo apt install -y obsidian
sudo apt install -y bloodhound
sudo apt install -y bloodhound-ce-python
sudo apt install -y gir1.2-libmsi-1.0 libmsi-1.0-0 libmsi-dev msitools wixl wixl-data
sudo apt install -y krb5-user 
sudo apt install -y ntpsec-ntpdate
sudo apt install -y network-manager-openvpn-gnome

echo "Cloning some extra repositories"
cd /home/user/Downloads/Tools
git clone https://github.com/unode/firefox_decrypt.git
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
git clone https://github.com/dirkjanm/adidnsdump
git clone https://github.com/insidetrust/statistically-likely-usernames
git clone https://github.com/lkarlslund/Adalanche/releases/download/v2025.2.6/adalanche-linux-x64-v2025.2.6
git clone https://github.com/micahvandeusen/gMSADumper.git
git clone https://github.com/X-C3LL/GPOwned.git
git clone https://github.com/topotam/PetitPotam.git
git clone https://github.com/MWR-CyberSec/PXEThief.git
git clone https://github.com/csandker/pxethiefy
git clone https://github.com/tothi/rbcd-attack.git
git clone https://github.com/RedTeamPentesting/wspcoerce.git
