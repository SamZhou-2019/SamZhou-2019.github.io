# OS模块

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

[返回上一页](python.md)

