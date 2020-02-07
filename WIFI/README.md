## Notes
* Works on 10.15.x
* You must delete SSDT-DRP08.aml if it exists in CLOVER/ACPI/patched/ 

## Installation of IO80211Family
* Now, is not needed

## Installation of AppleIntelWiFi-8265 instructions [gplast](https://github.com/daliansky/XiaoMi-Pro-Hackintosh/issues/330#issuecomment-583196191)
1. Download AppleIntelWiFi.kext.zip
2. Unzip it
3. Open AppleIntelWiFi.kext/Contents/Info.plist with your favorite editor
4. Find and Change the following lines based on your wifi (line 58, 60) <br />
 *BSSID <br />
 *NAMEOFWIFI <br />
 *PWD <br />
 *PASSWORD <br />
5. sudo chown -R root:wheel AppleIntelWiFi.kext
6. sudo kextload -v AppleIntelWiFi.kext/
7. Check if the message is : AppleIntelWiFi.kext loaded successfully (or already loaded).

* Commands: <br />
sudo mv ./*.kext /tmp <br />
sudo chown -R root:wheel /tmp/*.kext <br />
sudo kextload /tmp/*.kext <br />
