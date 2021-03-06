# type() 输出字符类型

### python可以同时给多个变量赋值


```python
a,b,c,d,e,f,g,h,i=1,2.3,True,2+3j,'1',(1,2),{3,4},{1:2,3:4},0x86
print(type(a),type(b),type(c),type(d),type(e),type(f),type(g),type(h),type(i))
```

分别为整数，浮点数，布尔值，复数，字符串，元组，集合，字典；复数也可以用complex(a,b)表示，即a+bj

# isinstance()判断类型


```python
print(isinstance(a,int))
```

# del 删除变量


```python
del a
```

print(a) 这一步会发生错误

# eval()执行一个字符串命令


```python
a='3+2'
print(eval(a))
```


```python
a="print('test')"
eval(a) 
```

# 强制转换  

str()将数值转换为字符串 

repr()强制转换为表达式字符串 

int(字符串,基数)强制转换为整数 

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

[返回上一页](python.html)