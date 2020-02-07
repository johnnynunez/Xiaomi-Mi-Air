## Notes
* Works on 10.15.x
* You must delete SSDT-DRP08.aml if it exists in CLOVER/ACPI/patched/ 

## Installation of IO80211Family
* Now, is not needed

## Installation of AppleIntelWiFi-8265
1. Extract the driver file into a .kext file and place it on your desktop.
2. Open a terminal (equivalent to the command line in Windows).
3. Enter `cd ~ /Desktop` With this command you change to the Desktop as your working directory.
4. Enter `sudo chown -R root: wheel * .kext` "* .kext" is reffering to your driver file. The role of this line is to grant administrator permissions for the next operations.
5. Now enter your root password and press Enter. If the password is not available, you can just press Enter.
6. Enter `sudo chmod -R 755 * .kext` Set appropriate permissions for the driver
7. Enter `sudo kextload -v * .kext` This loads the driver, you can see the name of your device if it works.

* Commands: <br />
sudo mv ./*.kext /tmp <br />
sudo chown -R root:wheel /tmp/*.kext <br />
sudo kextload /tmp/*.kext <br />
