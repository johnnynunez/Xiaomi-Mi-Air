## Notes
* Works on 10.15.x. (If you are on 10.14.x, read [this](https://github.com/zxystd/itlwm/issues/5#issuecomment-600401196))
* You must delete SSDT-DRP08.aml if it exists in EFI/CLOVER/ACPI/patched/ or EFI/OC/ACPI/
* Only the **non-encrypted** Wi-Fi connection including mobile hotspot is currently supported. Wi-Fi SSID is hardcoded as `Redmi` and will auto-connect once the Kext is loaded.
* All credits go to [zxystd](https://github.com/zxystd). His project [itlwm](https://github.com/zxystd/itlwm).
## Usage
1. Make sure you have `Redmi` network available. 
2. Download wifi kext or build it by yourself.
    * Kext, that is [built](https://github.com/daliansky/XiaoMi-Pro-Hackintosh/issues/330#issuecomment-600217664) by [stevezhengshiqi](https://github.com/stevezhengshiqi): [itlwm.Mar.17.zip](https://github.com/daliansky/XiaoMi-Pro-Hackintosh/files/4345001/itlwm.Mar.17.zip)
    * Project to build from: [itlwm](https://github.com/zxystd/itlwm) by [zxystd](https://github.com/zxystd)
3. Unzip kext
4. ```sh
   sudo chown -R root:wheel itlwm.kext
   ```
5. ```sh
   sudo kextload -v itlwm.kext
   ```
6. Check if the message is: `itlwm.kext loaded successfully (or already loaded)`.

Intel WiFi is still very buggy for now, but rapidly improving. There have been reports of random crashes and reboots, use at your own risk! 

## Other links
* Another project: [adapter](https://github.com/AppleIntelWifi/adapter). Maintained by [hatf0](https://github.com/hatf0).
* [More info](https://github.com/daliansky/XiaoMi-Pro-Hackintosh/issues/330#issuecomment-600217891) by [MarshalX](https://github.com/MarshalX) about *itlwm* kext.