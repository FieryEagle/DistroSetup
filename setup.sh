echo Setup started
#Install Gestures
echo Installing Gestures
sudo gpasswd -a $USER input
git clone https://github.com/bulletmark/libinput-gestures.git
git clone https://gitlab.com/cunidev/gestures.git
sudo apt update
sudo apt-get install wmctrl -y
sudo apt-get install python3 -y
sudo apt-get install python3-setuptools -y
sudo apt-get install xdotool -y
sudo apt-get install python3-gi -y
sudo apt-get install libinput-tools -y
sudo apt-get install python-gobject -y
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
sudo apt-get install gnome-tweaks -y
sudo apt-get install qbittorrent -y
sudo apt-get install speedtest-cli -y
sudo apt-get install gstreamer1.0-libav -y
wget -q https://packagecloud.io/AtomEditor/atom/gpgkey -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main"
sudo apt-get install atom -y
sudo gem install lolcat
wget https://dl.discordapp.net/apps/linux/0.0.10/discord-0.0.10.deb -q
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -q
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb -q
wget https://launcher.mojang.com/download/Minecraft.deb -q
sudo apt install ~/discord-0.0.10.deb -y
sudo apt install ~/google-chrome-stable_current_amd64.deb -y
sudo apt install ~/teamviewer_amd64.deb -y
sudo apt install ~/Minecraft.deb -y

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
git clone https://github.com/vinceliuice/Orchis-theme.git
cd ~/Orchis-theme
./install.sh
cd
git clone https://github.com/vinceliuice/Tela-icon-theme.git
cd ~/Tela-icon-theme
./install.sh -a
cd
git clone https://github.com/vinceliuice/ChromeOS-theme.git
cd ~/ChromeOS-theme
./install.sh --color dark
gsettings set org.gnome.desktop.interface cursor-theme 'DMZ-White'
gsettings set org.gnome.desktop.interface gtk-theme 'Orchis-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Tela-black-dark'

#Janitor
echo Cleaning up...
rm -rf ~/Minecraft.deb
rm -rf ~/teamviewer_amd64.deb
rm -rf ~/google-chrome-stable_current_amd64.deb
rm -rf ~/DistroSetup
rm -rf ~/.sudo_as_admin_successful
rm -rf ~/.wget-hsts
rm -rf ~/Orchis-theme
rm -rf ~/Tela-icon-theme
rm -rf ~/ChromeOS-theme
rm -rf ~/README.md
sudo apt-get update
sudo apt-get upgrade -y
echo Setup completed successfully

#GNOME-extensions
python3 -m webbrowser https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep
python3 -m webbrowser https://vault.bitwarden.com
python3 -m webbrowser https://extensions.gnome.org/extension/517/caffeine/
python3 -m webbrowser https://extensions.gnome.org/extension/779/clipboard-indicator/
python3 -m webbrowser https://extensions.gnome.org/extension/1160/dash-to-panel/
python3 -m webbrowser https://extensions.gnome.org/extension/19/user-themes/
python3 -m webbrowser https://extensions.gnome.org/extension/1460/vitals/
