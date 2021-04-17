
# 正则表达式

## re.match
从字符串的**开头位置**与模式进行匹配，匹配失败则返回None


```python
import re
#re.match(正则表达式,字符串,可选标志)
print(re.match(r"[A-Za-z]*","pi=3.14159"))
print(re.match(r"[A-Za-z]*","pi=3.14159").span())#输出匹配字符串的位置参数
print(re.match(r"[A-Za-z]*","pi=3.14159").group)#输出所有匹配的字符串
print(re.match(r"[A-Za-z]*","pi=3.14159").group(0))#输出组号所对应的字符串，可以输入多个组号
```

> <re.Match object; span=(0, 2), match='pi'>
>
> (0, 2)
>
> pi
>
> pi


## re.search
将整个字符串与模式进行匹配并返回**第一个成功的匹配**，匹配失败则返回None


```python
print(re.search(r"([A-Za-z]+) more than ([A-Za-z]+)","I love Python more than Java."))
print(re.search(r"([A-Za-z]+) more than ([A-Za-z]+)","I love Python more than Java.").span())#输出匹配字符串的位置参数
print(re.search(r"([A-Za-z]+) more than ([A-Za-z]+)","I love Python more than Java.").group())#输出所有匹配的字符串
print(re.search(r"([A-Za-z]+) more than ([A-Za-z]+)","I love Python more than Java.").group(1))#输出组号所对应的字符串，可以输入多个组号
```

> <re.Match object; span=(7, 28), match='Python more than Java'>
>
> (7, 28)
>
> Python more than Java
>
> Python

## re.sub

替换匹配的字符串


```python
#re.sub(正则表达式,要替换的字符串,原始字符串,匹配的最大次数,可选标志)
#第二个参数：也可以是参数为字符串的函数的函数名
#第四个参数：默认为0表示替换所有的匹配
re.sub(r"[A-Z][a-z]+","Kotlin","I love Python more than Java.",1)
#'I love Kotlin more than Java.'
```

## re.compile
用于编译正则表达式，生成一个正则表达式对象，供match()和search()这两个函数使用。

`pattern = re.compile(正则表达式,可选标志)`

`pattern.match(字符串)`

`pattern.search(字符串)`


```python
print(re.compile(r"([A-Za-z]+)").findall("I love Python more than Java."))
# ['I', 'love', 'Python', 'more', 'than', 'Java']
# findall函数用于匹配所有的字符串并返回一个列表。如果没有找到，则返回空列表。
```

> ## 其他函数
>
> re.finditer(正则表达式,字符串,可选标志)  匹配所有的字符串并返回一个用于循环的迭代器
>
> re.findall(正则表达式,字符串,可选标志)  匹配所有的字符串并返回一个列表
>
> re.split(正则表达式,字符串,分隔次数,可选标志)  按照能够匹配的子串将字符串分割后返回列表。分隔次数省略表示默认为0（不限制次数）

### 可选标志

| 修饰符 | 描述                                                         |
| ------ | ------------------------------------------------------------ |
| re.I   | 使匹配对大小写不敏感                                         |
| re.L   | 做本地化识别（locale-aware）匹配<br>表示特殊字符集 \w, \W, \b, \B, \s, \S 依赖于当前环境 |
| re.M   | 多行匹配，影响 ^ 和 $                                        |
| re.S   | 使 . 匹配包括换行在内的所有字符                              |
| re.U   | 根据Unicode字符集解析字符。这个标志影响<br> \w, \W, \b, \B, \d, \D, \s, \S. |
| re.X   | 该标志通过给予你更灵活的格式以便你将正则表达式写得更易于理解。<br>如为了增加可读性，忽略空格和 # 后面的注释 |

[正则表达式的语法请参考这里](https://SamZhou-2019.github.io/website_java/java_8.html)

[返回上一页](python.md)