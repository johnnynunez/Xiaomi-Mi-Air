* Works on 10.15.2 but works bether work in Mojave. <br />
You must delete SSDT-DRP08.aml if exist in clover/ACPI/patched/ 

* Kext Installation in 10.15.x:
Place IO80211Family.kext on the first floor /Library/Extensions, repair permissions, rebuild Cache <br />
Do not open the system configuration, otherwise it will restart automatically.

* Kext Installation in 10.14.x: <br />
Not install IO80211Family.kext

* Installation AppleIntelWifi: <br />
1. Extract the driver file into a .kext file and place it on your desktop.
2. Open a terminal (equivalent to the command line in Windows).
3. Enter cd ~ / desktop (this line means entering the desktop and converting the desktop to the current directory)
4. Enter sudo chown -R root: wheel * .kext (* .kext is your driver file. The role of this line is Grant administrator permissions for the following operations)
5. Enter your root password and press Enter. If the password is not available, you can press Enter.
6. Enter sudo chmod -R 755 * .kext (import the driver)
7. sudo kextload -v * .kext (load the driver, you can see the name of your device if it is normal)

* Commands: <br />
sudo mv ./*.kext /tmp <br />
sudo chown -R root:wheel /tmp/*.kext <br />
sudo kextload /tmp/*.kext <br />
