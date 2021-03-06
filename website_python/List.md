# 简单的数据结构

## 1.定义列表

### 列表用方括号[]表示


```python
example=["a","b","c","d"]
```

### print(list)直接输出这个列表，包括方括号


```python
print(example)
```

### print(list[num])输出列表各项（编号从零开始）


```python
print(example[0])
print(example[2].upper())
```

### 编号前加负号-表示倒数计数，-1表示最后一个


```python
print(example[-2])
```

#### 实例


```python
print("noise:\t"+str(30)+example[4-1]+example[+1].title())
message=example[0].upper()+" is the first letter".title()+"."
print(message)
```

## 2.列表的简单操作

#### 实例


```python
a=['0th','1st','2nd','3th','4th','5th','6th']
print(a)
```

### 列表切片（注意冒号:）

> list[num1:num2]
>
> num1起始值，留空表示从头开始
>
> num2末尾值（不包括num2），留空表示到数列末尾终止
>
> num1,num2也可以用负数


```python
print(a[0:3])
print(a[2:5])
print(a[:4])
print(a[2:])
print(a[-3:])
print(a[:-2])
print(a[-5:-2])
```

### 复制列表（注意要使用切片）


```python
b=a[:]
print(b) 
a.append('abc')
b.append('opq')
print(a)
print(b)
```

结果：a和b分别添加了abc和opq

### 传递列表地址（不使用切片）


```python
a=['0th','1st','2nd','3th','4th','5th','6th']
b=a
print(b)
a.append('abc')
b.append('opq')
print(a)
print(b)
```

结果：a和b同时添加了abc和opq

## 3.编辑列表


```python
list=["aaa","bbb","ccc"]
```

### 通过赋值改变元素


```python
list[1]="ddd"
print(list)
```

### .append("str")在列表末尾添加元素


```python
list.append("bbb")
list.append("eee")
print(list)
```

### .insert(num,"str")在指定位置插入元素


```python
list.insert(0,"qqq")
list.insert(2,"ppp")
print(list)
```

### del list[num]删除指定位置的元素

### .pop(num)返回并删除指定位置的元素


```python
del list[2]
del list[5]
print(list)
```

### .pop()返回并删除末尾元素


```python
pop_1=list.pop()
print(list)
print(pop_1)
```

### .pop()返回并删除末尾元素


```python
pop_2=list.pop(2)
print(list)
print(pop_2)
```

### .remove("str")删除列表中的值str


```python
list.remove("aaa")
print(list)
```

### .clear()清空列表


```python
list.clear()
print(list)
```

### .count() 统计某元素出现的次数


```python
list=['aaa','aaa','aaa']
print(list.count('aaa'))
```

### .extend(list) 追加列表


```python
list.extend(['bbb','bbb'])
print(list)
```

### tuple()将列表转换成元组

## 4.列表排序


```python
list=["car","ant","get","ban","dog","boy","toy","mat","fab"]
```

### .sort()列表永久性排序


```python
list.sort()
print(list)
```

### .sort(reverse=True)列表永久性反向排序


```python
list.sort(reverse=True)
print(list)
```

### sorted(list)列表临时性排序


```python
print(sorted(list))
print(sorted(list,reverse=True))
```

### .reverse()反转列表


```python
list.reverse()
print(list)
```

### len(list)获取列表长度


```python
a=len(list)
print(a)
```

## 5.遍历列表


```python
name=['zero','one','two']
```

### 遍历列表——for循环
程序编译时会定义for和in之间的变量为字符串变量

被遍历列表在in之后


```python
for namex in name:#注意冒号  :
	print(namex)#循环部分缩进，未缩进代码不参与循环
print(namex)#namex指向最后一项
```


```python
for namex in name:
        print(namex.upper()+' 是一个数字。')
```

## 6.列表迭代器


```python
list=[1,2,3,]
i=iter(list)
print(next(i))
print(next(i))
print(next(i))
print(type(i))
print(next(i))
```

迭代至尾部时继续运行next(i) 会报错：StopIteration 

## 7.#集合：不包含重复项的列表


```python
o_o={'a','s','d','f','d','s','a','d','s'}
print(o_o)
```

### .add(str)向集合中添加元素


```python
o_o.add('k')
print(o_o)
```

### .clear清空集合，集合成为set()


```python
o_o.clear()
print(o_o)
```

## 8.元组（用小括号表示）数据不可更改


```python
square=(20,30)
for length in square:
      print(length)
s=square[0]*square[1]
print(s)

print(type(square))  
```

### 尝试修改数据时会出现错误


```python
#square[0]=40
```

[返回上一页](python.html)