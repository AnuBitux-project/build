# Build AnuBitux
How we build AnuBitux and how to build it by yourself   
More info on our [official website](https://anubitux.org/how-to-build-anubitux-by-yourself/)  
This project is fueled with a lot of beer, if you enjoy it, please consier making a [donation](https://www.buymeacoffee.com/anubitux)  
Curios about who we are? [Click here](https://anubitux.org/meet-the-anubitux-project/)!  

## Prerequisites
Before starting install the following tools
```
sudo apt install live-build squashfs-tools syslinux-common syslinux-utils xorriso isolinux
```
## Preparation
Then create a working directory to use for the process
```
mkdir distro
```
Move into it
```
cd distro
```
Configure the iso parameters
```
lb config -b iso -d bookworm --cache true --apt-recommends true -a amd64 --binary-images iso --debian-installer none --linux-flavours amd64 --mode debian --debian-installer-gui false --archive-areas "main contrib non-free non-free-firmware" --security true --win32-loader false --interactive shell --updates true --iso-application anubitux --iso-publisher https://anubitux.org --iso-volume anubitux --memtest none --bootappend-live "boot=live config hostname=AnuBitux username=anubitux"
```
If you want to able to install it, use this parameters, but consideer that AnuBitux has been designed to be used in an amnesic way
```
lb config -b iso -d bookworm --cache true --apt-recommends true -a amd64 --binary-images iso --debian-installer live --linux-flavours amd64 --mode debian --debian-installer-gui true --archive-areas "main contrib non-free non-free-firmware" --security true --win32-loader false --interactive shell --updates true --iso-application anubitux --iso-publisher https://anubitux.org --iso-volume anubitux --memtest none --bootappend-live "boot=live config hostname=AnuBitux username=anubitux"
```
Obtain root privileges
```
sudo -s
```
Start the building, creating a chroot environment
```
lb build
```
Wait until it finishes...it may take a while

## Building
Now open another terminal, download the anubitux_script.sh and copy it into the chroot environment
```
sudo cp anubitux_script.sh $HOME/distro/chroot
```
Now, in the terminal you are using for the building process, give executions right to the scipt
```
chmod +x anubitux_script.sh
```
and run it
```
./anubitux_script.sh
```
Now wait until it finishes and answer to the prompted questions
When over, consider fixing distro details in the /opt/scripts/Info.sh file with
```
nano /opt/scripts/Info.sh
```
then type 
```
history -c
```
and
```
exit
```
to start the iso creation process.
Before burning it to a USB stick, type
```
isohybrid iso_name.iso
```

## Disclaimer

AnuBitux is a free project that aims to provide a secure and safe environment to use cryptocurrencies, showing some use cases and tutorials. All the tools included have been downloaded from trusted sources like official Debian repositories, GitHub and official websites.
Although, no guarantee is provided with it. The User is always supposed to know what he's doing and how to manage sensitive information and backup himself.
The AnuBitux team takes no responsibility for malfunctioning tools or unsafe usage of its solutions and tutorials.
The AnuBitux distro and the related tutorials are provided "as-is" and without warranty of any kind, express, implied or otherwise, without limitation, any warranty of fitness for a particular purpose. 
Downloading the AnuBitux distro, the User implicitly accepts to use it, considering himself as responsible for the actions he will carry out and that the AnuBitux team is not responsible in any way for eventual malfunctions or misconfigured tools.

