gpasswd -a $USER input
sudo apt-get install wmctrl python3 python3-setuptools xdotool python3-gi libinput-tools python-gobject -y
git clone https://github.com/bulletmark/libinput-gestures.git
cd ~/libinput-gestures
sudo make install
git clone https://gitlab.com/cunidev/gestures.git
cd ~/gestures
sudo python3 setup.py install
cd ~/
sudo apt install neofetch ruby python3-pip stacer apt-transport-https curl ffmpegthumbnailer vlc dmz-cursor-theme discord gnome-tweaks qbittorrent speedtest-cli gstreamer1.0-libav -y
apt-get purge firefox* -y
sudo gem install lolcat
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
wget https://launcher.mojang.com/download/Minecraft.deb
sudo apt install ~/google-chrome-stable_current_amd64.deb -y
sudo apt install ~/teamviewer_amd64.deb -y
sudo apt install ~/Minecraft.deb -y
sudo apt-add-repository ppa:rodsmith/refind -y
sudo apt update
sudo apt install refind
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/bobafetthotmail/refind-theme-regular/master/install.sh)"
sudo apt upgrade -y
sudo apt autoremove -y
cd ~/Downloads
wget https://www.cufonfonts.com/download/font/segoe-ui-4
wget https://www.fontmirror.com/app_public/files/t/1/family_zip/2020/02/Times_New_Roman_Font_Family_(Fontmirror).zip
wget https://www.cufonfonts.com/download/font/arial
