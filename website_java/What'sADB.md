# What's ADB?

Android 调试桥 (adb) 是一种功能多样的命令行工具，可让您与设备进行通信。

> adb 命令便于执行各种设备操作（例如安装和调试应用），并提供对 Unix shell（可用来在设备上运行各种命令）的访问权限。
>
> 它是一种客户端-服务器程序，包括以下三个组件：
>
> 1. 客户端：用于发送命令。客户端在开发计算机上运行。您可以通过发出 adb 命令从命令行终端调用客户端。
> 2. 守护进程 (adbd)：在设备上运行命令。守护进程在每个设备上作为后台进程运行。
> 3. 服务器：管理客户端和守护进程之间的通信。服务器在开发计算机上作为后台进程运行。

[详细信息（谷歌开发者网站）](https://developer.android.google.cn/studio/command-line/adb)

## 如何配置adb环境变量？

1. 控制面板->系统->高级系统设置
2. 点击【高级系统设置】，弹出系统属性的弹框
3. 点击【环境变量】，弹出环境变量弹框，新建一个系统变量，变量名为Android；变量值为<b style="color:red">adb程序所在目录</b>
4. 在系统变量中找到PATH，编辑一下，在Path的变量值中加：
   %Android%
   确定即可
5. 验证是否设置成功：win+R ,进入命令行，cmd，回车。输入 adb。

## 常用命令速查

> adb devices 列举当前连接的设备
>
> adb start-server 启动命令
>
> adb kill-server 停止命令
>
> adb pull (设备目录) (本地目录)
>
> 拷贝文件adb push (本地目录) (设备目录) 拷贝文件
>
> adb shell 进入shell界面
>
> adb shell input keyevent (code) 模拟按键
>
> > 3-home 4-back 5-拨号应用 6-挂断电话 26-电源 64-浏览器 82-菜单 85-播放/暂停 86-停止播放 164-静音 176-打开设置 207-打开联系人 208-打开日历 209-打开音乐 220-降低亮度 221-提高亮度 223-系统休眠 224-点亮屏幕 231-语音助手 61-Tab 67-Backspace 92-PageUp 93-PageDown 112-Delete 122-Home 123-End
>
> adb shell screencap (目录) 截图并保存到指定目录
>
> adb shell screenrecord (目录) 录屏并保存到指定目录
>
> adb shell wm size 显示分辨率(后跟WxH修改分辨率,W,H为数字)
>
> adb shell wm density 屏幕密度(后跟数字以修改分辨率,单位为dpi)
>
> adb shell wm overscan l,u,r,d 屏幕显示区域调整,l,u,r,d分别为四个数字分别为左上右下
>
> adb shell getprop ro.product.model 查看设备信息
>
> adb shell getprop ro.build.version.release 查看安卓版本信息
>
> adb shell getprop ro.build.version.sdk 查看SDK版本信息
>
> adb shell getprop ro.product.brand 查看设备品牌信息
>
> adb shell getprop ro.product.name 设备名
>
> adb shell getprop ro.product.board 处理器型号
>
> adb shell getprop persist.sys.isUsbOtgEnabled 是否支持 OTG 
>
> adb shell getprop dalvik.vm.heapsize 每个应用程序的内存上限
>
> adb shell getprop ro.sf.lcd_density 屏幕密度
>
> adb shell getprop rro.build.version.security_patch Android 安全补丁程序级别

> adb shell pm list packages 查看所有应用
>
> adb shell pm list packages (条件) 查看符合条件的所有应用
>
> adb shell pm list packages -s 查看所有系统应用
>
> adb shell pm list packages -3 查看所有第三方应用
>
> adb shell pm list permission (组名) 查看用户组的所有权限
>
> adb shell pm list features 查看设备支持的所有功能
>
> adb shell pm disable-user (应用包名) 停用应用
>
> adb shell pm enable (应用包名) 启用应用
>
> adb shell pm clear (应用包名) 清除应用数据
>
> adb install (安装包位置) 安装应用
>
> > -l：将应用安装到保护目录 /mnt/asec；
> >
> > -r：允许覆盖安装；
> >
> > -t：允许安装 AndroidManifest.xml 里 application 指定 android:testOnly=“true” 的应用；
> >
> > -s：将应用安装到 sdcard；
> >
> > -d：允许降级覆盖安装；
> >
> > -g：授予所有运行时权限；
>
> adb uninstall (应用包名) 卸载应用
>
> > -k保留数据和缓存目录
>
> adb shell am start (活动名) 调起活动
>
> adb shell am startservice (服务名) 调起服务
>
> adb shell am force-stop (应用包名) 停止应用
>
> adb shell am kill (应用包名) 杀死进程(kill-all杀死所有进程)
>
> adb shell am display-size WxH 改变分辨率为WxH 
>
> adb shell am monitor 启动崩溃或无响应应用的监听器
>
> adb shell ps 显示进程
>
> adb shell top 显示实时资源占用情况

> adb shell dumpsys 系统信息
>
> adb shell dumpsys activity 查看所有活动
>
> > activities 查看正在运行的任务
> >
> > broadcasts 查看broadcasts services 服务状态
> >
> > providers 服务提供商
> >
> > processes 进程状态
> >
> > oom 内存管理
> >
> > intents pending_intents状态
> >
> > recents 最近活动
> >
> > permissions URI授权
> >
> > top 顶部活动
> >
> > package (包名) 应用相关信息
>
> adb shell dumpsys display 分辨率信息
>
> adb shell dumpsys battery 电池信息
>
> adb shell dumpsys cpuinfo CPU信息
>
> adb shell dumpsys meminfo 外存信息
>
> adb shell dumpsys notifications 通知信息
>
> adb shell dumpsys wifi WiFi信息
>
> adb shell dumpsys power 电源管理信息
>
> adb shell dumpsys telephony.registry 电话信息