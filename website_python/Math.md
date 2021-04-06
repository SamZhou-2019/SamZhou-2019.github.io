# 数学运算

## 1.线性运算 + - * / // ** %


```python
print("2+3=",end='')
print(3+2)
print("5-4=",end='')
print(5-4)
print("3*2=",end='')
print(3*2)
print("6/4=",end='')
print(6/4)
print("[//表示整除]6//4=",end='')
print(6//4)
print("[**表示乘方]5^3=",end='')
print(5**3)
print("0.02+0.03=",end='')
print(0.02+0.03)
print('√9=',end='')
print(9**0.5)
print("15%4=",end='')
print(15%4)
```

## 2.range(num1,num2,num3)以列表形式表示一系列数字。

#### num1是起始值，num2是末尾值（不包括num2），num3是间隔


```python
for e in range(3,7):
        print(e)
```


```python
e=list(range(0,10,2))
for n in e:
        print(str(n)+' 是一个偶数。')
```

`range(5)`等价于`range(0,5,1)`；`range(3,7)`等价于`range(3,7,1)`。

## 3.简单函数运算


```python
digit=[0,1,2,3,4,5,6,7,8,9]
```

### min()数列中的最小值


```python
print(min(digit))
```

### max()数列中的最大值


```python
print(max(digit))
```

### sum()数列求和


```python
print(sum(digit))
```

### abs()求绝对值


```python
print(abs(-5))
```

### round()四舍五入


```python
a=round(15.463,1)
print(a)
```

## 4.赋值运算


```python
a=3
a+=6 #加法
print(a)
a-=4 #减法
print(a)
a*=3 #乘法
print(a)
a/=5 #除法
print(a)
a**=3 #阶乘
print(a)
a//=4 #整除
print(a)
a%=5 #取余
print(a)
```

## 5.位运算


```python
a=3
a=int(a) #必须为整数
a=~a #按位取反
print(a)
a=4|6 #按位或
print(a)
a=8^9 #按位异或
print(a)
a=7&10 #按位与
print(a)
a=a<<2 #位左移
print(a)
a=a>>1 #位右移
print(a)
```

## 6.id()读取地址


```python
print(hex(id(a)).upper())
```

## 7.math模块


```python
a=math.ceil(5.2) #向上取整
print(a)
a=math.floor(8.9) #向下取整
print(a)
a=math.exp(3) #自然常数幂
print(a)
a=math.log10(3) #常用对数
print(a)
a=math.log(8,2) #对数
print(a)
a=math.log(8) #自然对数
print(a)
a=math.sqrt(9) #平方根
print(a)
```

### 常用常数


```python
print(math.e) #自然常数
print(math.pi) #圆周率
```

### 其他函数

> acos()反余弦弧度值
>
> asin()反正弦弧度值
>
> atan()反正切弧度值
>
> atan2(y,x)给定的X及Y坐标值的反正切值
>
> cos()弧度的余弦值 cosh()
>
> hypot(x,y) sqrt(x\*x + y\*y)
>
> sin()弧度的正弦值 sinh()
>
> tan()弧度的正切值 tanh()
>
> degrees()	将弧度转换为角度
>
> radians()	将角度转换为弧度
>
> fabs() 绝对值
>
> fmod(x,y) x/y取余
>
> pow(x,y) x^y
>
> log2() 以2为底的对数
>
> modf(x) 由小数部分和整数部分组成的元组
>
> trunc(x) 返回整数部分
>
> gcd(x,y) 返回x和y的最大公约数
>
> 

#### 实例


```python
math.sin(a)
```

## 8.列表解析 [函数 for 变量 in 数列]


```python
a=[i**3 for i in range(1,11)]
print(a)
```

### 实例：以不同精度计算π


```python
import math
def pi_calc():
    x=100000000
    n=1 
    i=1
    sum=0
    sign=1
    while n<=x:
        while i<=n:
            sum=sum+(sign/i)
            sign=sign*-1
            i+=2
        print(sum*4,sum*4-math.pi)
        n*=10
        
pi_calc()
```

## 9.复数运算 cmath


```python
#实例：解二次方程
import cmath
a=int(input('请输入二次项系数：'))
b=int(input('请输入一次项系数：'))
c=int(input('请输入常数项：'))
d=b**2-4*a*c
print('x1= '+str((-b+cmath.sqrt(d))/2*a))
print('x2= '+str((-b-cmath.sqrt(d))/2*a))
```

[返回上一页](python.md)