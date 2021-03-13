# OS模块&异常

#### https://www.runoob.com/python3/python3-os-file-methods.html


```python
import os
```

## 返回当前目录


```python
print(os.getcwd())
```

## 修改当前目录


```python
os.chdir(string) 
```

## 执行系统命令


```python
os.system('winver') 
os.system('cmd') 
```

## 系统内核


```python
print(os.name)
```

## 返回指定目录下的所有文件和目录名


```python
print(os.listdir())
```

#### os.getenv()和os.putenv()分别用来读取和设置环境变量

## 返回操作系统类型，操作系统，操作系统版本


```python
import platform
print(platform.system(),platform.platform(),platform.version())
```

## 异常处理

### try-except-else语句

```python
try:
#运行代码
except Exceptions:#可以有多个异常
#如果在try部分引发了'Exceptions'异常则执行
except Exceptions,data:#可以有多个异常
#如果在try部分引发了'Exceptions'异常则添加变量data执行
else:
#如果没有异常发生
```

### try-finally语句

```python
try:
#语句
finally:
#退出try时总会执行的语句
raise
```

### 触发异常

```python
raise Exception(args)#触发异常名为Exception的异常并输出args字符串
```

[返回上一页](python.md)

