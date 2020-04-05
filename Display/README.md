# Display fixes
## Display Color Profile
Copy the .icm files from the [ColorProfile](https://github.com/johnnync13/Xiaomi-Mi-Air/tree/master/Display/ColorProfile) folder to /Library/ColorSync/Profiles/ and pick one in System Preferences, Displays, Color tab. They have different white balance levels so pick whichever you like.

## High DPI display fix
Since the text on the 13" display can be quite small for many people in 1920x1080 resolution, it's possible to use some of the High DPI scaling features of macOS. To enable those:

* Boot into the Recovery partition (in Clover hit (Fn+)F3 to show all partitions)
* We need to temporarily disable SIP. Run Terminal from the Utilities menu and run:
```
csrutil disable
```
* Reboot into normal macOS
* Open Terminal and run the [hidpi.sh](https://github.com/johnnync13/Xiaomi-Mi-Air/blob/master/Display/HighDPI/hidpi.sh) script:
```
bash -c "$(curl -fsSL https://github.com/johnnync13/Xiaomi-Mi-Air/raw/master/Display/HighDPI/hidpi.sh)"
```
* Choose (1) Enable, (3) MacBook Pro and (1) 1920x1080 Display.
* Reboot and test your new Display settings in System Preferences.
* When all set, reboot back into Recovery and enable SIP again:
```
csrutil enable
```
* Reboot into macOS. Done!
