echo Setup started
#Install Gestures
/bin/bash -c "$(curl -sL https://git.io/vokNn)"
sudo gpasswd -a $USER input
cd /home/$USER/DistroSetup
git clone https://github.com/bulletmark/libinput-gestures.git
git clone https://gitlab.com/cunidev/gestures.git
sudo apt update
sudo apt-fast install wmctrl -y
sudo apt-fast install python3 -y
sudo apt-fast install python3-setuptools -y
sudo apt-fast install xdotool -y
sudo apt-fast install python3-gi -y
sudo apt-fast install libinput-tools -y
sudo apt-fast install python-gobject -y
cd /home/$USER/DistroSetup/libinput-gestures
sudo make install
cd /home/$USER/DistroSetup/gestures
sudo python3 setup.py install

#Copy over config file and set libinput to start
mv /home/$USER/DistroSetup/libinput-gestures.conf /home/$USER/.config/
sudo libinput-gestures-setup autostart
sudo libinput-gestures-setup start

#Install common programs
cd /home/$USER/DistroSetup/
sudo apt-fast update
sudo apt-fast purge firefox* -y
sudo apt-fast install tlp -y
sudo apt-fast install github-desktop -y
sudo apt-fast install neofetch -y
sudo apt-fast install ruby -y
sudo apt-fast install python3-pip -y
sudo apt-fast install stacer -y
sudo apt-fast install apt-transport-https -y
sudo apt-fast install curl -y
sudo apt-fast install ffmpegthumbnailer -y
sudo apt-fast install vlc -y
sudo apt-fast install gnome-tweaks -y
sudo apt-fast install qbittorrent -y
sudo apt-fast install speedtest-cli -y
sudo apt-fast install gstreamer1.0-libav -y
sudo apt-fast install htop -y
sudo apt-fast install ratbagd -y
sudo apt-fast install piper -y
sudo apt-fast install telegram-desktop -y
sudo apt-fast install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
wget -q https://packagecloud.io/AtomEditor/atom/gpgkey -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main"
sudo apt-fast install atom -y
sudo gem install lolcat
wget https://dl.discordapp.net/apps/linux/0.0.10/discord-0.0.10.deb -q
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -q
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb -q
wget https://launcher.mojang.com/download/Minecraft.deb -q
wget https://dl.strem.io/shell-linux/v4.4.116/stremio_4.4.116-1_amd64.deb
sudo apt-fast install /home/$USER/DistroSetup/discord*.deb -y
sudo apt-fast install /home/$USER/DistroSetup/google-chrome-stable_current_amd64.deb -y
sudo apt-fast install /home/$USER/DistroSetup/teamviewer_amd64.deb -y
sudo apt-fast install /home/$USER/DistroSetup/Minecraft.deb -y
sudo apt-fast install /home/$USER/DistroSetup/stremio_4.4.116-1_amd64.deb -y

#Install brave browser
#cd /home/$USER/DistroSetup
#sudo apt install apt-transport-https curl
#curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
#echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
#sudo apt-fast update
#sudo apt-fast install brave-browser -y
#cd ~

#Install Syncthing
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
echo "deb https://apt.syncthing.net/ syncthing candidate" | sudo tee /etc/apt/sources.list.d/syncthing.list
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
sudo apt-fast update
sudo apt-fast install syncthing -y

#Install Wine
sudo dpkg --add-architecture i386
wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
#If you change the version of wine this is installing, there is a 90% chance this will work for other versions of the OS
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
sudo apt update
sudo apt-fast install --install-recommends winehq-stable -y

#Install rEFInd
sudo apt-add-repository ppa:rodsmith/refind -y
sudo apt-fast install refind -y
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/bobafetthotmail/refind-theme-regular/master/install.sh)"
sudo mv /home/$USER/DistroSetup/refind.conf /boot/efi/EFI/refind

#Configure pulseaudio
sudo mv /home/$USER/DistroSetup/daemon.conf /etc/pulse

#Install fonts
sudo apt update
mv /home/$USER/DistroSetup/.fonts /home/$USER/
fc-cache -rv

#Setup themes
sudo apt-fast install dmz-cursor-theme -y
git clone https://github.com/vinceliuice/Orchis-theme.git /home/$USER/DistroSetup/Orchis-theme
cd /home/$USER/DistroSetup/Orchis-theme
./install.sh

git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git /home/$USER/DistroSetup/Tela-circle-icon-theme
cd /home/$USER/DistroSetup/Tela-circle-icon-theme
./install.sh -a

git clone https://github.com/vinceliuice/ChromeOS-theme.git /home/$USER/DistroSetup/ChromeOS-theme
cd /home/$USER/DistroSetup/ChromeOS-theme
./install.sh --color dark

gsettings set org.gnome.desktop.interface cursor-theme 'DMZ-White'
gsettings set org.gnome.desktop.interface gtk-theme 'Orchis-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-black-dark'

#Janitor
sudo apt-fast update
sudo apt-fast upgrade -y

#Install D2P
git clone https://github.com/home-sweet-gnome/dash-to-panel.git /home/$USER/DistroSetup/dash-to-panel
cd /home/$USER/DistroSetup/dash-to-panel
make install

#Install vitals
sudo apt-fast install gir1.2-gtop-2.0 lm-sensors -y
git clone https://github.com/corecoding/Vitals.git /home/$USER/.local/share/gnome-shell/extensions/Vitals@CoreCoding.com

#Install caffeine
cd /home/$USER/DistroSetup
git clone git://github.com/eonpatapon/gnome-shell-extension-caffeine.git
cd gnome-shell-extension-caffeine
./update-locale.sh
glib-compile-schemas --strict --targetdir=caffeine@patapon.info/schemas/ caffeine@patapon.info/schemas
cp -r caffeine@patapon.info /home/$USER/.local/share/gnome-shell/extensions

#Install clipboard
git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git /home/$USER/.local/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com

#Install Volume mixer
git clone https://github.com/aleho/gnome-shell-volume-mixer.git /home/$USER/.local/share/gnome-shell/extensions/shell-volume-mixer@derhofbauer.at

#Install user-themes
mkdir /home/mihitmittal/.local/share/gnome-shell/extensions/user-theme@gnome-shell-extensions.gcampax.github.com
cd /home/mihitmittal/.local/share/gnome-shell/extensions/user-theme@gnome-shell-extensions.gcampax.github.com
wget https://extensions.gnome.org/extension-data/user-themegnome-shell-extensions.gcampax.github.com.v40.shell-extension.zip
unzip user-themegnome-shell-extensions.gcampax.github.com.v40.shell-extension.zip
rm user-themegnome-shell-extensions.gcampax.github.com.v40.shell-extension.zip

#Open Bitwarden
python3 -m webbrowser https://vault.bitwarden.com
gnome-tweaks
