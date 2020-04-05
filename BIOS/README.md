# Disclaimer!
Modifying the BIOS can be dangerous! Use these scripts at your own risk. I'm not responsible in any way for lost data, damage to software or hardware or anything else that might go wrong.

# BIOS Modification

**IMPORTANT: Thes scripts only work on the Xiaomi Mi Notebook air 13,3" 2018 Model (TM1703)**

These [Unlock scripts](https://github.com/johnnync13/Xiaomi-Mi-Air/tree/master/BIOS/Unlock_Scripts) only run under Windows. Tested under latest Windows 10.

## IMPORTANT Before you start doing ANYTHING
1. Read this entire How To before you start and know what you are doing!
2. Make a backup of your BIOS bin using `Backup.cmd` and save `mybackup.bin` to a cloud (Google Drive, Dropbox, Email to yourself etc.)

## If after reading all of this you still want to unlock your BIOS

1. Open Windows PowerShell **as Administrator** and run:
```
Set-ExecutionPolicy Unrestricted -Scope CurrentUser
```
2. Close PowerShell
3. Run `bios_unlock.cmd` **as Administrator** (This unlocks your BIOS to change settings)
**NOTE The first time you might get a warning and a notification from Windows Defender (or other virus scanner) that the executable was blocked. Go in to the Defender settings and make sure that the exe is allowed.**
4. Reboot
5. Run `CFG_unlock.cmd` **as Administrator** (This unlocks the CFG Lock)
6. Reboot
7. (optional) Run `voltage_unlock.cmd` **as Administrator** (This unlocks the CPU core voltage lock, possibility to undervolt the CPU using [VoltageShift](https://github.com/johnnync13/Xiaomi-Mi-Air/tree/master/BIOS/VoltageShift))
8. Reboot
9. (optional) Run `speedshift_unlock.cmd` **as Administrator** (This enables SpeedShift, normally already enabled)
10. Reboot
11. If everything still works, then you can lock your BIOS again for security reasons. Run `bios_lock.cmd` **as Administrator** 
12. Reboot

## Fixing OpenCore config.plist for native CPU Power Management

Now that we have native CPU power management, we can remove the normally applied 'hacks' in Opencore.
Open `/EFI/OC/config.plist`, find the following code:
```
<key>AppleCpuPmCfgLock</key>
<true/>
<key>AppleXcpmCfgLock</key>
<true/>
```
Change to:
```
<key>AppleCpuPmCfgLock</key>
<false/>
<key>AppleXcpmCfgLock</key>
<false/>
```

## Credits

- Thanks to [FallenChromium](https://github.com/FallenChromium) and [Cyb](http://4pda.ru/forum/index.php?showuser=914121) for writing the script and instruction.
