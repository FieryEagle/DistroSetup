#Install Gestures

sudo gpasswd -a $USER input
git clone https://github.com/bulletmark/libinput-gestures.git
git clone https://gitlab.com/cunidev/gestures.git
sudo apt-get install wmctrl python3 python3-setuptools xdotool python3-gi libinput-tools python-gobject
cd ~/libinput-gestures
sudo make install
cd ~/gestures
sudo python3 setup.py install

#Copy over config file and set libinput to start

mv ~/libinput-gestures.conf ~/.config/
ibinput-gestures-setup autostart
libinput-gestures-setup start
cd ~/

#Install common programs

sudo apt-get update
sudo apt-get purge firefox* -y
sudo apt-get install neofetch 
sudo apt-get install ruby -y
sudo apt-get install python3-pip -y 
sudo apt-get install stacer -y
sudo apt-get install apt-transport-https -y 
sudo apt-get install curl -y
sudo apt-get install ffmpegthumbnailer -y 
sudo apt-get install vlc -y
sudo apt-get install dmz-cursor-theme -y 
sudo apt-get install discord -y
sudo apt-get install gnome-tweaks -y 
sudo apt-get install qbittorrent -y
sudo apt-get install speedtest-cli -y
sudo apt-get install gstreamer1.0-libav -y
sudo gem-get install lolcat -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
wget https://launcher.mojang.com/download/Minecraft.deb
sudo apt install ~/google-chrome-stable_current_amd64.deb -y
sudo apt install ~/teamviewer_amd64.deb -y
sudo apt install ~/Minecraft.deb -y
rm -rf ~/Minecraft.deb
rm -rf ~/teamviewer_amd64.deb
rm -rf ~/google-chrome-stable_current_amd64.deb

#Install Wine

sudo dpkg --add-architecture i386
wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
sudo apt update
sudo apt install --install-recommends winehq-stable -y

#Installs rEFInd

sudo apt-add-repository ppa:rodsmith/refind -y
sudo apt update
sudo apt install refind -y
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/bobafetthotmail/refind-theme-regular/master/install.sh)"

#Installs fonts

mv ~/DistroSetup/.fonts ~/
fc-cache -rv

#Janitor work

rm -rf ~/DistroSetup
rm -rf ~/.sudo_as_admin_successful
rm -rf ~/.wget-hsts
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y
