# Calendar模块

## 输出日历


```python
import calendar
month=1
year=2019
calendar.setfirstweekday(firstweekday=6)#设置第一天是星期天
for month in range(1,13):
    print(calendar.month(year,month))#输出日历
    month+=1
```


```python
print(calendar.calendar(2019))
```

## 判断是否是闰年


```python
print(calendar.isleap(2020))#判断是否是闰年
```

# Time模块


```python
import time
```

## 返回与GMT时间的时间差,以秒计算


```python
print(time.altzone)
```

## 返回时间，或.ctime()


```python
print(time.asctime()) 
```

## 返回本地时间的struct时间对象格式


```python
print(time.localtime()) 
```

## 将日期字符串转成struct时间对象格式


```python
string_struct = time.strptime("2020/01/01","%Y/%m/%d") 
print(string_struct)
```

## 返回GMT时间的struct时间对象格式


```python
print(time.gmtime()) 
```

## 将struct_time格式转成指定的字符串格式


```python
print(time.strftime("%Y-%m-%d %H:%M:%S",time.localtime()) )
```

## 返回本地时间（struct时间对象格式）的自定义格式


```python
print(time.strftime("%a %A %b %B %c %d %H %I %j %m %M %p %S %U %w %W %x %X %y %Y %z",time.localtime()) ) 
```


```python
a=int(time.strftime("%H",time.localtime()))
print(a)
if a==22:
    print('True')
```

> %a    本地（locale）简化星期名称    Mon
>
> %A    本地完整星期名称    Monday
>
> %b    本地简化月份名称    Jan
>
> %B    本地完整月份名称    January
>
> %c    本地相应的日期和时间表示    
>
> %d    一个月中的第几天（01 - 31）    30
>
> %H    一天中的第几个小时（24小时制，00 - 23）    23
>
> %I    第几个小时（12小时制，01 - 12）    11
>
> %j    一年中的第几天（001 - 366）    30
>
> %m    月份（01 - 12）    01
>
> %M    分钟数（00 - 59）    59
>
> %p    本地am或者pm的相应符    PM
>
> %S    秒（01 - 61）    15
>
> %U    一年中的星期数。（00 - 53星期天是一个星期的开始。）第一个星期天之前的所有天数都放在第0周。    4 
>
> %w    一个星期中的第几天（0 - 6，0是星期天）    1    
>
> %W    和%U基本相同，不同的是%W以星期一为一个星期的开始。    4
>
> %x    本地相应日期    01/31/20
>
> %X    本地相应时间    23:59:15
>
> %y    去掉世纪的年份（00 - 99）    20
>
> %Y    完整的年份    2020
>
> %z    时区的名字（如果不存在为空字符）    +0800
>
> %%    ‘%’字符

## 暂停一秒


```python
time.sleep(1)
```

# Datetime模块


```python
import datetime
print(datetime.datetime.now() )
```

## 当前时间+3天


```python
print(datetime.datetime.now() + datetime.timedelta(3))
```

## 当前时间-3天


```python
print(datetime.datetime.now() + datetime.timedelta(-3)) 
```

## 当前时间+3小时


```python
print(datetime.datetime.now() + datetime.timedelta(hours=3)) 
```

## 当前时间+30分


```python
print(datetime.datetime.now() + datetime.timedelta(minutes=30)) 
```

[返回上一页](python.md)