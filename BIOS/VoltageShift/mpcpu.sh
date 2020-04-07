#!/bin/bash

# Pasi 写于 2019-7 脚本参考 stevezhengshiqi 的hidpi 自动语言选择脚本参考 xzhih 的one-key-hidpi
# Pasi Written in 2019-7 Script reference stevezhengshiqi's hidpi automatic language selection script reference xzhih's one-key-hidpi
# 你可以到此网页与我取得联系 https://pasi.cat/about
# You can get my contact information on this page https://pasi.cat/about
# 只支持小米笔记本Pro和小米笔记本GTX (i5-8250U & i7-8550U)
# Only supported for Xiaomi Mibook Pro and Xiaomi Mibook GTX (i5-8250U & i7-8550U)

systemLanguage=($(locale | grep LANG | sed s/'LANG='// | tr -d '"' | cut -d "." -f 1))

prompt1="Only supported for Xiaomi Mibook Pro and Xiaomi Mibook GTX"
prompt2="Before installation !important"
prompt3="Reboot to Windows (Windows to go supported!)"
prompt4="Download unlock Tool https://file.pasi.cat/powercpu/BIOS_unlock.zip"
prompt5="Unlock Bios voltage limit:"
prompt6="Run as administrator voltage_unlock.cmd"
prompt7="Restart after the run ends."
prompt8="This script will be available else input 10 to exit (Remember to install the main program)"
prompt9="Tip:All of the above options LP2 available time is 28S"
prompt10="Low voltage option ?"
prompt11="Application mode ？"
prompt12="Tip: No need to restart after Temporary and Permanent"
prompt13="Network connection error!!!Please check the network connection."
prompt14="Download related files..."
prompt15="Download completed"
prompt16="Copying file to target path..."
prompt17="Fixing permissions..."
prompt18="Cleaning up temporary files..."
prompt19="Clean up finished"
prompt20="Main program installation completed Return to the main menu after 3S"
prompt21="Applying settings..."
prompt22="Success"
prompt23="Setting up auto start..."
prompt24="Tip: Default option does not include voltage settings！！"
prompt25="Error: Invalid input!!!"
prompt26="Checking current status..."
prompt27="Deleting link"
prompt28="Removing related files"
prompt29="Uninstallation is complete, remember to restart"

select1="(1) Installation Script main program"
select2="(2) LP1 15W LP2 44W [default setting]"
select3="(3) LP1 20W LP2 44W [Small increase]"
select4="(4) LP1 25W LP2 44W [PRO Recommend]"
select5="(5) LP1 30W LP2 40W [GTX Recommend]"
select6="(6) LP1 35W LP2 40W [Radical option]"
select7="(7) LP1 40W LP2 40W [Super fast]"
select8="(8) Check status"
select9="(9) Uninstaller"
select10="(10) Exit"
select11="(1) Low voltage 0.09V"
select12="(2) Low voltage 0.05V"
select13="(1)Temporary Return to default settings after reboot"
select14="(2)Permanent Use current settings after reboot"

input="Enter your choice"
position="/Library/Application Support/VoltageShift"
download_dir="https://github.com/johnnync13/Xiaomi-Mi-Air/raw/master/BIOS/VoltageShift/VoltageShift.zip"

if [[ "${systemLanguage}" == "zh_CN" ]]; then
    prompt1="此脚本只限于小米笔记本Pro 和 小米笔记本GTX!"
    prompt2="安装前要 !important"
    prompt3="重启进入Windows作业系统（可以WTG启动）"
    prompt4="下载解锁工具 https://file.pasi.cat/powercpu/BIOS_unlock.zip"
    prompt5="解锁BIOS电压限制："
    prompt6="进入Windows，用管理员身份运行voltage_unlock.cmd"
    prompt7="等待进程结束后重启"
    prompt8="随后你便可以使用本脚本 (记得安装脚本主程序) 否则 请输入10退出"
    prompt9="Tip:上述所有选项 LP2可用时间皆为28S"
    prompt10="降压选项 ?"
    prompt11="应用模式？"
    prompt12="Tip: 临时应用和永久应用完成后都无需重启。"
    prompt13="咩啊 小老弟要不去检查下你的网络？？？"
    prompt14="正在下载相关文件..."
    prompt15="下载完成"
    prompt16="正在拷贝文件到目标路径..."
    prompt17="正在修复权限..."
    prompt18="正在清理临时文件..."
    prompt19="清理完成"
    prompt20="主程序安装完成 3S后返回主菜单"
    prompt21="正在应用设置..."
    prompt22="设置完成"
    prompt23="正在设置自动启动..."
    prompt24="Tip: 默认选项不包含电压设置！！"
    prompt25="错误: 无效输入,喵喵喵？？？ 小老弟你怎么回事"
    prompt26="正在检查当前状况..."
    prompt27="正在解除注册"
    prompt28="正在移除相关文件"
    prompt29="卸载完成，记得重启'"

    select1="(1) 安装脚本主程序"
    select2="(2) LP1 15W LP2 44W 默认设置"
    select3="(3) LP1 20W LP2 44W 小幅提升"
    select4="(4) LP1 25W LP2 44W PRO 推荐"
    select5="(5) LP1 30W LP2 40W GTX 推荐"
    select6="(6) LP1 35W LP2 40W 激进选项"
    select7="(7) LP1 40W LP2 40W 脱缰野马"
    select8="(8) 检查状态"
    select9="(9) 卸载程序"
    select10="(10) 退出"
    select11="(1) 降压 0.09V"
    select12="(2) 降压 0.05V"
    select13="(1)临时应用 重启后回归默认设置"
    select14="(2)永久应用 重启后采用当前设置"

    input="输入你的选择"
fi

function command1() {
    sudo "$position"/voltageshift powerlimit $LP1 28 $LP2 0.001
}
function command2() {
    sudo chown -R root:wheel "$position"/voltageshift.kext
}
function command3() {
    sudo "$position"/voltageshift removelaunchd
}
function command4() {
    sudo "$position"/voltageshift offset $volta $volta $volta
}
function command5() {
    sudo "$position"/voltageshift info
}
function command6() {
    sudo "$position"/voltageshift buildlaunchd $volta $volta $volta 0 0 0 $LP1 28 $LP2 0.001 60
}

function interface() {
    echo '============================================'
    echo '  ______    ______    ______    _ '
    echo ' |  __  |  |  __  |  |  ____|  | |'
    echo ' | |__| |  | |__| |  | |____   | |'
    echo ' |  ____|  |  __  |  |____  |  | |'
    echo ' | |       | |  | |   ____| |  | |'
    echo ' |_|       |_|  |_|  |______|  |_|'
    echo "$prompt1"
    echo '============================================'
    echo "$prompt2"
    echo "$prompt3"
    echo "$prompt4"
    echo "$prompt5"
    echo "$prompt6"
    echo "$prompt7"
    echo "$prompt8"
    echo
}

# Select option / 选择选项
function choice1() {
    choose=0
    echo "$select1"
    echo "$select2"
    echo "$select3"
    echo "$select4"
    echo "$select5"
    echo "$select6"
    echo "$select7"
    echo "$select8"
    echo "$select9"
    echo "$select10"
    echo
    echo "$prompt9"
    read -p "$input [1~10]: " choose1
}

function choice2() {
    clear
    echo "$prompt10"
    choose=0
    echo "$select11"
    echo "$select12"
    echo
    read -p "$input [1~2]: " choose2
}

function choice3() {
    clear
    echo "$prompt11"
    echo "$prompt12"
    choose=0
    echo "$select13"
    echo "$select14"
    echo
    read -p "$input [1~2]: " choose3
}

# If Network connection error , Exit / 如果网络连接失败，则退出
function networkWarn(){
    echo "$prompt13"
    clean
    exit 1
}

# Install the main program / 安装主程序
function install() {
    echo "$prompt14"
    mkdir -p temp
    cd temp
    curl -fsSL "$download_dir" -O || networkWarn
    unzip VoltageShift.zip
    echo "$prompt15"
    echo "$prompt16"
    sudo mkdir -p "$position"
    sudo cp ./voltageshift "$position"
    sudo cp -R ./VoltageShift.kext "$position"
    echo "$prompt17"
    command2
    echo "$prompt18"
    sudo rm -rf ../temp
    echo "$prompt19"
    echo "$prompt20"
    sleep 3
    clear
    main
}

# 实时生效 / Application settings
function run() {
    echo "$prompt21"
    command1
    echo "$prompt22"
    echo "$prompt24"
    echo
}

# 开机自启 / Auto Run
function autorun() {
    run
    echo "$prompt23"
    cd "$position"
    command6
    echo "$prompt22"
    echo "$prompt24"
}

# Check status / 检查状态
function info() {
    echo "$prompt26"
    command5
    exit 0
}

# Uninstaller / 卸载程序
function uninstall() {
    echo "$prompt27"
    cd "$position"
    command3
    echo "$prompt28"
    sudo rm -rf "$position"
    echo "$prompt29"
    exit 0
}

# Main / 主程序
function main() {
    interface
    choice1
    case $choose1 in
        1)
        install
        ;;

        2)
        function sysde() {
            interface
            choice2
            case $choose2 in
                1)
                lownt
                function sysdede() {
                interface
                choice3
                case $choose3 in
                        1)
                        LP1="15"
                        LP2="44"
                        run
                        ;;

                        2)
                        LP1="15"
                        LP2="44"
                        volta="0"
                        autorun
                        ;;

                    esac
                }
                sysdede     
                ;;

                2)
                lowft
                function sysdedb() {
                interface
                choice3
                case $choose3 in
                        1)
                        LP1="15"
                        LP2="44"
                        run
                        ;;

                        2)
                        LP1="15"
                        LP2="44"
                        volta="0"
                        autorun
                        ;;

                    esac
                }
                sysdedb
                ;;

            esac
        }
        sysde
        ;;
        
        3)
        function sysdb() {
            interface
            choice2
            case $choose2 in
                1)
                lownt
                function smpcputh() {
                interface
                choice3
                case $choose3 in
                        1)
                        LP1="20"
                        LP2="44"
                        volta="-90"
                        command4
                        run
                        ;;

                        2)
                        LP1="20"
                        LP2="44"
                        volta="-90"
                        command4
                        autorun
                        ;;

                    esac
                }
                smpcputh     
                ;;

                2)
                lowft
                function smpcpuft() {
                interface
                choice3
                case $choose3 in
                        1)
                        LP1="20"
                        LP2="44"
                        volta="-50"
                        command4
                        run
                        ;;

                        2)
                        LP1="20"
                        LP2="44"
                        volta="-50"
                        command4
                        autorun
                        ;;

                    esac
                }
                smpcpuft
                ;;

            esac
        }
        sysdb
        ;;
        
        4)
       function sysdc() {
            interface
            choice2
            case $choose2 in
                1)
                lownt
                function pmpcputh() {
                interface
                choice3
                case $choose3 in
                        1)
                        LP1="25"
                        LP2="44"
                        volta="-90"
                        command4
                        run
                        ;;

                        2)
                        LP1="25"
                        LP2="44"
                        volta="-90"
                        command4
                        autorun
                        ;;

                    esac
                }
                pmpcputh
                ;;

                2)
                lowft
                function pmpcpuft() {
                interface
                choice3
                case $choose3 in
                        1)
                        LP1="25"
                        LP2="44"
                        volta="-50"
                        command4
                        run
                        ;;

                        2)
                        LP1="25"
                        LP2="44"
                        volta="-50"
                        command4
                        autorun
                        ;;

                    esac
                }
                pmpcpuft
                ;;

            esac
        }
        sysdc
        ;;

        5)
       function sysdd() {
            interface
            choice2
            case $choose2 in
                1)
                lownt
                function gmpcputh() {
                interface
                choice3
                case $choose3 in
                        1)
                        LP1="30"
                        LP2="40"
                        volta="-90"
                        command4
                        run
                        ;;

                        2)
                        LP1="30"
                        LP2="40"
                        volta="-90"
                        command4
                        autorun
                        ;;

                    esac
                }
                gmpcputh
                ;;

                2)
                lowft
                function gmpcputf() {
                interface
                choice3
                case $choose3 in
                        1)
                        LP1="30"
                        LP2="40"
                        volta="-50"
                        command4
                        run
                        ;;

                        2)
                        LP1="30"
                        LP2="40"
                        volta="-50"
                        command4
                        autorun
                        ;;

                    esac
                }
                gmpcputf
                ;;

            esac
        }
        sysdd
        ;;

        6)
       function sysdc() {
            interface
            choice2
            case $choose2 in
                1)
                lownt
                function fmpcputh() {
                interface
                choice3
                case $choose3 in
                        1)
                        LP1="35"
                        LP2="40"
                        volta="-90"
                        command4
                        run
                        ;;

                        2)
                        LP1="35"
                        LP2="40"
                        volta="-90"
                        command4
                        autorun
                        ;;

                    esac
                }
                fmpcputh
                ;;

                2)
                lowft
                function fmpcputf() {
                interface
                choice3
                case $choose3 in
                        1)
                        LP1="35"
                        LP2="40"
                        volta="-50"
                        command4
                        run
                        ;;

                        2)
                        LP1="35"
                        LP2="40"
                        volta="-50"
                        command4
                        autorun
                        ;;

                    esac
                }
                fmpcputf
                ;;

            esac
        }
        sysdc
        ;;

        7)
       function sysdd() {
            interface
            choice2
            case $choose2 in
                1)
                lownt
                function crympcputh() {
                interface
                choice3
                case $choose3 in
                        1)
                        LP1="40"
                        LP2="40"
                        volta="-90"
                        command4
                        run
                        ;;

                        2)
                        LP1="40"
                        LP2="40"
                        volta="-90"
                        command4
                        autorun
                        ;;

                    esac
                }
                crympcputh
                ;;

                2)
                lowft
                function crympcputf() {
                interface
                choice3
                case $choose3 in
                        1)
                        LP1="40"
                        LP2="40"
                        volta="-50"
                        command4
                        run
                        ;;

                        2)
                        LP1="40"
                        LP2="40"
                        volta="-50"
                        command4
                        autorun
                        ;;

                    esac
                }
                fmpcputf
                ;;

            esac
        }
        sysdd
        ;;

        8)
        info
        ;;

        9)
        uninstall
        ;;

        10)
        exit 0
        ;;
        *)
        echo "$prompt25"
        exit 1
        ;;
    esac
}

main
