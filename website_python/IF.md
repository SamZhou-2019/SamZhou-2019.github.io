# 条件判断

**注意：python中缩进是非常重要的，相当于C中的大括号。**

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

## 5.断言

断言用于判断一个表达式的真假，若表达式为假则抛出异常AssertionError并停止运行。

```python
assert True # 无任何提示
assert False # 抛出异常，异常内容如下：
```

> Traceback (most recent call last):
>   File "test.py", line 27, in \<module\>
>     assert False
> AssertionError

assert语句中，表达式后可跟一个字符串，当表达式为假，抛出异常时也显示该字符串。

assert语句不会返回值，因此无法用assert语句对变量赋值或用print输出。

```python
i=2
assert i==2,'i不是2'
assert i==1,'i不是1'
```

> Traceback (most recent call last):
>   File "test.py", line 29, in \<module\>
>     assert i==1,'i不是1'
> AssertionError: i不是1

[返回上一页](python.md)