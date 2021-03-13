# 数据类型和注释

## 变量和常量

```python
a=print("Hello, world!")
```

在屏幕上输出一个Hello world!字符串。print可以输出多种格式的数据。

```python
a=input()
```

接收输入，并赋值给a，格式为字符串。

```python
a=input("Please input a number:")
```

在屏幕上显示`Please input a number:`，接收输入，并赋值给a，格式为字符串。

### 变量的命名规则

- 只能由**大小写字母、数字和下划线**组成。大小写敏感。
- 不能以数字开头，不能和保留字相同。
- 要保证唯一性，要有意义，最好能表征变量的含义。

```python
import keyword
print(keyword.kwlist)# 查看保留字
'''
['False', 'None', 'True', '__peg_parser__', 'and', 'as', 'assert', 'async', 'await', 'break', 'class', 'continue', 'def', 'del', 'elif', 'else', 'except', 'finally', 'for', 'from', 'global', 'if', 'import', 'in', 'is', 'lambda', 'nonlocal', 'not', 'or', 'pass', 'raise', 'return', 'try', 'while', 'with', 'yield']
'''
```

### python可以同时给多个变量赋值


```python
a,b,c,d,e,f,g,h,i=1,2.3,True,2+3j,'1',(1,2),{3,4},{1:2,3:4},0x86
print(type(a),type(b),type(c),type(d),type(e),type(f),type(g),type(h),type(i))
```

分别为整数，浮点数，布尔值，复数，字符串，元组，集合，字典；复数也可以用complex(a,b)表示，即a+bj

#### type() 输出字符类型，isinstance() 判断类型


```python
print(isinstance(a,int))
```

## del 删除变量


```python
del a
```

print(a) 这一步会发生错误

## eval()执行一个字符串命令，并返回该命令的值


```python
a='3+2'
print(eval(a))
```


```python
a="print('test')"
eval(a) 
```

```python
a=eval('15')#这里eval()可以将字符串类型的数字转换为数值型的数字
```

## 强制转换  

str()将数值转换为字符串 

repr()强制转换为表达式字符串 

int()强制转换为整数 `int(字符串,基数)` 

long()强制转换为长整数 

hex()强制转换为一个十六进制数 

bin()强制转换为一个二进制数 

oct()强制转换为一个八进制数 

float()强制转换为浮点数 

tuple()将序列转换为一个元组 

list()将序列转换为一个列表 

set()转换为可变集合 

dict()创建一个字典，必须是一个 (key, value)元组序列。 

frozenset()转换为不可变集合 

print(内容,end=字符串) 以字符串结尾  （比如空格或str(数字)结尾，不换行） 

chr(数字) 数字转化为对应ASCII码 

ord(字符) ASCII码转化为对应数字


```python
age=18
print("I'm "+str(age)+" years old.")
print("I'm "+str(18)+" years old.")
```

### 输出ASCII


```python
i=0
while i<256:
	print(chr(i),end=str(i)+'  ')
	i=i+1
```

# 注释


```python
'''
这是注释。
多行注释
'''
print('1')
"""
这也是注释。
多行注释。
"""
#这也是注释。
#单行注释。 
```

[返回上一页](python.md)