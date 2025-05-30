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

echo "Fetching Kerbrute"
cd /home/user/Downloads/Tools
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64
chmod +x ./pspy64

echo "Fetching Pspy"
cd /home/user/Downloads/Tools
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
chmod +x ./kerbrute_linux_amd64

echo "Fetching Ligolong"
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
rm LICENSE README.md ligolo-ng_agent_0.8.2_linux_amd64.tar.gz ligolo-ng_proxy_0.8.2_linux_amd64.tar.gz

echo "Fetching Bloodhound-CE"
cd /home/user/Downloads/Tools
wget https://github.com/SpecterOps/bloodhound-cli/releases/latest/download/bloodhound-cli-linux-amd64.tar.gz
tar -xvzf bloodhound-cli-linux-amd64.tar.gz
rm bloodhound-cli-linux-amd64.tar.gz

echo "Installing extra tools"
sudo apt install -y bloodyad
sudo apt install -y enum4linux-ng
sudo apt install -y certipy-ad
sudo apt install -y coercer
sudo apt install -y obsidian
sudo apt install -y bloodhound
sudo apt install -y gir1.2-libmsi-1.0 libmsi-1.0-0 libmsi-dev msitools wixl wixl-data

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
