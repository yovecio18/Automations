echo "Creating Exclusion/Tools folder"
mkdir C:\Exclusion
mkdir C:\Exclusion\Tools

echo "Adding folder exclusion in Defender"
Add-MpPreference -ExclusionPath C:\Exclusion\

echo "Setting Swedish time zone"
Set-TimeZone -Id "Central Europe Standard Time"

echo "Unhiding extension for known file types setting"
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\' -Name HideFileExt -Value 0 -Force

echo "Intalling Spice Agent"
cd C:\Exclusion\Tools
wget https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.271-1/virtio-win-guest-tools.exe -outfile virtio-win-guest-tools.exe
msiexec /qn /i virtio-win-guest-tools.exe

echo "Fetching & executing debloater tool"
cd C:\Exclusion\Tools
wget https://github.com/Raphire/Win11Debloat/releases/download/2025.05.26/Get.ps1 -outfile Get.ps1
Set-ExecutionPolicy Bypass -Force
powershell.exe ./Get.ps1
Set-ExecutionPolicy Restricted -Force

