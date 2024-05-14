#!/bin/bash

# Version 3.3.1 14-May-2024

# VARIABLES
SPARROW="1.9.1"
EXODUS="24.19.4"
ATOMIC="2.76.4"
# https://get.atomicwallet.io/download/latest-debian.txt
ZEC="1.8.8"
VERACRYPT="1.26.7"
BITBOX="4.42.0"
BITBOX2="4.42.0_amd64"
ELECTRUM="4.5.4"
ELECTRON="4.4.1"
ELECTRUM_LTC="4.2.2.1"
GREEN="2.0.5"
FEATHER="2.6.7"
MYMONERO="1.3.2"
MYCRYPTO="1.7.17"
MYCRYPTO2="1.7.17_MyCrypto"
TREZOR="24.4.3"
KEEPKEY="3.0.13"
COINOMI="1.3.0"
TORBROWSER="13.0.15"
TORBROWSER2="13.0.15_ALL"
BITWARDEN="2024.4.3"
BCVAULT="setup_2.2.0"
MONEROCLI="0.18.3.3"
FIRO="4.1.5.3"
TONKEEPER="3.12.6"
TONKEEPER2="_3.12.6_amd64"
GUARDA="1.0.20"
GUARDA2="1.0.20_amd64"

# COLORS
RED='\033[0;31m'
NC='\033[0m'

apt update
apt -y install linux-image-amd64 linux-headers-amd64 cinnamon firmware-linux firmware-linux-nonfree firmware-misc-nonfree firmware-realtek firmware-atheros firmware-bnx2 firmware-bnx2x firmware-brcm80211 firmware-ipw2x00 firmware-iwlwifi firmware-libertas firmware-netxen firmware-zd1211 b43-fwcutter firmware-b43-installer firmware-b43legacy-installer intel-media-va-driver-non-free libva-drm2 libva-x11-2 mesa-va-drivers i965-va-driver-shaders libnvcuvid1 xorg intel-microcode printer-driver-all fonts-crosextra-caladea fonts-crosextra-carlito wireshark tshark ffmpeg qrencode searchmonkey testdisk kleopatra keepassxc zulucrypt-gui firefox-esr ntfs-3g exfat-fuse wkhtmltopdf evince python3-tk python3-pip hashcat gedit libreoffice-writer libreoffice-calc tor secure-delete git libsecp256k1-1 qtqr scdaemon firmware-intel-sound firmware-sof-signed zstd macchanger curl flameshot wget gnupg iptables ntp zenity make python3-full whois libusb-1.0-0-dev libudev-dev git libccid pcscd libopengl-dev guymager open-vm-tools open-vm-tools-desktop gnome-calculator gufw python3-full python3-virtualenv curl unzip libportaudio2 shotwell firmware-atheros firmware-realtek firmware-amd-graphics software-properties-common gdebi firmware-b43-installer firmware-realtek firmware-libertas firmware-brcm80211 grub-efi npm firmware-bnx2 firmware-bnx2x firmware-brcm80211 firmware-ipw2x00 firmware-libertas firmware-netxen firmware-zd1211 b43-fwcutter firmware-b43-installer firmware-b43legacy-installer firmware-sof-signed mesa-va-drivers i965-va-driver-shaders intel-media-va-driver-non-free vim net-tools libegl1-mesa libgl1-mesa-glx libxcb-cursor0 libxcb-xtest0 ibus libopengl-dev apt-utils firmware-netronome firmware-myricom debconf-i18n firmware-qlogic firmware-siano hdmi2usb-fx2-firmware pcscd firmware-ath9k-htc firmware-bnx2 firmware-bnx2x firmware-brcm80211 firmware-cavium firmware-ipw2x00 firmware-ivtv nvidia-detect pm-utils gtkhash firmware-realtek-rtl8723cs-bt eog libwxgtk3.2-1 bash-completion obsidian-icon-theme figlet papirus-icon-theme gir1.2-gtop-2.0 system-config-printer libsecp256k1-dev zip user-setup system-config-printer simplescreenrecorder gnome-sound-recorder portaudio19-dev mpg123 terminator libsecp256k1-dev protobuf-compiler

