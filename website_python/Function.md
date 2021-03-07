# 函数

## 1.简单函数实例


```python
def a():
	print('Hello world!')
a()
```

## 2.含参数的函数


```python
def b(string):
	print('Welcome, '+string+'!')
b('Sam')
```

## 调用函数


```python
st=input('Please input your name.')
b(st)
```

## 3.参数确定的函数


```python
def love(person='Anna',pet='cat'):
	print(person+' loves '+pet+'.')
love()
```

## 字典+函数+循环


```python
loves={
	'Sam':'cat',
	'Dave':'dog',
	'Alan':'dog',
	'Helen':'cat',
	'Amy':'dog'
}
for person,pet in loves.items():
	love(person.title(),pet)
```

## 输入参数时省略参数标志


```python
love('Paul','dog')
```

## 当参数带有标志时可以变换顺序（没有标志时只能按照函数定义的顺序代入参数）


```python
love(pet='cat',person='Frank')
```

调用py包内函数示例： 


1.导入其他py文件中的函数，如： 

`import function_eg `

等同于 `from function_eg1_1 import * `


引用函数：文件名.函数名 

`function_eg.main() `


2.导入其他py文件中的特定函数：from 文件名 import 函数名 

`from function_eg1_1 import main `

3.import后加\*表示全部导入 

`main()` #引用函数 


4.指定文件别名：import 文件名 as 别名 

`import function_eg1_1 as f `

`f.main() `


4.指定函数别名：from 文件名 import 函数名 as 别名 

`from function_eg1_1 import main as m `

`m()`

## 4.任意数量的实参

### 1)形参前标\*，表示一个元组


```python
def group(num,*mem):
    print(str(num)+'组成员有：')
    for m in mem:
        print('  - '+m)
```


```python
group(1,'Sam','Tom','Amy')
group(2,'Eric','Bob','Alex')
```

#### 实参中的元组不加括号

### 2)形参前标\*\*，表示一个字典


```python
def classes(num,**mem):
    print(str(num)+'班成员有：')
    for m in mem.items():
        print(m)
        
classes(1,Sam='G1',Tom='G1',Bob='G2')
classes(2,Amy='G1',Eric='G2',Alex='G2')
```

#### 字典形参需要关键字实参，关键字不加引号

## 5.返回值的函数


```python
def plus(int_a,int_b):
    int_re=int_a+int_b
    return int_re
a=5
b=10
print(plus(a,b))
```

## 6.返回字典的函数


```python
def name():
    list={}
    while True:
        a=input('请输入姓名，输入#结束程序')
        if a is '#':
            break
        else:
            b=input('请输入年龄')
            list[a]=b
    #复制字典时要加.copy()
    #否则复制的只是字典的地址
    list_return=list.copy()
    while list:
        #.popitem() 输出并删除字典最后一项
        #需要两个变量
        name,age=list.popitem()
        print(name.title()+' is '+age+' years old.')
    #返回字典
    return list_return

print(name())
```

[返回上一页](python.md)