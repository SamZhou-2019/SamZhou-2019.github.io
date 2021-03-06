# 需要安装pandas-datareader，注意减号和下划线的区别


```python
import datetime
import numpy,pandas
import os
import pandas_datareader as pdr
```

## 1.获取原始数据


```python
start=datetime.datetime(2020,1,1)#设置起始时间
end=datetime.datetime.today()#设置结束时间，这里设置为今天
stock=pdr.DataReader("000001.SS","yahoo",start,end)
```

### 股票代码（上证.SS，深证.SZ），数据源，起始时间，终止时间

## 2.打印数据


```python
print (stock)#打印数据
print (stock.head(5))
print (stock.tail(5))#分别代表打印前五行和后五行
```

## 3.导出数据


```python
stock.to_excel("C:/Users/zhouz/Desktop/000001.xlsx")
```

## 4.输出数据相关信息


```python
print('index:',stock.index,'\ncolumns:',stock.columns,'\nshape:',stock.shape)
print('\n\n',stock.info())#输出数据的信息
print('\ndescribe:',stock.describe())#输出数据的统计情况
```

## 5.数据计算


```python
change=stock.Close.diff()#加入一列，表示收盘价变化
change.fillna(change.mean(),inplace=True)#替换第一行收盘价变化的NaN为变化平均数
stock['change']=change
print(stock)
```


```python
stock['pct_change']=(stock['change']/stock['Close'].shift(1))
print(stock)
```

### 计算涨跌幅，相对于stock.Close.pct_change()，用收盘价差除以上一天收盘价

## 6.数据格式化


```python
format=lambda x:'%.2f' % x
stock=stock.applymap(format)#格式化为保留两位小数
print(stock.loc['2020-04-01':'2020-05-18'])
```

### .loc[start:end]输出指定时间段内的所有数据，时间格式为YYYY-MM-DD

## 7.数据可视化


```python
import matplotlib.pyplot as plt
plt.plot(stock['Close'])
plt.show()
```

## 8.输出公司操作


```python
start=datetime.datetime(2016,1,1)#设置起始时间
end=datetime.datetime.today()#设置结束时间，这里设置为今天
apple_actions=pdr.DataReader("AAPL","yahoo-actions",start,end)#获取苹果公司最近的操作，如派发股利DIVIDEND
print(apple_actions)
```

### 合并股价及操作


```python
apple_price=pdr.DataReader("AAPL","yahoo",start,end)
apple_price['action'],apple_price['value']=apple_actions.action,apple_actions.value
print(apple_price)
```

[返回上一页](python.md)