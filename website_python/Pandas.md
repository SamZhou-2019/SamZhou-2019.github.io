# Pandas模块

## 导入模块


```python
import pandas as pd
import numpy
```

## 1.数据字典Series

### 构造数据字典


```python
a=numpy.array([1,2,3,4,5,6])
s=pd.Series(a,index=['A','B','C','D','E','F'])#构造数据字典
print(s)
```

### 输出数据字典的某一项


```python
print(s['A'])
```

### 输出数据字典的前n项，后n项


```python
print(s.head(3),'\n',s.tail(5),'\n')
```

### 将普通字典转化为数据字典


```python
s_1={'a':10,'b':11,'c':12,'d':13}#创建普通字典
s_2=pd.Series(s_1)#转化为pd字典
print(s_1,'\n',s_2)
s_3=pd.Series(s_1,index=['a','c','e'])#按照已经创建好的字典创建新字典
print(s_3)#原字典当中没有的元素，新字典中数据为NaN（非数字）
```

### 数据字典的属性


```python
a_1=pd.Series(10,index=['a','b','c'])#创建相同数据的字典
print(a_1)
print(a_1.size,a_1.ndim,a_1.shape,a_1.dtype)#pandas和NumPy的属性基本一致
```

### 修改数据


```python
a_1['a']=20
print(a_1)
```

### 数据字典可以相加，缺少的元素数据设为NaN


```python
print(a_1+s_2)#数据字典可以相加，缺少的元素数据设为NaN
```

### 可以给数据字典命名


```python
a_2=pd.Series([1,2,3],index=['a','b','c'],name='test')#可以给数据字典命名
print(a_2)
```

## 2.表格

### 按照数据字典，创建一个表格


```python
a_1=pd.Series([17,18,18],index=['Sam','Amy','Dave'],name='age')
a_2=pd.Series(['M','F','M'],index=['Sam','Amy','Dave'],name='Sex')
aframe=pd.DataFrame({'age':a_1,'sex':a_2})#按照数据字典，创建一个表格
print(aframe)
a1frame=pd.DataFrame(a_1)#以字典名为列名创建单列数据字典
print(a1frame)
```

### 输出表格的列属性和行属性


```python
print(aframe.index,'\n',aframe.columns)
```

### 输出表格的前n项，后n项


```python
print(aframe.head(2),'\n',aframe.tail(1))
```

### 按照已经存在的数据字典创建表格


```python
bframe=pd.DataFrame({'age':a_1,'sex':a_2},index=['Amy','Sam','Eric'],columns=['age','num'])
print(bframe)#不存在的元素数据记为NaN
```

### 创建字典，并利用创建好的字典创建表格


