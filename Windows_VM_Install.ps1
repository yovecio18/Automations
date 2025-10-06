echo "Creating Exclusion/Tools folder"
mkdir C:\Exclusion
mkdir C:\Exclusion\Tools

echo "Adding folder exclusion in Defender"
Add-MpPreference -ExclusionPath C:\Exclusion\

echo "Setting Swedish time zone"
Set-TimeZone -Id "Central Europe Standard Time"

echo "Unhiding extension for known file types setting"
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\' -Name HideFileExt -Value 0 -Force

#echo "Intalling Spice Agent"
#cd C:\Exclusion\Tools
#wget https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.271-1/virtio-win-guest-tools.exe -outfile virtio-win-guest-tools.exe
#msiexec /qn /i virtio-win-guest-tools.exe

echo "Fetching & executing debloater tool"
cd C:\Exclusion\Tools
wget https://github.com/Raphire/Win11Debloat/releases/download/2025.05.26/Get.ps1 -outfile Get.ps1
Set-ExecutionPolicy Bypass -Force
powershell.exe ./Get.ps1
Set-ExecutionPolicy Restricted -Force

echo "Fetching YET Obfuscator tool"
cd C:\Exclusion\Tools
wget https://github.com/0xb11a1/yetAnotherObfuscator/releases/download/1.1/yetAnotherObfuscator_v1.1.zip -OutFile yetAnotherObfuscator_v1.1.zip
Expand-Archive -Path .\yetAnotherObfuscator_v1.1.zip -DestinationPath .\YetAnotherObfuscator
rm yetAnotherObfuscator_v1.1.zip

echo "Installing chocolatey package manager"
Set-ExecutionPolicy Bypass -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Set-ExecutionPolicy Restricted -Force

echo "Installing extra packages"
choco install 7zip.install -y
choco install vscode -y
choco install python -y
choco install notepadplusplus -y
choco install git.install -y
choco install sql-server-express -y
choco install sql-server-management-studio -y
choco install visualstudio2022community "'--add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended'" -y
