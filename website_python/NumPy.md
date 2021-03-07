# NumPy

## 1.利用NumPy生成矩阵


```python
import numpy
```

### 元素均为零的矩阵


```python
a=numpy.zeros((5,4))
print(a)
```

### 元素均为一的矩阵


```python
b=numpy.ones((3,4))
print(b)
```

### 对角矩阵


```python
c=numpy.eye(4)
print(c)
```

### 数据类型


```python
a=numpy.array([1,2,3,4])
print(a)
```


```python
print(type(a))
```

#### ndmin=n n为最小维数 dtype设置数据类型(bool,int,float,complex)
#### 需要加单引号：https://www.runoob.com/numpy/numpy-dtype.html


```python
aa=numpy.array([0,1,2,3,4,5],ndmin=2,dtype='uint')
print(aa)
```

### 利用已有列表、元组、迭代器转换为矩阵


```python
q=[1,2,3]
w=(1,2,3)
e=[(1,2,3),(4,5)]
r=[1,0,0,1]
qn=numpy.asarray(q)
wn=numpy.asarray(w)
en=numpy.asarray(e)
rn=numpy.asarray(r,dtype=bool)
print(qn,'\n',wn,'\n',en,'\n',rn)
```


```python
it=iter([1,2,3,4,5])
itx=numpy.fromiter(it,dtype=float)
print(itx)
```

## 2.矩阵的属性

### 实例：一个2\*3的矩阵


```python
b=numpy.array([[1,2,3,3],[4,5,6,5],[7,8,9,6]])
```


```python
print(b)
```

### 矩阵的维数


```python
print(b.ndim)
```

### 矩阵的形状(阶数)


```python
print(b.shape)
```

### 矩阵元素的个数


```python
print(b.size)
```

### 矩阵元素的类型


```python
print(b.dtype)
```

### 矩阵每个元素的大小


```python
print(b.itemsize)
```

### 矩阵元素的内存信息


```python
print(b.flags)
```

### 矩阵元素的缓冲区


```python
print(b.data)
```

.real 矩阵元素的实部 .imag 矩阵元素的虚部

### 实例：一个三维矩阵


```python
c=numpy.array([[[1,2],[3,4]],[[5,6],[7,8]],[[9,10],[11,12]]])
print(c,c.ndim,c.shape,c.size,c.dtype)
```

## 3.从数值范围创建数组

### .arange(a,b,c)  从a到b(不包括b)间隔c的行向量


```python
c=numpy.arange(1,10,3)
print(c)
```

### .reshape 变换矩阵形状


```python
e=c.reshape([3,1])
print(e)
```

### .linspace(a,b,c)  从a到b(包括b)相同间隔的c个数


```python
d=numpy.linspace(1,100,300,endpoint=False,dtype='float64')
#endpoint= 是否包含b，默认为True
#retstep= 是否显示间距，默认为False
print(d)
```

### .logspace(a,b,base=c) 创建一个从c\*\*a到c\*\*b的等比数列


```python
d=numpy.logspace(1,10,base=10,num=3,endpoint=False,dtype='float64')
#endpoint= 是否包含b，默认为True
#base= 底数，默认为10
#num= 生成的样本数量，默认为50
print(d)
```

### .random((m,n))输出m\*n阶随机数，范围为[0,1)


```python
e=numpy.random.random((2,3))
print(e)
```

## 4.数据结构化

#### 详细用法：https://www.runoob.com/numpy/numpy-dtype.html


```python
dt=numpy.dtype([('age','int8'),('name','S10'),('isStudent','bool')])
x=numpy.array([(12,'sam',1),(11,'tom',0)],dtype=dt)
print(dt,'\n',x)
print(x['age'])
```

## 5.动态数组


```python
s=b'python'
ss=numpy.frombuffer(s,dtype='S2')
#count= 读取数量，默认为-1表示所有数据
#offset= 读取起始位置，默认为0
print(ss)
```


```python
for i in [1,2,3,6]:
    ss=numpy.frombuffer(s,dtype='S'+str(i))
    print(ss)
```

## 6.切片


```python
a=b'XidianUniversity'
ax=numpy.frombuffer(a,dtype='S1')
print(ax)
```


```python
a1=slice(2,9,2) #从2到9间隔2，即2，4，6，8
print(a[a1])
```


```python
print(a[4],'\n',a[6:9],'\n',a[4:],'\n')
```

[返回上一页](python.md)

