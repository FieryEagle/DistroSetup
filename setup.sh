#Install Gestures
echo Installing Gestures
sudo gpasswd -a $USER input
git clone https://github.com/bulletmark/libinput-gestures.git
git clone https://gitlab.com/cunidev/gestures.git
sudo apt update
sudo apt-get install wmctrl python3 python3-setuptools xdotool python3-gi libinput-tools python-gobject
cd ~/libinput-gestures
sudo make install
cd ~/gestures
sudo python3 setup.py install

#Copy over config file and set libinput to start
echo Setting up libinput-gestures
mv ~/libinput-gestures.conf ~/.config/
ibinput-gestures-setup autostart
libinput-gestures-setup start
cd

#Install common programs
echo Installing programs
sudo apt-get update
sudo apt-get purge firefox* -y
sudo apt-get install neofetch -y
sudo apt-get install ruby -y
sudo apt-get install python3-pip -y
sudo apt-get install stacer -y
sudo apt-get install apt-transport-https -y
sudo apt-get install curl -y
sudo apt-get install ffmpegthumbnailer -y
sudo apt-get install vlc -y
sudo apt-get install discord -y
sudo apt-get install gnome-tweaks -y
sudo apt-get install qbittorrent -y
sudo apt-get install speedtest-cli -y
sudo apt-get install gstreamer1.0-libav -y
sudo gem install lolcat -y
wget https://atom.io/download/deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
wget https://launcher.mojang.com/download/Minecraft.deb
sudo apt install ~/google-chrome-stable_current_amd64.deb -y
sudo apt install ~/teamviewer_amd64.deb -y
sudo apt install ~/Minecraft.deb -y
sudo apt install ~/atom-amd64.deb -y

#Install Wine
echo Installing Wine
sudo dpkg --add-architecture i386
wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
#If you change the version of wine this is installing, there is a 90% chance this will work for other versions of the OS
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
sudo apt update
sudo apt install --install-recommends winehq-stable -y

#Install rEFInd
echo Installing rEFInd
sudo apt-add-repository ppa:rodsmith/refind -y
sudo apt install refind -y
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/bobafetthotmail/refind-theme-regular/master/install.sh)"

#Install fonts
echo Installing fonts
sudo apt update
mv ~/DistroSetup/.fonts ~/
fc-cache -rv

#Setup themes
echo Setting up themes
sudo apt-get install dmz-cursor-theme -y
gsettings set org.gnome.desktop.interface cursor-theme 'DMZ-White'
git clone https://github.com/vinceliuice/Orchis-theme.git
cd ~/Orchis-theme
./install.sh
gsettings set org.gnome.desktop.interface gtk-theme 'Orchis-dark'
cd
git clone https://github.com/vinceliuice/Tela-icon-theme.git
cd ~/Tela-icon-theme
./install.sh -n black
gsettings set org.gnome.desktop.interface icon-theme 'Tela-black-dark'
cd
git clone https://github.com/vinceliuice/ChromeOS-theme.git
cd ~/ChromeOS-theme
./install.sh --color dark

#Janitor
echo Cleaning up...
rm -rf ~/Minecraft.deb
rm -rf ~/teamviewer_amd64.deb
rm -rf ~/google-chrome-stable_current_amd64.deb
rm -rf ~/atom-amd64.deb
rm -rf ~/DistroSetup
rm -rf ~/.sudo_as_admin_successful
rm -rf ~/.wget-hsts
rm -rf ~/Orchis-theme
rm -rf ~/Tela-icon-theme
rm -rf ~/ChromeOS-theme
rm -rf ~/README.md
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y
echo Setup completed successfully

#GNOME-extensions
xdg-open https://vault.bitwarden.com
xdg-open https://extensions.gnome.org/extension/517/caffeine/
xdg-open https://extensions.gnome.org/extension/779/clipboard-indicator/
xdg-open https://extensions.gnome.org/extension/1160/dash-to-panel/
xdg-open https://extensions.gnome.org/extension/19/user-themes/
xdg-open https://extensions.gnome.org/extension/1460/vitals/
