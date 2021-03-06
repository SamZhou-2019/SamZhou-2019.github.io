# 条件判断

## 1.简单的条件判断


```python
tea=['Green','Black','Lemon','Fruit','Flower']
for cup in tea:
      if cup=='Black':
            print(cup)
      else:
            tea.append('Pasta')
            if cup=='Pasta':
                  break
print(tea)
```

> 相等条件判断式  变量==值
>
> 不等条件判断式  变量!=值
>
> 成立则返回True，不成立则返回False

## 2.多个条件的判断 

### 和and


```python
print('请输入一个数')
a=input()
print(a)
if int(a)>=0 and int(a)<=15:
    print('a在范围内')
elif int(a)<0:
    print('a为负数')
else:
    print('a过大')
```

### 或or


```python
print('输入E，X，I或T以退出') 
s=input()
s=s.upper()
if s=='E' or s=='X' or s=='I' \
or s=='T':
    print('exit')
    exit()
else:
    print('error')
```

## 3.布尔表达式


```python
a=True
if a:
    print('right')
```


```python
a=False
if not a:
    print('wrong')
```

## 4.列表中项的搜索


```python
a=['one','two','six','eight']
if 'six' in a:
    print('six six six')
if 'three' not in a:
    print('two three three')
    
print('six' in a)
print('three' not in a)
```

[返回上一页](python.md)