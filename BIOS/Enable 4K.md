# 中文
# 免责声明 如果你根据这个步骤做出了任何问题，后果自负
### DVMT
我不确定是否需要刷DVMT但我是刷了之后才成功开启4k的，刷DVMT步骤，我尝试了很多小米的解锁bios，修改DVMT脚本，有一次把自己电脑bios刷成砖了，无法进入系统和bios设置面板，只能进入选择启动项页面，后来通过u盘刷bios刷好了，如果你刷成砖了，留言，我把刷的工具发你。修改的步骤如下
* 解锁bios，使用[这个脚本](https://github.com/johnnync13/Xiaomi-Mi-Air/blob/master/BIOS/Unlock_Scripts/bios_unlock.cmd)解锁，也就是本仓库下的文件
* 运行改DVMT脚本，使用[这个其他库的](https://github.com/daliansky/XiaoMi-Pro-Hackintosh/blob/master/BIOS/DVMT_and_0xE2_fix/DVMT_set.cmd)脚本，我自己尝试了，没问题，air应该都可以成功
* 修改clover Devices/ Properties的配置,改成和 [这个文件](https://github.com/daliansky/XiaoMi-Pro-Hackintosh/blob/master/CLOVER/config.plist)一样的，然后删除plist相关设置，具体参考 [这个库的wiki](https://github.com/daliansky/XiaoMi-Pro-Hackintosh/wiki/%E8%AE%BE%E7%BD%AE64mb%E5%8A%A8%E6%80%81%E6%98%BE%E5%AD%98),我不太懂是啥意思，但是这样搞开了4k
### 开启方法
* 一般开机后需要合上电脑盖子，然后再打开4k就开启了，如果不行多尝试几次，如果还是不行，看下你是否每个步骤都做对了

总之我是参考多个库的内容自己尝试后整出来的
# 我的电脑信息 系统信息报告里面复制的
Intel HD Graphics 620：

  * 芯片组型号：	Intel HD Graphics 620
  * 类型：	GPU
  * 总线：	内建
  * 插槽：	PCI-Express
  * VRAM（动态，最大值）：	1536 MB
  * 供应商：	Intel
  * 设备ID：	0x5916
  * 修正版ID：	0x0002
  * Metal：	支持，功能集macOS GPUFamily2 v1
  * 显示器：LG HDR 4K：
  * 分辨率：	3840 x 2160（2160p/4K UHD 1 - 超高清）
  * UI看起来类似：	1920 x 1080 @ 30 Hz
  * 帧缓冲深度：	30位彩色(ARGB2101010)
  * 主显示器：	是
  * 镜像：	关
  * 联机：	是
  * 旋转：	支持
  * 自动调节亮度：	否
  * 连接类型：	DisplayPort

# English
# Disclaimer 
## I WOULD NOT be responsible for any damage to your computer if you follow these steps
### DVMT
I'm not sure whether I should change the DVMT to 64MB,but I did change it to enable 4k output. I tried many scripts to change DVMT,even bricked my bios once,If unfortunately, this happen to you,you can ask me for flashing bios tools

follow these steps to set DVMT first
* unlock bios ，use [this script](https://github.com/johnnync13/Xiaomi-Mi-Air/blob/master/BIOS/Unlock_Scripts/bios_unlock.cmd) which is in this repository to unlock bios
* set DVMT to 64MB，use [this script from other repository](https://github.com/daliansky/XiaoMi-Pro-Hackintosh/blob/master/BIOS/DVMT_and_0xE2_fix/DVMT_set.cmd),I tried,It really works
* Change clover Devices/ Properties to the same as [this file](https://github.com/daliansky/XiaoMi-Pro-Hackintosh/blob/master/CLOVER/config.plist),then remove some settings in .plist file see this [wiki](https://github.com/daliansky/XiaoMi-Pro-Hackintosh/wiki/%E8%AE%BE%E7%BD%AE64mb%E5%8A%A8%E6%80%81%E6%98%BE%E5%AD%98) for more details
### Usage
Close your laptop lid  after you start your computer ,then open it, the monitor will be set to 4k 1080P HIDPI,If nothing happens,do it one more time and make sure you do all these steps correctly

I DO NOT know much about Hackintosh,I just tried many methods myself and make it to work,if you know more than me,just ignore it


# About my computer and monitor from system report
Intel HD Graphics 620:

  * Chipset Model:	Intel HD Graphics 620
  * Type:	GPU
  * Bus:	Built-In
  * Slot:	PCI-Express
  * VRAM (Dynamic, Max):	1536 MB
  * Vendor:	Intel
  * Device ID:	0x5916
  * Revision ID:	0x0002
  * Metal:	Supported, feature set macOS GPUFamily2 v1
  * Displays: LG HDR 4K:
  * Resolution:	3840 x 2160 (2160p/4K UHD 1 - Ultra High Definition)
  * UI Looks like:	1920 x 1080 @ 30 Hz
  * Framebuffer Depth:	30-Bit Color (ARGB2101010)
  * Main Display:	Yes
  * Mirror:	Off
  * Online:	Yes
  * Rotation:	Supported
  * Automatically Adjust Brightness:	No
  * Connection Type:	DisplayPort
