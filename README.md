# Support me and this project
Hi, this is Johnny, I'm an Engineering student. Life and university studies are expensive and the work is hard. My repositories are free, please consider rewarding me. Thank you.

### 4 ways to support me:
1. [Reward me on PayPal](https://www.paypal.me/johnnync13) or entry to my pool and win money [Kuailian](http://app.kuailiandp.com/auth/register/ref/a03805be-c118-4962-9bbe-87dfceb67802) or my WeChat ID: johnnync13
2. Donate BTC: 3R13Ye85VwuzrBEJf32dZgREHsFsFpoG4m
3. Donate ETH: 0x13f430523CAB662faA6924D6fbA4FdFA973A693b
4. Please give me feedback: Open (or help with) [issues](https://github.com/johnnync13/Xiaomi-Mi-Air/issues) or fork and send a pull request if you find some improvements to be made!

# EFI Folder for the Xiaomi Mi Notebook Air 13.3" 2018

### MacOS Versions Supported:
* macOS 10.15 Catalina

### What do I need?
* Xiaomi Notebook Air 2018 13.3" i5-8250u / i7-8550u ([2017 model](https://github.com/johnnync13/Xiaomi-Mi-Air/issues/157) and [2019 model with MX250](https://github.com/johnnync13/Xiaomi-Mi-Air/issues/135) also reported to be working)
* macOS or windows PC to create the install USB
* 8GB or larger USB stick (USB3 preferred for speed)
* Latest copy of these files (https://github.com/johnnync13/Xiaomi-Mi-Air/releases)
* (optional for multiboot) Second (M.2 SATA) SSD installed inside the laptop.
* (possibly) USB mouse for install until trackpad is working
* (possibly) For macOS 10.15: a natively supported (e.g. Apple) USB Ethernet adapter for installation ([Apple](https://www.apple.com/shop/product/MC704LL/A/apple-usb-ethernet-adapter) / [Amazon](https://www.amazon.com/s?k=AX88179) / [Ebay](https://www.ebay.com/sch/i.html?_nkw=AX88179))
* (possibly) If you have an android phone, you can tether wifi from it using the Tools/HoRNDIS.kext. Put it on a USB stick, load it in the recovery terminal/Terminal.app using kextload and connect your phone via cable, e.g. (replace 'USB' with your usb stick name):
```
sudo kextload -v /Volumes/USB/HoRNDIS.kext
```
* (possibly) If your laptop came with a PM981 SSD, consider replacing it with a different one (Google Hackintosh compatibility) or install macOS on a separate (M.2 SATA) SSD. There's known issues with the PM981 and macOS. This is currently 'fixed' with the NVMeFix kext.

### What is Working?
* Native CPU Power Management
* Sleep/Wake
* Intel Graphics
* Audio (AppleALC)
* Trackpad (gestures)
* HDMI Video and Audio
* USB 3.0
* NVMe / SATA SSD's
* Battery Management
* Brightness keys
* Built-in camera
* Built-in mic 
* FileVault Disk encryption (Always make a backup before switching on!!!)

### Half working:
* [Wifi Intel](https://github.com/johnnync13/Xiaomi-Mi-Air/tree/master/WIFI) Is stable now. Only implemented 11n stack but in the future 11ac y 11ax will be implemented. You only need install HeliPort app.
* Bluetooth Intel (no Airdrop, Handoff or Continuity on Intel BT)
**Caution: Intel Bluetooth kexts can cause frequent kernel panics / crashes when using sleep/wake. This now is fixed on the last version kext

### Not working:
* Nvidia GPU (MX150/GP108) (Not supported under macOS and probably never will be)
* Fingerprint Sensor (may be possible using libfprint in the future see [#94](https://github.com/johnnync13/Xiaomi-Mi-Air/issues/94))

# Installation
Sounds good! Where do we start? You need a computer with macOS or Windows (scroll down)

## Clover or OpenCore?
First let's figure out if we would like to use Clover or OpenCore. The pro's / con's listed:

### Clover
Pro's (+)
+ Most used, best supported online
+ Easy to configure with [Clover Configurator](https://mackie100projects.altervista.org/download-clover-configurator/)

Con's (-)
- Might be less compatible with macOS updates in the future
- Less secure (csr 67 flag needed to inject kext drivers, SIP, the macOS security system, is off)
- Need to put kext files in /Library/Extensions/

### OpenCore
Pro's (+)
+ Most secure (no csr 67 flag, SIP, the macOS security system, stays on)
+ Most compatible with future upgrades of macOS
+ No need to put kext files in /Library/Extensions/, therefore 'vanilla' macOS install
+ Faster than Clover

Con's (-)
- Complex to customise (Useful tool to edit config: https://github.com/corpnewt/ProperTree)
- (Use with caution) Unnofficial [OpenCore Configurator](https://mackie100projects.altervista.org/opencore-configurator/)
- Without Theme UI until release. (Beta UI now included in this repo)

## Installing from macOS:
### Clover method:
* On your mac, create your macOS USB install media (e.g. https://support.apple.com/en-us/HT201372)
* Mount the ESP (EFI System Partition) on your USB stick: (check that you mount the correct EFI partition, numbers will vary!!!)

```
diskutil list
sudo diskutil mount /dev/disk3s1
```
* Copy and overwrite the contents of the EFI folder on your USB stick with the contents of the EFI folder from this website.
* Eject the USB stick from your computer and insert in the Xiaomi laptop.
* Now boot the Xiaomi laptop from the install media (if trackpad is not working, use USB mouse. If network connection needed, use a Apple compatible USB Ethernet adapter)
* Open Disk Utility and format the builtin SSD or second SSD with APFS (will delete all your files!!!)
* Install macOS 
* After install, boot from USB again but select SSD to boot from in the Clover Bootloader
* Do initial macOS setup (use USB Ethernet adapter for internet)
* Mount the ESP (EFI System Partition) on your SSD (check that you mount the correct EFI partition, numbers will vary!!!)

```
diskutil list
sudo diskutil mount /dev/disk0s1
```
* Copy and overwrite the contents of the EFI folder from this website to the EFI folder on the ESP on your SSD.
* Copy all the Kernel Extensions (kexts) from the EFI/CLOVER/kexts/Other to your system's /Library/Extensions folder (this is important, otherwise keyboard/trackpad and other devices might not work)
* Execute these commands in Terminal to rebuild Kernel Extension Cache:

```
sudo chmod -R 755 /System/Library/Extensions/
sudo chown -R root:wheel /System/Library/Extensions/
sudo chmod -R 755 /Library/Extensions/
sudo chown -R root:wheel /Library/Extensions/
sudo touch /System/Library/Extensions/
sudo touch /Library/Extensions/
sudo kextcache -i / && sudo kextcache -u /
```
* Remove the USB stick from the laptop
* Done! Reboot to enable all the kexts. Enjoy your Hackintosh!

### OpenCore method:
* On your mac, create your macOS USB install media (e.g. https://support.apple.com/en-us/HT201372)
* Mount the ESP (EFI System Partition) on your USB stick: (check that you mount the correct EFI partition, numbers will vary!!!)

```
diskutil list
sudo diskutil mount /dev/disk3s1
```
* Copy and overwrite the contents of the EFI folder on your USB stick with the contents of the EFIOC (opencore) folder from this website.
* Eject the USB stick from your computer and insert in the Xiaomi laptop.
* Now boot the Xiaomi laptop from the install media (if trackpad is not working, use USB mouse. If network connection needed, use a Apple compatible USB Ethernet adapter)
* Open Disk Utility and format the builtin SSD or second SSD with APFS (will delete all your files!!!)
* Install macOS 
* After install, boot from USB again but select SSD to boot from in the OpenCore Bootloader
* Do initial macOS setup (use USB Ethernet adapter for internet)
* Mount the ESP (EFI System Partition) on your SSD (check that you mount the correct EFI partition, numbers will vary!!!)

```
diskutil list
sudo diskutil mount /dev/disk0s1
```
* Copy and overwrite the contents of the EFIOC (opencore) folder from this website to the EFI folder on the ESP on your SSD.
* Remove the USB stick from the laptop
* Done! Reboot and enjoy macOS.

**NOTE**
* It is somewhat important on OpenCore that the laptop have unlocked CFG Lock. Your laptop will work without, but doing the mod results in better CPU power management, sleep/wake and overall better behaviour like a mac. It is very easy on most laptops because the BIOS has an option in the menu. But on Xiaomi Laptops, the BIOS is locked. Read more about it [here](https://github.com/johnnync13/Xiaomi-Mi-Air/tree/master/BIOS).

## From Windows:
### Clover method:
Downloading macOS:
* Download [gibMacOS](https://github.com/corpnewt/gibMacOS/archive/master.zip) from https://github.com/corpnewt/gibMacOS/
* Extract it somewhere and run gibMacOS.bat
* Choose your desired macOS version by entering the number and pressing the ENTER key.
* macOS will now download, grab a coffee.
* Once the download is finished you can exit the program with the keys Q then ENTER

Making the installer USB stick:
* Insert your USB stick
* Now run MakeInstall.bat **as Administrator**
* **IMPORTANT:** In the next step it's important to choose the correct disk, the risk of deleting all the files on that pc are very high! Choose only your USB stick!
* Enter the number of your USB stick and hit ENTER, then type Y and hit ENTER (All files on your USB stick will be deleted!)
* Now go to the 'macOS Downloads\publicrelease' folder inside the 'gibMacOS' folder
* Hold the Shift key and right-click the macOS folder that you want to install on the USB stick and click **Copy as path**
* Go back to the MakeInstall.bat program and right-click in the window to paste the file path, then hit ENTER
* Your USB stick will be created, have a second coffee.
* When it's finished, close the program.

Making the USB stick Xiaomi compatible:
* Download the latest version of the EFI folder from [here](https://github.com/johnnync13/Xiaomi-Mi-Air/releases)
* Extract it somewhere
* Open the BOOT drive from the Windows explorer (usually drive D:, E: or F:)
* Replace the EFI folder on the BOOT drive with the EFI folder you just downloaded from this website.
* Eject the USB stick and insert into Xiaomi laptop.

Installing macOS:
* Now boot the Xiaomi laptop from the install media (if trackpad is not working, use USB mouse. If network connection needed, use a Apple compatible USB Ethernet adapter)
* Open Disk Utility and format the builtin SSD or second SSD with APFS (will delete all your files!!!)
* Install macOS 
* After install, boot from USB again but select SSD to boot from in the Clover Bootloader
* Do initial macOS setup (use USB Ethernet adapter for internet)
* Mount the ESP (EFI System Partition) on your SSD (check that you mount the correct EFI partition, numbers will vary!!!)

```
diskutil list
sudo diskutil mount /dev/disk0s1
```
* Copy and overwrite the contents of the EFI folder from this website to the EFI folder on the ESP on your SSD.
* Copy all the Kernel Extensions (kexts) from the EFI/CLOVER/kexts/Other to your system's /Library/Extensions folder (this is important, otherwise keyboard/trackpad and other devices might not work)
* Execute these commands in Terminal to rebuild Kernel Extension Cache:

```
sudo chmod -R 755 /System/Library/Extensions/
sudo chown -R root:wheel /System/Library/Extensions/
sudo chmod -R 755 /Library/Extensions/
sudo chown -R root:wheel /Library/Extensions/
sudo touch /System/Library/Extensions/
sudo touch /Library/Extensions/
sudo kextcache -i / && sudo kextcache -u /
```
* Remove the USB stick from the laptop
* Done! Reboot to enable all the kexts. Enjoy your Hackintosh!


### OpenCore method:
Downloading macOS:
* Download [gibMacOS](https://github.com/corpnewt/gibMacOS/archive/master.zip) from https://github.com/corpnewt/gibMacOS/
* Extract it somewhere and run gibMacOS.bat
* Choose your desired macOS version by entering the number and pressing the ENTER key.
* macOS will now download, grab a coffee.
* Once the download is finished you can exit the program with the keys Q then ENTER

Making the installer USB stick:
* Insert your USB stick
* Now run MakeInstall.bat **as Administrator**
* **IMPORTANT:** In the next step it's important to choose the correct disk, the risk of deleting all the files on that pc are very high! Choose only your USB stick!
* Enter the number of your USB stick and hit ENTER, then type Y and hit ENTER (All files on your USB stick will be deleted!)
* Now go to the 'macOS Downloads\publicrelease' folder inside the 'gibMacOS' folder
* Hold the Shift key and right-click the macOS folder that you want to install on the USB stick and click **Copy as path**
* Go back to the MakeInstall.bat program and right-click in the window to paste the file path, then hit ENTER
* Your USB stick will be created, have a second coffee.
* When it's finished, close the program.

Making the USB stick Xiaomi compatible:
* Download the latest version of the EFI folder from [here](https://github.com/johnnync13/Xiaomi-Mi-Air/releases)
* Extract it somewhere
* Open the BOOT drive from the Windows explorer (usually drive D:, E: or F:)
* Replace the EFI folder on the BOOT drive with the EFIOC (opencore) folder you just downloaded from this website.
* Eject the USB stick and insert into Xiaomi laptop.

Installing macOS:
* Now boot the Xiaomi laptop from the install media (if trackpad is not working, use USB mouse. If network connection needed, use a Apple compatible USB Ethernet adapter)
* Open Disk Utility and format the builtin SSD or second SSD with APFS (will delete all your files!!!)
* Install macOS 
* After install, boot from USB again but select SSD to boot from in the Opencore Bootloader
* Do initial macOS setup (use USB Ethernet adapter for internet)
* Mount the ESP (EFI System Partition) on your SSD (check that you mount the correct EFI partition, numbers will vary!!!)

```
diskutil list
sudo diskutil mount /dev/disk0s1
```
* Copy and overwrite the contents of the EFIOC (opencore) folder from this website to the EFI folder on the ESP on your SSD.
* Remove the USB stick from the laptop
* Done! Reboot to enable all the kexts. Enjoy your Hackintosh!

**NOTE**
* It is somewhat important on OpenCore that the laptop have unlocked CFG Lock. Your laptop will work without, but doing the mod results in better CPU power management, sleep/wake and overall better behaviour like a mac. It is very easy on most laptops because the BIOS has an option in the menu. But on Xiaomi Laptops, the BIOS is locked. Read more about it [here](https://github.com/johnnync13/Xiaomi-Mi-Air/tree/master/BIOS).

# macOS is working! Next steps:
### (optional) Fixing iMessage, FaceTime etc.
This can be a bit of a challenge, and outside of the scope of this repo, but if you want to, have a look here:<br />
[An iDiot's Guide To iMessage (clover)](https://www.tonymacx86.com/threads/an-idiots-guide-to-imessage.196827/)<br />
[Fixing iServices (OpenCore)](https://dortania.github.io/OpenCore-Desktop-Guide/post-install/iservices.html)

### (optional) WiFi
Still very buggy, but improving fast. Have a look [here](https://github.com/johnnync13/Xiaomi-Mi-Air/tree/master/WIFI)

If your Intel Wifi not working, please **be patient**, the driver is getting better really fast. Until then, use a macOS compatible USB Wifi dongle or Ethernet adapter.

### (optional) Garbled Audio Problems
If you're having audio problems, especially with headphones, read more about it under [Audio](https://github.com/johnnync13/Xiaomi-Mi-Air/tree/master/Audio)

### (optional) Display Color Profile:
Read more in [Display](https://github.com/johnnync13/Xiaomi-Mi-Air/tree/master/Display)

### (optional) High DPI display fix:
Read more in [Display](https://github.com/johnnync13/Xiaomi-Mi-Air/tree/master/Display)


# Troubleshooting
### I have a problem an don't know what to do!
Please read the [issues section](https://github.com/johnnync13/Xiaomi-Mi-Air/issues?q=), and only if your question is not yet answered, submit a new one.

### Some device in my system is not working under macOS!
Using Clover:
* Make sure all kexts are in /Library/Extensions/ then run:
```
sudo chmod -R 755 /System/Library/Extensions/
sudo chown -R root:wheel /System/Library/Extensions/
sudo chmod -R 755 /Library/Extensions/
sudo chown -R root:wheel /Library/Extensions/
sudo touch /System/Library/Extensions/
sudo touch /Library/Extensions/
sudo kextcache -i / && sudo kextcache -u /
```
* Reboot.

Using OpenCore:
* Make sure the kexts are in the EFI/OC/kexts folder on your SSD EFI system partition (ESP).
* Reboot. If still not working, try resetting the NVRAM from OpenCore boot menu.



# Disclaimer!
Use these files and this howto at your own risk. I'm not responsible in any way for lost data, damage to software or hardware or anything else that might go wrong. This works for me but might not for you.

# Credits
- [yllwfsh](https://github.com/yllwfsh) for maintenance, fix issues and create a good friendly README

- [xzhih](https://github.com/xzhih) For the excellent [hidpi](https://github.com/xzhih/one-key-hidpi) script.

- [stevezhengshiqi](https://github.com/stevezhengshiqi) He is a good developer. I'm learning a lot about how to patch problems. Thanks for PCIList.aml and more.

- [RehabMan](https://github.com/RehabMan) Updated [OS-X-Clover-Laptop-Config](https://github.com/RehabMan/OS-X-Clover-Laptop-Config) and [Laptop-DSDT-Patch](https://github.com/RehabMan/Laptop-DSDT-Patch) and [OS-X-USB-Inject-All](https://github.com/RehabMan/OS-X-USB-Inject-All) for maintenance

- [vit9696](https://github.com/vit9696) Updated [Lilu](https://github.com/vit9696/Lilu) and [AppleALC](https://github.com/vit9696/AppleALC) and [WhateverGreen](https://github.com/vit9696/WhateverGreen)  for maintenance

- [alexandred](https://github.com/alexandred) Updated [Voodooi2c](https://github.com/alexandred/VoodooI2C) for maintenance

- [Community Chinese](https://github.com/a565109863) Updated [Intel Wifi](https://bbs.pcbeta.org/forum.php?mod=viewthread&tid=1838489) for intel wifi and tutorial
