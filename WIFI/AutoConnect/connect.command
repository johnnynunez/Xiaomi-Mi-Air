#!/bin/bash
echo "This a bash script created for https://github.com/zxystd/itlwm (itlwm.kext) from @gplast to enable Wifi connection to different Access points through the Terminal. Support @zxystd for his create work!!"
echo "CAUTION: You need to place itlwm.kext on the Desktop or edit the script to your preferred location."
echo "Give password for SUDO privileges:"
cd Desktop/
sudo rm -rf itlwm.kext
sudo rm -rf __MACOSX
unzip -q itlwm.kext.zip
echo Checking if kext is loaded and unloading it . . 
sudo kextunload itlwm.kext
cd itlwm.kext/Contents/
echo Give BSSID and Password of Wifi Access Point
read -p 'SSID: ' ssid
sed -i '' s/wifi_name/"$ssid"/ Info.plist
read -sp 'Password: ' password
sed -i '' s/wifi_password/"$password"/ Info.plist
# rm -rf Info_tmp.plist
cd ../../
echo -e "\nLoading Kext . . ."
sudo chmod -R 744 itlwm.kext
sudo chown -R root:wheel itlwm.kext
sudo kextload itlwm.kext
sudo rm -rf itlwm.kext
sudo rm -rf __MACOSX
echo "You have successfully loaded the Kext. If you see errors on the terminal, fix them and try again!"
echo "Have a nice day :)"
sleep 1
exit 0
