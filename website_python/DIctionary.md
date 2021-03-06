# 字典：一系列键-值对，键-值相关联
### 实例：第一个职工名叫Sam，在岗


```python
staff_1={'name':'Sam','present':True}
print(staff_1['name'])
print(staff_1['present'])
```

## 1.向字典添加值
### 实例：Sam今年26岁，男性


```python
staff_1['age']=26
staff_1['gender']='male'
print(staff_1)
print(staff_1['age'])
```

## 2.创建字典
### 实例：第二名职工叫Alan，请假，年龄27，女性

```python
staff_2={}
staff_2['name']='Alan'
staff_2['present']=False
staff_2['age']=27
staff_2['gender']='female'
print(staff_2)
```

## 3.修改字典中的值 
### 实例：Alan已到岗


```python
staff_2['present']=True
print(staff_2)
```

## 4.删除字典中的项
### 实例：删除字典中两人的年龄数据


```python
del staff_1['age']
del staff_2['age']
print(staff_1)
print(staff_2)
```

## 5.遍历字典


```python
staff={
    'Alex':1,
#注意逗号
    'Jack':2,
    'Mike':0,
    'Leo':1,
    'Pluto':1,
    'Hill':1,
    'Samuel':2,
    'Edward':0,
    'Steven':2,
    'Tom':1
}
work=[]
meet=[]
absent=[]
```

### 完整遍历时for后面的变量格式为key,value
### in后面的格式为dict.items()


```python
#注意.items()的括号不能遗漏
for name,present in staff.items():
    print(name,end=' ')
    if present==1:
        print('is working.')
        work.append(name)
    elif present==2:
        print('is at the meeting.')
        meet.append(name)
    else:
        print('is absent')
        absent.append(name)
print(work)
print(meet)
print(absent)
```

### 也可以只遍历键 for key in dict.keys()
### 或值                   for value in dict.values()


```python
for name in staff.keys():
    if name in work:
        print('I see '+name+' in the office.')
    elif name in meet:
        print('I see '+name+' having meeting.') 
print('\n')
```

### 排序遍历 sorted()


```python
for name in sorted(staff.keys()):
    if name in work:
        print('I see '+name+' in the office.')
    elif name in meet:
        print('I see '+name+' having meeting.') 
```

## 6.字典嵌套


```python
job='job'
age='age'
sal='salary_per_month'
Sam={
    job:'management',
    age:29,
    sal:6000,
}
Tom={
    job:'teacher',
    age:32,
    sal:5000,
}
Pam={
    job:'waiter',
    age:30,
    sal:4000,
}
```


```python
staff=[Sam,Tom,Pam]
```


```python
for person in staff:
    print(person)
    print(person[age])
    print(person[sal])
```

### 输出整个嵌套列表


```python
print(staff)
```

### 实例：创建一组字典


```python
list=[]
for a in range(20):
    new={
        'num':a,
        'name':'test'
    }
    list.append(new)
```


```python
print(list)
```

### 读取前十个


```python
for i in list[:10]:
    print(i['name'])
```

### 修改前五个


```python
for i in list[:5]:
    i['name']='beta'
```


```python
print(list)
```

## 字典中储存字典


```python
job='job'
age='age'
sal='salary_per_month'
staff={
    'Sam':{
        job:'management',
        age:29,
        sal:6000,
    },
    'Tom':{
        job:'teacher',
        age:32,
        sal:5000,
    },
    'Pam':{
        job:'waiter',
        age:30,
        sal:4000,
    },
}
```


```python
for person,info in staff.items():
    print(person,end=' is a ')
    print(info[job],end='.\n')
```

### 输出整个嵌套列表


```python
print(staff)
```


```python
#实例：喜欢的语言
list={
}
empty={}
for person,language in list.items():
    print(person+'喜欢'+language+'. ')

while True:
    print('接下来你想要干什么？\
（请输入操作对应的代码并按回车键\
确认）\n\
0-退出\n\
1-输出\n\
2-插入或修改\n\
3-删除\n\
4-查找')
    i=input()
    if i>='0' and i<='4':
        i=int(i)
    else:
        print('输入错误，请重新输入。')
    if i==0:
        exit(0)
    elif i==1:
        if list==empty:
            print('这里没有人啊。')
        for person,language in list.items():
            print(person+'喜欢'+language+'. ')
    elif i==2:
        n=0
        while(not n):
            print('请输入要插入的人的姓名：')
            name=input()
            x=0
            for person in list.keys():
                if person==name:
                    print('此人已存在。')
                    x=1
            if x==1:
                print('请输入要修改的编程语言：')
            else:   
                print('请输入编程语言：')
            lang=input()
            list[name]=lang
            print('是否继续插入？是请输入0，否则输入其他字符')
            n=input()
            if n=='0':
                n=0
            else:
                n=1
    elif i==3:
        print('请输入要删除的人的姓名：')
        name=input()
        x=0
        for person in list.keys():
            if person==name:
                del list[name]
                x=1
                break
        if x==0:
                print('列表中没有这个人')
    elif i==4:
        like=[]
        print('请输入要查找的关键字或值：')
        search=input()
        x=0
        for name,lang in list.items():
            if search==name:
                print('这是一个人。他（她）\
喜欢'+lang)
                x=2
            elif search==lang:
                print('这是一种编程语言。')
                like.append(name)
                x=1
        if x==0:
            print('查无此人（或编程语言）。')
        elif x==1:
            print('喜欢这种编程语言的有：')
            for name in list.keys():
                print(name+' ')
```

[返回上一页](python.html)