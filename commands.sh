
#Install libinput-gestures and dependencies

gpasswd -a $USER input
sudo apt-get install wmctrl python3 python3-setuptools xdotool python3-gi libinput-tools python-gobject -y
git clone https://github.com/bulletmark/libinput-gestures.git
cd ~/libinput-gestures
sudo make install

#Install gestures

git clone https://gitlab.com/cunidev/gestures.git
cd ~/gestures
sudo python3 setup.py install

#Copy over config file and set libinput to start

cp -rf libinput-gestures.conf ./config/
ibinput-gestures-setup autostart
libinput-gestures-setup start
cd ~/

#Install common programs

sudo apt-get purge firefox* -y
sudo apt install neofetch ruby python3-pip stacer apt-transport-https curl ffmpegthumbnailer vlc dmz-cursor-theme discord gnome-tweaks qbittorrent speedtest-cli gstreamer1.0-libav -y
sudo gem install lolcat
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
wget https://launcher.mojang.com/download/Minecraft.deb
sudo apt install ~/google-chrome-stable_current_amd64.deb -y
sudo apt install ~/teamviewer_amd64.deb -y
sudo apt install ~/Minecraft.deb -y

#Install Wine

sudo dpkg --add-architecture i386
wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
sudo apt update
sudo apt install --install-recommends winehq-stable

#Installs rEFInd

sudo apt-add-repository ppa:rodsmith/refind -y
sudo apt update
sudo apt install refind
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/bobafetthotmail/refind-theme-regular/master/install.sh)"

#Installs fonts

fc-cache -rv

#Janitor work

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
