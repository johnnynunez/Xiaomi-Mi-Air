# Tools


### Android Tethering
If you have an android phone, you can tether wifi from it using the HoRNDIS.kext. Put it on a USB stick, load it in the recovery terminal/Terminal.app using kextload and connect your phone via cable, e.g. (replace 'USB' with your usb stick name):
```
sudo kextload -v /Volumes/USB/HoRNDIS.kext
```