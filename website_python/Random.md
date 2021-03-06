# 导入随机数模块


```python
import random
```

## 无间隔地生成随机数 num1~num2


```python
i=0
while(i<=10):
      print(random.randint(0,100))
      i=i+1
```

## 有间隔地生成随机数 num1~num2 间隔num3个数字 （如随机生成偶数）


```python
i=0
while(i<=10):
      print(random.randrange(0,1000,2))
      i=i+1
```

### random.choice(序列)从序列里随机挑选一个元素

### random.shuttle(序列)随机排序


```python
i=1
seq=['Sam','Amy','Alex','Bob','Sally']
while i<=10:
      print(random.choice(seq))
      i+=1
```

### random.random()随机生成[0,1)的实数

### randomuniform(x,y)随机生成[x,y]的实数


```python
i=1
while i<=10:
      print(random.random(),random.uniform(0,10))
      i+=1
```

[返回上一页](python.html)