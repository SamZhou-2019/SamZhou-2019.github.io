# 循环语句

## 1.while,else结构


```python
i=0
while i<=5:
    print(i)
    i+=1
```

#### 不满足while即执行else语句


```python
i=1
while i<100:
    print(str(i)+' is less than 100.')
    i+=1
else:
    print('100!')
```

## 2.for,in结构


```python
for i in range(0,1000):
    print(i)
```

## 3.列表循环

### 利用循环结构输入并输出一个列表


```python
i=0
food=[]
bought=[]
while True:
    a=input('请输入食物名称（输入quit以退出）：')
    if a == 'quit':
        break
    else:        
        food.append(a)
```

### 删除列表中的特定值，列表不存在该特定项时停止循环


```python
while 'fish' in food:
    print('我不喜欢吃鱼。')
    food.remove('fish')
```

### 移除列表中的项同时导入到另一个列表，列表为空时停止循环


```python
while food:
    i+=1
    a=food.pop()
    print(str(i)+' '+a)
    bought.append(a)
```


```python
print('已购买：')
for x in bought:
    print(x,end=', ')
print('\b\b.')
```

## 4.break&continue

#### 用户输入#时break退出循环


```python
name={};i=0
while True:
    a=input('请输入姓名,或输入#退出')
    if a is not '#':
        i=i+1
        name[str(i)]=a
    else:
        break
```

#### input() 运行时先输出括号内字符串再输入


```python
print(name)
```

## 5.Boolean:True&False


```python
a=True
while a:
    x=input('输入一个字符串，此程序会重复此字符串\
。输入quit以结束程序：')
    if x == 'quit':
        a=False
    else:
        print(x)
```

[返回上一页](python.html)

