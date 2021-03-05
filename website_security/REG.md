# REG注册表文件

> REG文件实际上是一种注册表脚本文件，Regedit注册表编辑器可以使用REG文件来导入、导出注册表的子项和值。双击REG文件（即用Regedit.exe 注册表编辑器程序运行该文件）即可将其中的数据导入到注册表中。我们可以使用REG文件直接对注册表进行任何修改操作，且不受注册表编辑器被禁用的限制。与导入相对的，可以使用Regedit注册表编辑器来将注册表中指定的项导出至REG文件，便于备份。可将REG文件可分发至多台PC，进行批量的注册表修改。
>
> REG文件可用任何文本文件编辑工具（如记事本）进行修改，熟练掌握后可以起到事半功倍、意想不到的效果。

参考资料：https://www.cnblogs.com/fczjuever/archive/2013/04/09/3010711.html

可以使用记事本等文本文件编辑器进行创建和编辑，保存后需要将扩展名改为\*.reg。双击执行reg文件会请求管理员权限，并弹出警告提示框，提示是否修改注册表。

基本格式：

```
Windows Registry Editor Version 5.00

[RegistryPath
"DataItemName"="DataType:DataValue"
"DataItemName"="DataType:DataValue"

[RegistryPath
"DataItemName"="DataType:DataValue"
```

- `Windows Registry Editor Version 5.00`为Windows注册表编辑器的版本号，在Windows 2000/Srv2003 及以上系统中适用。在98和NT4.0中为`REGEDIT4`。2000/XP/Srv2003可能兼容`REGEDIT4`。

- `RegistryPath`是键路径，包含在方括号中，并以反斜杠 \ 分隔每个层次结构。每个键路径下可以有多个子键和值项，**键路径与键路径之间用空行分隔开**。

  在可视化注册表编辑器中，左侧展开的层次结构就是键路径，可以理解为目录。

  > 创建新的子键，只需要在中括号中填写想要创建的子键即可：`[已存在的键路径\子键`
  >
  > 如果要删除一个键（子键），只需要在RegistryPath头部添加字符“-”即可。
  >
  > 若要重命名键（子键）或值项，请先将其删除，然后使用新的名称创建一个新的键（子键）或值项。

- `DataItemName`是值项的名称。如果该值项在注册表中不存在，则创建；如果存在，则覆盖其值。注意**值项的名称要用双引号引起来**。

  `DataType:DataValue`是值项的值，其中DataType为值类型，DataValue为具体值。

  REG_SZ类型的值无需标明DataType值类型，只需要用双引号引起来；其他类型不需要用双引号引起来，但需要添加值类型，值类型和具体值之间用冒号分隔。
  在可视化注册表编辑器中，右侧的“名称-类型-数据”就是值项，可以理解为文件。

  > 如果要删除一个值项，只需要在DataItemName后面的等号后添加字符“-” 即可。

| 值类型        | 数据类型     | 说明                                                         |
| ------------- | ------------ | ------------------------------------------------------------ |
| REG_BINARY    | 二进制数     | 二进制值，以十六进制显示                                     |
| REG_DWORD     | 双字         | 一个32位的二进制值，显示为8位的十六进制值，也可显示为10位十进制值 |
| REG_SZ        | 字符串       | 文本字符串                                                   |
| REG_EXPAND_SZ | 可扩充字符串 |                                                              |
| REG_MULTI_SZ  | 多字符串     | 含有多个文本值的字符串                                       |

注册表有五个分支，下面是这五个分支的名称及作用：

| **名称**            | **作用**                                                |
| ------------------- | ------------------------------------------------------- |
| HKEY_CLASSES_ROOT   | 存储Windows可识别的文档类型的详细列表，以及相关联的程序 |
| HKEY_CURRENT_USER   | 存储当前用户设置的信息                                  |
| HKEY_LOCAL_MACHINE  | 包括安装在计算机上的硬件和软件的信息                    |
| HKEY_USERS          | 包含使用计算机的用户的信息                              |
| HKEY_CURRENT_CONFIG | 这个分支包含计算机当前的硬件配置信息                    |

示例：在任务栏时间处显示秒针

```
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced
"ShowSecondsInSystemClock"=dword:00000001
```

示例：删除资源管理器中的文档/音乐/视频等文件夹

> 可视化方法：
>
> 1. 按下Win+R，输入regedit回车，打开注册表。
>
> 2. 定位以下位置：
>
>    HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace
>
> 3. 找到相应的键值进行删除操作：
>
>    1. 删除“下载”文件夹：{088e3905-0323-4b02-9826-5d99428e115f}
>    2. 删除“图片”文件夹：{24ad3ad4-a569-4530-98e1-ab02f9417aa8}
>    3. 删除“音乐”文件夹：{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}
>    4. 删除“文档”文件夹：{d3162b92-9365-467a-956b-92703aca08af}
>    5. 删除“视频”文件夹：{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}
>    6. 删除“桌面”文件夹：{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}
>    7. 删除“3D对象”文件夹：{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}
>
> 4. 删除以后重启explorer进程，就会发现这几个文件夹没有了。

```
Windows Registry Editor Version 5.00

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}]
```