```python
cframe=pd.DataFrame([{'age':15,'sex':'W','address':'Xi`an'},#利用字典创建表格
{'age':14,'sex':'M'}],#所有字典需要方括号包括
index=['Roy','Bob'])
print(cframe)
```

### 表格内嵌套表格


```python
d_1={'name':'Sam',('class','grade'):3,('class','number'):2}#行
d_2={'name':'Tim',('class','grade'):3,('class','number'):1}
d_3={'name':'Helen',('class','grade'):4,('class','number'):1}
d_4={'name':'Alex',('class','grade'):2,('class','number'):3}
dframe=pd.DataFrame({('G2',1):d_4,
('G3',1):d_2,
('G3',2):d_1,
('G4',1):d_3})#列
print(dframe)
```

### 表格切片示例（可读取，修改数据）


```python
t=pd.DataFrame([[1,2,3,4],[5,6,7,8],[9,0,1,2]],index=['x','y','z']
,columns=['a','b','c','d'])
print(t)
```

### 方括号+数字：行切片，注意用冒号，[num1:num2]包括num1不包括num2


```python
t[2:3]=[[9,0,1,2]]
print(t[2:3])
```

### 双层方括号+列名：列切片，注意用逗号，双层方括号，[[column1,column2,...]]


```python
print(t[['a','c']])
print(t['a'])
```

### 方括号+数字+双层方括号+列名：区块切片


```python
print(t[1:3][['a','c']])
```

### .loc 切片（按照行名列名切片）


```python
print(t.loc['x'])#行切片
print(t.loc['x':'y'])#多行切片
print(t.loc[:,['a','c']])#列切片
print(t.loc['x':'y',['a','c']])#区块切片
```

### .iloc 切片（按照相对位置切片，只能用数字表示）


```python
print(t.iloc[1])#行切片
print(t.iloc[1:3])#多行切片
print(t.iloc[:,[2,3]])#列切片
print(t.iloc[0:2,[2,3]])#区块切片
```

## 3.保存与读取数据

### 将数据复制到剪贴板上，实例：


```python
s=pd.Series([1,2,3,4],index=['a','b','c','d'],name='test')
s.to_clipboard()
```

### 保存数据


```python
s.to_csv('C:/Users/zhouz/Desktop/test.csv')#以csv形式保存
s.to_excel('C:/Users/zhouz/Desktop/test.xls')#以xls形式保存
s.to_json('C:/Users/zhouz/Desktop/test.json')#以json形式保存
```

### 以数组的形式输入数据并导出xls


```python
t=pd.DataFrame([[1,2,3,4],[5,6,7,8],[9,0,1,2]],index=['x','y','z']
,columns=['a','b','c','d'])
t.to_excel('C:/Users/zhouz/Desktop/test_1.xls')
```

### 以字典的形式输入数据并导出xls


```python
t=pd.DataFrame({'x':{'a':1,'b':2,'c':3},'y':{'a':4,'b':5,'c':6}})
t.to_excel('C:/Users/zhouz/Desktop/test.xls')
```

### 导出到xlsx,sheet_name为表名,需安装openpyxl


```python
t.to_excel(excel_writer='C:/Users/zhouz/Desktop/test.xlsx',sheet_name='test_1')
```


```python
t.to_csv('C:/Users/zhouz/Desktop/test.csv',sep=',',index_label='test')
```

> sep:分隔符
>
> na_rep:缺省值代替字符 如na_rep='EMPTY'
>
> float_format:浮点数格式 如float_format='%.3f'
>
> data_format:数据格式
>
> columns:DataFrames只导出某几列 如:columns=['a']
>
> header:DataFrames是否显示列名 header=False header=True
>
> index:是否显示行名 index=False index=True
>
> encoding:编码格式
>
> mode:写入方法 如mode='a' 表示附加写入 默认为'w'
>
> index_label:表格左上角标签值


```python
a=pd.read_csv('C:/Users/zhouz/Desktop/test.csv')#读取csv文件
print(a)
```

> sep:分隔符
>
> delim_whitespace:分隔符为空白字符(如空格或制表符\t) delim_whitespace=False
>
> compression:读取gzips或bz2压缩文件
>
> header:是否显示列名
>
> names:使用不同的列名,前提是header=False
>
> skiprows:不读取某些行
>
> index_col:是否显示行序号
>
> parse_dates:以日期的格式读取行名

### 读取Excel数据,需要安装xlrd


```python
b=pd.read_excel('C:/Users/zhouz/Desktop/test.xls')#读取Excel数据,需要安装xlrd
print(b) 
```

#### 也可以使用pd.ExcelFile('*.xls(x)'),如

`a=pd.ExcelFile('C:/Users/zhouz/Desktop/test.xlsx')`

#### 用.parse('tab')只读取其中一个工作表,如a_1=a.parse('test_1')

### 导出json


```python
s1=pd.DataFrame([['Sam','Tom','Alex'],[13,15,14]],index=['name','age'],columns=[1,2,3])
print(s1)
```


```python
s2=pd.Series(['Sam','Tom','Alex'],index=[1,2,3],name='name')
print(s2)
```

### 格式转换，split:字典形式，以内嵌列表形式将行名，列名和表格主体分开记录


```python
s_split=s1.to_json('C:/Users/zhouz/Desktop/test1.json',orient='split')
s_split=s2.to_json('C:/Users/zhouz/Desktop/test1.json',orient='split')
```

### records:列表形式，内嵌字典形式的行数据，包含列名和数据


```python
s_records=s1.to_json('C:/Users/zhouz/Desktop/test2.json',orient='records')
s_records=s2.to_json('C:/Users/zhouz/Desktop/test2.json',orient='records')
```

### index:字典形式，内嵌字典形式的行数据，包含列名和数据


```python
s_index=s1.to_json('C:/Users/zhouz/Desktop/test3.json',orient='index')
s_index=s2.to_json('C:/Users/zhouz/Desktop/test3.json',orient='index')
```

### columns:字典形式，内嵌字典形式的列数据，包含行名和数据


```python
s_columns=s1.to_json('C:/Users/zhouz/Desktop/test4.json',orient='columns')
s_columns=s2.to_json('C:/Users/zhouz/Desktop/test4.json',orient='columns')
```

### values:列表形式，只列出表格主体数据


```python
s_values=s1.to_json('C:/Users/zhouz/Desktop/test5.json',orient='values')
s_values=s2.to_json('C:/Users/zhouz/Desktop/test5.json',orient='values')
```

### 读取json数据


```python
s3=pd.read_json('C:/Users/zhouz/Desktop/test.json')
print(s3)
```

# 4.基本作图


```python
%matplotlib inline
data=pd.Series([2,9,1,5,6,2,8,2,2,5,4,8],index=['a','b','c','d','e','f','g','h','i','j','k','l'])
```

折线图


```python
data.plot()
```

直方图


```python
data.hist()
```

## 5.统计函数

### 统计一列数据出现的次数


```python
data.value_counts()
```


```python
t=pd.DataFrame([[66.52,65.11,78.04],[73.85,66.15,80.94],[78.88,68.97,82.96],[86.18,77.66,85.05],[99.54,89.12,86.8],[107.94,93.51,88.58],[110.66,92.07,89.94],[109.04,91.42,91.05],[111.39,87.88,92.06],[115.3,87.56,92.99],[132.43,106.08,94.2],[174.19,155.36,95.1],[207.61,184.82,95.8],[229.37,193.98,96.57],[251.24,233.43,97.69]],index=[1968,1969,1970,1971,1972,1973,1974,1975,1976,1977,1978,1979,1980,1981,1982],columns=['零售总额（百万元）','居民收入（百万元）','全市总人口（百万元）'])
print(t)
t['零售总额（百万元）'].value_counts()
```

### .apply 给一个列应用一个函数


```python
t.apply(sum)
```

### .applymap 给所有元素应用一个函数
### .map 给一列数据中的所有元素应用一个函数


```python
import math
t.applymap(math.sqrt)
```

### .corr() 相关性矩阵


```python
t.corr().applymap(lambda x:int(x*100)/100)#lambda后面的文字表示保留两位小数
```

### .plotting.scatter_matrix() 画出散点图与直方图


```python
pd.plotting.scatter_matrix(t, figsize=(12,9))
```

[返回上一页](python.md)