apt -y --purge remove libreoffice-math libreoffice-draw apache2-bin
apt -y --purge autoremove

# disable dot net telemetry
export DOTNET_CLI_TELEMETRY_OUTPUT=1

# add Kali repo to download bulkextractor
cp /etc/apt/sources.list /etc/apt/sources.list.backup
echo deb http://http.kali.org/kali kali-rolling main contrib non-free >> /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ED444FF07D8D0BF6
apt update
apt -y install bulk-extractor
cp /etc/apt/sources.list.backup /etc/apt/sources.list
rm -rf /etc/apt/sources.list.backup
echo deb http://www.bchemnet.com/suldr/ debian extra >> /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FB510D557CC3E840
apt update
apt -y install suld-driver-4.01.17 suld-driver-common-1

cd /opt/
mkdir Tools
cd Tools
mkdir Privacy
mkdir Recovery
#mkdir UsefulTools
mkdir WalletGen
mkdir Wallets
mkdir WalletTools
cd Wallets
mkdir HW
cd

# Downloading and placing customization files
mkdir prv
cd prv
git clone https://github.com/AnuBitux-project/custom_files
cd custom_files
zip -FF customs.zip --out single-archive.zip -fz
unzip single-archive.zip
cd home/anubitux/temp_git
cd etc
cd lightdm
cp -r -p * /etc/lightdm/
cd ..
cd skel
cp -r -p Desktop /etc/skel/
chmod +x /etc/skel/Desktop/*
cp -r -p Documents /etc/skel/
cp -r -p Downloads /etc/skel/
cp -r -p Music /etc/skel/
cp -r -p Pictures/ /etc/skel/
cp -r -p Templates /etc/skel/
cp -r -p Videos /etc/skel/
cp -r -p .idlerc/ /etc/skel/
cp -r -p .config /etc/skel/
cp -r -p .local /etc/skel/
cp -r -p .mozilla /etc/skel/
cp .bashrc /etc/skel/
cp .face /etc/skel/
cp .profile /etc/skel/
#cp -r -p * /etc/skel/
cd ..
cd ssl
cp -r -p * /etc/ssl/
cd ../..
cp -r -p opt/* /opt/
cd usr
cd share
cd backgrounds
cp -r -p AnuBitux_WP /usr/share/backgrounds/
cd ../desktop-base/
cp -r -p * /usr/share/desktop-base/
cd ../icons/
cp -r -p custom_icons /usr/share/icons/
cd ../plymouth/
cp -r -p * /usr/share/plymouth/
cd
chmod +x /etc/skel/Desktop/*
cd
rm -rf prv

# Downloading and installing debs
# Sparrow
wget --user-agent="Mozilla" https://github.com/sparrowwallet/sparrow/releases/download/$SPARROW/sparrow_$SPARROW-1_amd64.deb
sudo dpkg -i sparrow*
rm -rf sparrow*

# BitBox
wget --user-agent="Mozilla" https://github.com/digitalbitbox/bitbox-wallet-app/releases/download/v$BITBOX/bitbox_$BITBOX2.deb
sudo dpkg -i bitbox*
rm -rf bitbox*

# Kalitorify
systemctl enable ufw
git clone https://github.com/brainfucksec/kalitorify
cd kalitorify
sudo make install
cd ..
rm -rf kalitorify

# Exodus
wget --user-agent="Mozilla" https://downloads.exodus.com/releases/exodus-linux-x64-$EXODUS.deb
sudo dpkg -i exodus*
rm -rf exodus*

# BitWarden
wget --user-agent="Mozilla" https://github.com/bitwarden/clients/releases/download/desktop-v$BITWARDEN/Bitwarden-$BITWARDEN-amd64.deb
sudo dpkg -i Bitwarden*
rm -rf Bitwarden*

# Atomic
wget --user-agent="Mozilla" https://get.atomicwallet.io/download/atomicwallet-$ATOMIC.deb
sudo dpkg -i atomic*
rm -rf atomic*

# VeraCrypt
sudo apt install libwxgtk3.2-1
wget --user-agent="Mozilla" https://launchpad.net/veracrypt/trunk/$VERACRYPT/+download/veracrypt-$VERACRYPT-Debian-12-amd64.deb
wget https://launchpad.net/veracrypt/trunk/1.26.7/+download/veracrypt-1.26.7-Debian-12-amd64.deb
sudo dpkg -i veracrypt*
rm -rf veracrypt*

# TonKeeper
wget --user-agent="Mozilla" https://github.com/tonkeeper/tonkeeper-web/releases/download/v$TONKEEPER/tonkeeper$TONKEEPER2.deb
dpkg -i tonkeeper*
rm -rf tonkeeper*

wget --user-agent="Mozilla" https://github.com/guardaco/guarda-desktop-releases/releases/download/v$GUARDA/Guarda_$GUARDA2.deb
dpkg -i Guarda*
rm -rf Guarda*

# Just in case something went wrong
apt --fix-broken install

# Folders
cd /opt
mkdir Tools
cd Tools
mkdir Privacy
mkdir Recovery
mkdir WalletGen
mkdir Wallets
mkdir WalletTools
cd Wallets
mkdir HW
cd ..
# make pip work
rm /usr/lib/python3.11/EXTERNALLY-MANAGED

#VeraDecrypt
cd /opt/Tools/Recovery
git clone https://github.com/AnuBitux/VeraDecrypt
cd VeraDecrypt
virtualenv vdve
source vdve/bin/activate
deactivate
chmod +x veradecrypt.sh

# SeedCheck
cd /opt/Tools/WalletTools/
git clone https://github.com/AnuBitux/SeedCheck
cd SeedCheck
virtualenv scve
source scve/bin/activate
pip3 install -r requirements.txt
deactivate
chmod +x seedcheck.sh

# DiceTracker
cd /opt/Tools/WalletGen/
git clone https://github.com/AnuBitux/DiceTracker
cd DiceTracker
virtualenv dtve
source dtve/bin/activate
pip3 install -r requirements.txt
deactivate
chmod +x dicetracker.sh

# Dice2Seed
cd /opt/Tools/WalletGen/
git clone https://github.com/AnuBitux/Dice2Seed
cd Dice2Seed
virtualenv dsve
chmod +x Dice2Seed.sh

# LastWord
cd /opt/Tools/WalletGen/
git clone https://github.com/AnuBitux/LastWord
cd LastWord
virtualenv lwve

# Mic2Paper
cd /opt/Tools/WalletGen/
git clone https://github.com/AnuBitux/Mic2Paper
cd Mic2Paper
virtualenv mpve
source mpve/bin/activate
pip3 install -r requirements.txt
deactivate

# Mic2Seed
cd /opt/Tools/WalletGen/
git clone https://github.com/AnuBitux/Mic2Seed
cd Mic2Seed
virtualenv msve
source msve/bin/activate
pip3 install -r requirements.txt
deactivate

# MicCheck
cd /opt/Tools/WalletGen/
git clone https://github.com/AnuBitux/MicCheck
cd MicCheck
virtualenv mcve
source mcve/bin/activate
pip3 install -r requirements.txt
deactivate
chmod +x play_audio.sh

# BlindGen
cd /opt/Tools/WalletGen/
git clone https://github.com/AnuBitux/BlindGen
cd BlindGen
virtualenv bgve
source bgve/bin/activate
pip3 install -r requirements.txt
deactivate

# btcrecover
cd /opt/Tools/Recovery
git clone https://github.com/AnuBitux/btcrecover
cd btcrecover
virtualenv brve
source brve/bin/activate
pip3 install -r requirements.txt
pip3 install -r requirements-full.txt
deactivate
chmod +x btcrecover.sh
chmod +x seedrecover.sh

# SeedSearch
cd /opt/Tools/Recovery
git clone https://github.com/AnuBitux/SeedSearch
cd SeedSearch
virtualenv ssve
source ssve/bin/activate
pip3 install -r requirements.txt
deactivate
chmod +x seedsearch.sh

# BtcKeySearch
cd /opt/Tools/Recovery
git clone https://github.com/AnuBitux/BTCKeySearch
cd BTCKeySearch
virtualenv bkve
source bkve/bin/activate
pip3 install -r requirements.txt
deactivate
chmod +x btckeysearch.sh

# SeedBF
cd /opt/Tools/Recovery
git clone https://github.com/AnuBitux/SeedBF
cd SeedBF
virtualenv sbve
source sbve/bin/activate
pip3 install -r requirements.txt
deactivate
chmod +x seedbf.sh

cd

# Hardware wallets setup
wget --user-agent="Mozilla" -q -O - https://raw.githubusercontent.com/LedgerHQ/udev-rules/master/add_udev_rules.sh | sudo bash
python3 -m pip install trezor[hidapi]
python3 -m pip install hidapi btchip-python ecdsa ledger-bitcoin
python3 -m pip install keepkey
python3 -m pip install hidapi
python3 -m pip install bitbox02
python3 -m pip install safet
python3 -m pip install ckcc-protocol
python3 -m pip install pyserial cbor
cd /opt/Tools/Wallets/HW/
git clone https://github.com/AnuBitux/udev
cp /opt/Tools/Wallets/HW/udev/*.rules /etc/udev/rules.d
groupadd plugdev
usermod -aG plugdev $(whoami)
udevadm control --reload-rules && udevadm trigger

# Appimages
#DOWNLOAD
cd /opt/Tools/Wallets
wget --user-agent="Mozilla" https://download.electrum.org/$ELECTRUM/electrum-$ELECTRUM-x86_64.AppImage
mv electrum-4* electrum-btc.AppImage
wget --user-agent="Mozilla" https://electroncash.org/downloads/$ELECTRON/win-linux/Electron-Cash-$ELECTRON-x86_64.AppImage
mv Electron-Cash-* Electron-Cash.AppImage
wget --user-agent="Mozilla" https://electrum-ltc.org/download/electrum-ltc-$ELECTRUM_LTC-x86_64.AppImage
mv electrum-ltc* electrum-ltc.AppImage
wget --user-agent="Mozilla" https://greenupdate.blockstream.com/desktop/latest/$GREEN/BlockstreamGreen-x86_64.AppImage
wget --user-agent="Mozilla" https://featherwallet.org/files/releases/linux-appimage/feather-$FEATHER.AppImage
mv feather-* feather.AppImage
wget --user-agent="Mozilla" https://github.com/mymonero/mymonero-app-js/releases/download/v$MYMONERO/MyMonero-$MYMONERO.AppImage
mv MyMonero-* MyMonero.AppImage
wget --user-agent="Mozilla" https://github.com/MyCryptoHQ/MyCrypto/releases/download/$MYCRYPTO/linux-x86-64_$MYCRYPTO2.AppImage
mv linux-x86-64* MyCrypto.AppImage
wget --user-agent="Mozilla" https://github.com/adityapk00/zecwallet-lite/releases/download/v$ZEC/Zecwallet.Lite-$ZEC.AppImage
mv Zecwallet* Zecwallet.Lite.AppImage
wget --user-agent="Mozilla" https://storage.coinomi.com/binaries/desktop/coinomi-wallet-$COINOMI-linux64.tar.gz
tar -xf coinomi*
rm -rf coinomi-wallet-$COINOMI-linux64.tar.gz
wget --user-agent="Mozilla" https://github.com/firoorg/electrum-firo/releases/download/$FIRO/Firo-Electrum-$FIRO-x86_64.AppImage
mv Firo-* electrum-firo.AppImage
chmod -R +x *
wget --user-agent="Mozilla" https://downloads.getmonero.org/cli/monero-linux-x64-v$MONEROCLI.tar.bz2
tar -xf monero-linux-x*
rm -rf monero-linux-x*
mv monero-x* monero-cli

# hardware wallets clients
cd HW
wget --user-agent="Mozilla" https://download.live.ledger.com/latest/linux
mv ledger* ledger-live.AppImage
mv linux ledger-live.AppImage
wget --user-agent="Mozilla" https://github.com/trezor/trezor-suite/releases/download/v$TREZOR/Trezor-Suite-$TREZOR-linux-x86_64.AppImage
mv Trezor-Suite* Trezor-Suite.AppImage
wget --user-agent="Mozilla" https://github.com/keepkey/keepkey-desktop/releases/download/v$KEEPKEY/KeepKey-Desktop-$KEEPKEY.AppImage
mv KeepKey-D* KeepKey.AppImage
wget --user-agent="Mozilla" https://data.trezor.io/udev/trezor-udev_2_all.deb
wget --user-agent="Mozilla" https://dl.update.bc-vault.com/downloads/$BCVAULT.tar.gz
tar -xf setup*
./setup*
rm -rf setup*
chmod -R +x *

# Tor-browser
cd /etc/skel/
wget --user-agent="Mozilla" https://www.torproject.org/dist/torbrowser/$TORBROWSER/tor-browser-linux64-$TORBROWSER2.tar.xz
tar -xf tor-browser-linux*
rm -rf tor-browser-linux*
#mv tor-browser tor-browser_en-US

# Other tools
cd /opt/Tools/WalletGen/
git clone https://github.com/bccaddress/bccaddress.org
git clone https://github.com/pointbiz/bitaddress.org
git clone https://github.com/litecoin-project/liteaddress.org
git clone https://github.com/JollyMort/monero-wallet-generator
git clone https://github.com/dashpay/paper.dash.org
cd /opt/Tools/Privacy/
git clone https://github.com/ASeriousMister/passgen.py
cd passgen.py
pip3 install -r requirements.txt
cd /opt/Tools/WalletTools
wget --user-agent="Mozilla" https://github.com/iancoleman/bip39/releases/download/0.5.6/bip39-standalone.html
git clone https://github.com/jlopp/xpub-converter
git clone https://github.com/BitcoinQnA/seedtool
git clone https://github.com/luigi1111/xmr.llcoins.net
git clone https://github.com/OutCast3k/coinbin/
cd /opt/Tools/Recovery
git clone https://github.com/bitpay/copay-recovery
git clone https://github.com/digitalbitbox/bitbox02-backup-recovery

# Getting uSeful AnuBitux scripts 
cd /opt/
git clone https://github.com/AnuBitux-project/scripts
cd scripts
chmod -R +x *
cd

# Updating initram for new files placed in /usr/share/
update-initramfs -u

# Cleaning useless files
rm -rf /usr/share/backgrounds/gnome/*.jpg
rm -rf /usr/share/desktop-base/joy-inksplat-theme
rm -rf /usr/share/desktop-base/joy-theme
rm -rf /usr/share/desktop-base/lines-theme
rm -rf /usr/share/desktop-base/moonlight-theme
rm -rf /usr/share/desktop-base/softwaves-theme
rm -rf /usr/share/desktop-base/spacefun-theme
rm -rf /usr/share/plymouth/themes/futureprototype
rm -rf /usr/share/plymouth/themes/joy
rm -rf /usr/share/plymouth/themes/lines
rm -rf /usr/share/plymouth/themes/moonlight
rm -rf /usr/share/plymouth/themes/softwaves
rm -rf /usr/share/plymouth/themes/spacefun

# Making tools working properly
chmod -R 777 /opt/*

# Starting the bulding process
echo -e remember to update ${RED}/opt/scripts/Info.sh${NC}
echo -e type ${RED}history -c${NC} and ${RED}exit${NC} to start the iso creation process
