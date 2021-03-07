# 文件

## 1.打开文件

### 逐数读取并输出


```python
with open('pi.txt') as pi: 
    numbers=pi.read()      #读取
    print(numbers)         #输出
    
    for number in numbers:
        print(number)      #逐数输出
```

### 逐行读取并输出


```python
with open('pi.txt') as pi:
    lines=pi.readlines()
    
    for line in lines:
        print(line)        #逐行读取
        
    for line in lines:
        print(line.strip())#清除空行
```

## 2.读取文件并进行只读操作

### 实例：输出文件的行数


```python
pi=''
with open('pi.txt') as pi_:
    lines=pi_.read()
    for line in lines:
        if line is not ' ' and line is not '\n':
            pi+=line
print(len(pi))
```

### 实例：输入一串数字，看看这一串数字在不在pi.txt里面


```python
print('文件pi.txt包含小数点后 '+str(len(pi))+' 位圆周率数值')
a=''
while a is not '#':
    a=input('请输入一串数字，看看这一串数字在不在pi.txt里面。输入#退出。\n')
    if a in lines:
        print(a+' 在圆周率小数点后 '+str(len(pi))+' 位里面！')
    elif a is not '#':
        print(a+' 不在圆周率小数点后 '+str(len(pi))+' 位里面！')
    else:
        exit
```

> file.tell() 返回文件位置
>
> file.seek(x,n) 从某位置（n=1当前位置，n=0开头，n=2结尾）移动x个字节
>
> file.close 关闭文件

## 3.写文件


```python
file_1='file_1.txt'

with open(file_1,'w') as file:
    file.write(str(3+3))
```


```python
with open(file_1,'r') as file:
    a=file.read()
    print(a) 
```

### 实例：写入输入的字符到文件里


```python
x=0
with open('file_2.txt','w') as file:
    while x is not '#':
        x=input('please input a string:')
        file.write(x)
        file.write('\n')
```


```python
with open('file_2.txt','r') as file:
    f=file.read()
    print(f)
```

[返回上一页](python.md)