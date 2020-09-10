echo Setup started
#Install Gestures
sudo gpasswd -a $USER input
cd ~/DistroSetup
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
cd ~
cd ~/DistroSetup/libinput-gestures
sudo make install
cd ~
cd ~/DistroSetup/gestures
sudo python3 setup.py install
cd ~

#Copy over config file and set libinput to start
mv ~/DistroSetup/libinput-gestures.conf ~/.config/
libinput-gestures-setup autostart
libinput-gestures-setup start

#Install common programs
cd ~/DistroSetup/
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
sudo apt-get install htop -y
wget -q https://packagecloud.io/AtomEditor/atom/gpgkey -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main"
sudo apt-get install atom -y
sudo gem install lolcat
wget https://dl.discordapp.net/apps/linux/0.0.10/discord-0.0.10.deb -q
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -q
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb -q
wget https://launcher.mojang.com/download/Minecraft.deb -q
sudo apt-get install ~/DistroSetup/discord-0.0.10.deb -y
sudo apt-get install ~/DistroSetup/google-chrome-stable_current_amd64.deb -y
sudo apt-get install ~/DistroSetup/teamviewer_amd64.deb -y
sudo apt-get install ~/DistroSetup/Minecraft.deb -y
wget https://dl.strem.io/shell-linux/v4.4.116/stremio_4.4.116-1_amd64.deb
sudo apt-get install ~/DistroSetup/stremio_4.4.116-1_amd64.deb -y
cd ~

#Install brave browser
cd ~/DistroSetup
sudo apt install apt-transport-https curl
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt-get update
sudo apt-get install brave-browser -y
cd ~

#Install Syncthing
cd ~/DistroSetup/
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
echo "deb https://apt.syncthing.net/ syncthing candidate" | sudo tee /etc/apt/sources.list.d/syncthing.list
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
sudo apt-get update
sudo apt-get install syncthing -y
cd ~

#Install Wine
cd ~/DistroSetup
sudo dpkg --add-architecture i386
wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
#If you change the version of wine this is installing, there is a 90% chance this will work for other versions of the OS
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
sudo apt update
sudo apt-get install --install-recommends winehq-stable -y
cd ~

#Install rEFInd
sudo apt-add-repository ppa:rodsmith/refind -y
sudo apt-get install refind -y
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/bobafetthotmail/refind-theme-regular/master/install.sh)"

#Install fonts
sudo apt update
mv ~/DistroSetup/.fonts ~/
fc-cache -rv

#Setup themes
cd ~
cd ~/DistroSetup
sudo apt-get install dmz-cursor-theme -y
git clone https://github.com/vinceliuice/Orchis-theme.git
cd ~/DistroSetup/Orchis-theme
./install.sh

cd ~
cd ~/DistroSetup
git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
cd ~/DistroSetup/Tela-circle-icon-theme
./install.sh -a

cd ~
cd ~/DistroSetup
git clone https://github.com/vinceliuice/ChromeOS-theme.git
cd ~/DistroSetup/ChromeOS-theme
./install.sh --color dark
cd ~

gsettings set org.gnome.desktop.interface cursor-theme 'DMZ-White'
gsettings set org.gnome.desktop.interface gtk-theme 'Orchis-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-black-dark'

#Janitor
sudo apt-get update
sudo apt-get upgrade -y

#GNOME-extensions
python3 -m webbrowser https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep
python3 -m webbrowser https://vault.bitwarden.com
python3 -m webbrowser https://extensions.gnome.org/extension/517/caffeine/
python3 -m webbrowser https://extensions.gnome.org/extension/779/clipboard-indicator/
python3 -m webbrowser https://extensions.gnome.org/extension/1160/dash-to-panel/
python3 -m webbrowser https://extensions.gnome.org/extension/19/user-themes/
python3 -m webbrowser https://extensions.gnome.org/extension/1460/vitals/
gnome-tweaks
