# 支持我和这个项目

你好！我叫Johnny，我是一个正在学习工程学的学生。生活和大学学习对我来说是很宝贵、艰难的。我的repo是免费的，所以请赞助我继续维护这个项目。

## 支持我的四种方式：

1.在[PayPal奖励我](https://www.paypal.me/johnnync13)或者通过Kuailian帮我赢得[钱](http://app.kuailiandp.com/auth/register/ref/a03805be-c118-4962-9bbe-87dfceb67802)，我的微信ID是：johnnync13。

2.通过BTC捐助我：3R13Ye85VwuzrBEJf32dZgREHsFsFpoG4m。

3.通过ETH捐助我：0x13f430523CAB662faA6924D6fbA4FdFA973A693b。

4.如果你发现了能改进的地方，开一个[issue](https://github.com/johnnync13/Xiaomi-Mi-Air/issues)或者frok本repo并提交Pull Request。

# 适用于小米笔记本Air 13.3" 2018的EFI文件

## 支持的MacOS版本：

macOS 10.15 Catalina

## 我需要什么？

- 小米笔记本Air 2018 13.3" i5-8250u/ i7-8550u（[2017款](https://github.com/johnnync13/Xiaomi-Mi-Air/issues/157)和[2019款带有MX250显卡](https://github.com/johnnync13/Xiaomi-Mi-Air/issues/135)的型号也适用）

- 一台装有macOS或者Windows的电脑用来创建安装U盘

- 8GB或者更大的U盘（为了速度优先选择USB3）

- 这些文件的最新副本（https://github.com/johnnync13/Xiaomi-Mi-Air/releases）

- （多系统用户可选）第二个安装在电脑上的SSD硬盘（M.2/SATA）

- （可能需要）USB鼠标在安装时使用，直到触控板工作为止

- （可能需要）对于macOS 10.15：一个原生支持的（例如苹果牌）USB-以太网转接器作安装时使用（[Apple](https://www.apple.com/shop/product/MC704LL/A/apple-usb-ethernet-adapter)/[Amazon](https://www.amazon.com/s?k=AX88179)/[Ebay](https://www.ebay.com/sch/i.html?_nkw=AX88179)）

- （可能需要）如果你有一个Android手机，你可以通过Tools/HoRNDIS.kext来连接WIFI。把HoRNDIS.kext放在U盘上，在恢复模式下打开终端使用kextload加载HoRNDIS.kext并用数据线连接手机。

  `sudo kextload -v /Volumes/USB/HoRNDIS.kext #把“USB”换成U盘的名字`

- （可能需要）如果你的电脑带了一块PM981 SSD，考虑换一个别的型号（谷歌搜索黑苹果兼容硬件）或者在另一个M.2/SATA SSD上安装macOS。在PM981上安装macOS有一个已知的问题。这个问题已经被NVMeFix.kext“修复”了。

  # 哪些东西工作正常？

- 原生CPU电源管理

- 睡眠/唤醒

- Intel核芯显卡

- 音频（使用AppleALC）

- 触控板（包括手势）

- HDMI音频和视频

- USB 3.0

- NVMe/SATA 固态硬盘

- 电池管理

- 亮度调节

- 内置摄像头

- 内置麦克风

- 文件保险箱加密（使用这项功能前一定要备份你的文件！！）

  ## 未完美工作

- [Wifi Intel](https://github.com/johnnync13/Xiaomi-Mi-Air/tree/master/WIFI)现在稳定了。只支持802.11n的WIFI，但是未来会支持802.11ac、ax。现在你只需要安装HeliPort app。

- Intel 蓝牙（没有Airdrop、接力）

- **小心：使用Intel蓝牙Kext可能会导致kernel panic或者崩溃当你使用睡眠/唤醒功能时。这个问题已经在最新版本的kext解决。

  ## 不工作

- Nvidia GPU (MX150/GP108) (在macOS下不支持并很可能永远不会支持)

- 指纹传感器（在未来或许使用libfprint，详情看[#94](https://github.com/johnnync13/Xiaomi-Mi-Air/issues/94)）

