# Support me and this project
Hi, this is Johnny, I'm an Engineering student. Life and university studies are expensive and the work is hard. My repositories are free, please consider rewarding me. Thank you.

### 4 ways to support me:
1. [Reward me on PayPal](https://www.paypal.me/johnnync13)
2. Donate BTC: 3R13Ye85VwuzrBEJf32dZgREHsFsFpoG4m
3. Donate ETH: 0x13f430523CAB662faA6924D6fbA4FdFA973A693b
4. Please give me feedback: Open (or help with) [issues](https://github.com/johnnync13/Xiaomi-Mi-Air/issues) or fork and send a pull request if you find some improvements to be made!

# EFI Folder for the Xiaomi Mi Notebook Air 13.3" 2018

### MacOS Versions Supported:
* macOS 10.13 High Sierra
* macOS 10.14 Mojave
* macOS 10.15 Catalina

### What do I need?
* Xiaomi Notebook Air 2018 13.3" i5-8250u / i7-8550u
* Real mac or windows PC to create the install USB
* 8GB or larger USB stick (USB3 preferred for speed)
* Latest copy of these files (https://github.com/johnnync13/Xiaomi-Mi-Air/releases)
* (possibly) USB mouse for install until trackpad is working
* (possibly) For macOS 10.15: a natively supported (e.g. Apple) USB Ethernet adapter for installation

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
* Bluetooth Intel
* FileVault Disk encryption (Always make a backup before switching on!!!)

### Half working:
* [Wifi Intel](https://github.com/johnnync13/Xiaomi-Mi-Air/tree/master/WIFI) (still buggy for now)

### Not working:
* Nvidia GPU (MX150/GP108) (Not supported under macOS and probably never will be)

# Installation
Sounds good! Where do we start? You need a computer with macOS or Windows:

## From macOS:
### Clover method:
* On a real mac, create your macOS USB install media (e.g. https://support.apple.com/en-us/HT201372)
* Install Clover bootloader on USB stick. Select 'Install to ESP' (https://sourceforge.net/projects/cloverefiboot/files/latest/download)
* Mount the ESP (EFI System Partition) on your USB stick: (check that you mount the correct EFI partition, numbers will vary!!!)

```
diskutil list
sudo diskutil mount /dev/disk3s1
```
* Copy and overwrite the EFI/CLOVER folder from this website to the EFI folder on the ESP.
* Now boot the Xiaomi laptop from the install media (if trackpad is not working, use USB mouse)
* Open Disk Utility and format the builtin SSD with APFS (will delete all your files!!!)
* Install macOS 
* After install, boot from USB again but select SSD to boot from Clover Bootloader
* Do initial macOS setup (use USB ethernet adapter for internet)
* Install Clover on the SSD. Select 'Install to ESP' (https://sourceforge.net/projects/cloverefiboot/files/latest/download)
* Mount the ESP (EFI System Partition) on your SSD (check that you mount the correct EFI partition, numbers will vary!!!)

```
diskutil list
sudo diskutil mount /dev/disk0s1
```
* Copy and overwrite the EFI/CLOVER folder from this website to the EFI folder on the ESP.
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
* Done! Reboot to enable all the kexts. Enjoy your Hackintosh!

### OpenCore method:
Coming soon

## From Windows:
### Clover method:
Coming soon

### OpenCore method:
Coming soon

# macOS is working! Next steps:
### (optional) Fixing iMessage, FaceTime etc.
This can be a bit of a challenge, and outside of the scope of this repo, but if you want to, have a look here:<br />
[An iDiot's Guide To iMessage (clover)](https://www.tonymacx86.com/threads/an-idiots-guide-to-imessage.196827/)<br />
[Fixing iServices (OpenCore)](https://khronokernel-2.gitbook.io/opencore-vanilla-desktop-guide/extras/iservices)

### (optional) WiFi
Still very buggy, but improving fast. Have a look [here](https://github.com/johnnync13/Xiaomi-Mi-Air/tree/master/WIFI)

If your Intel Wifi not working, please be patient. The Intel wifi kext is really good, it's a [project](https://github.com/zxystd/AppleIntelWifiAdapter) of [zxystd](https://github.com/zxystd)

### (optional) Garbled Audio Problems
If you're having audio problems, especially with headphones, run the install.command script inside the [ALCPlugFix](https://github.com/johnnync13/Xiaomi-Mi-Air/tree/master/ALCPlugFix_Xiaomi_Air_13_alc255Gen) folder. This will install a fix, then reboot. Audio should be better.

### (optional) Hackintosh combojack how to
[hackintosh-stuff](https://github.com/hackintosh-stuff) thanks to his repository we can fix the headphone jack: https://github.com/hackintosh-stuff/ComboJack

### (optional) Display Color Profile:
Copy the .icm files from the [ColorProfile](https://github.com/johnnync13/Xiaomi-Mi-Air/tree/master/ColorProfile) folder to /Users/<your_user>/Library/ColorSync/Profiles/ and pick one in System Preferences, Displays, Color tab. They have different white balance levels so pick whichever you like.

# Disclaimer!
Use these files and this howto at your own risk. I'm not responsible in any way for lost data, damage to software or hardware or anything else that might go wrong. This works for me but might not for you.

# Credits
- [stevezhengshiqi](https://github.com/stevezhengshiqi) He is a good developer. I'm learning a lot about how to patch problems. Thanks for PCIList.aml and more.

- [RehabMan](https://github.com/RehabMan) Updated [OS-X-Clover-Laptop-Config](https://github.com/RehabMan/OS-X-Clover-Laptop-Config) and [Laptop-DSDT-Patch](https://github.com/RehabMan/Laptop-DSDT-Patch) and [OS-X-USB-Inject-All](https://github.com/RehabMan/OS-X-USB-Inject-All) for maintenance

- [vit9696](https://github.com/vit9696) Updated [Lilu](https://github.com/vit9696/Lilu) and [AppleALC](https://github.com/vit9696/AppleALC) and [WhateverGreen](https://github.com/vit9696/WhateverGreen)  for maintenance

- [alexandred](https://github.com/alexandred) Updated [Voodooi2c](https://github.com/alexandred/VoodooI2C) for maintenance
- [Community Chinese](https://github.com/a565109863) Updated [Intel Wifi](https://bbs.pcbeta.org/forum.php?mod=viewthread&tid=1838489) for intel wifi and tutorial

