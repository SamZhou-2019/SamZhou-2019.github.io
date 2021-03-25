# 字符串String

## 1.简单的定义及输出程序


```python
message = "hello PYTHON world!"
print(message)
```

### 字符串定义，可以用单引号，也可以用双引号


```python
message_1='I told my friend, "Python is my favorite language!"'
print(message_1)
```

### 空格" "


```python
print(" ")
```

## +=表示在字符串之后再添加字符串


```python
message_2="The language 'Python' is named"
message_2+=" after Monty Python, not the snake."
print(message_2)
```

## 使用三个引号'''或"""可以定义多行字符串。


```python
message_3="""One of Python' 
strengths is its diverse 
and supportive community."""
print(message_3)
```

## 可以用+对字符串进行拼接。


```python
message_a="Hello"+","+" "+message_1
print(message_a)
```

## 字符串前加r则这个字符串中的转义符不转义，如\n,\t


```python
print('I am a \tboy')
print(r'I am a \tboy')
```

## 字符串*数字  表示重复字符串


```python
print('I am a \tboy'*3)
print('I' 'am' 'a' 'boy')
```

## 不在括号()[]{}里的语句，单个语句换行时末尾加反斜杠\


```python
a='a'+' '+'b'+\
   'c'+' '
print(a)
```

## 2.简单的字符串函数

.lstrip()为删除左边空格，.rstrip()为删除右边空格，.strip()为删除两边空格


```python
a="   asdf   "
print("lst:"+a.lstrip()+"end\nrst:"+a.rstrip()+"end\nst:"+a.strip()+"end")
```

变量后加.title()，输出的每个单词首字母变为大写


```python
print(message.title())
```

变量后加.upper()，输出后每个字母变为大写


```python
print(message.upper())
```

变量后加.lower()，输出后每个字母变为小写


```python
print(message.lower())
```

变量后加.capitalize()，输出的每句话首字母变为大写


```python
print(message.capitalize())
```

len(str)统计字符数量


```python
print(len(message))
```

str.count('a')统计字符串中字符出现的次数


```python
print(message.count('l'))
```

str.replace('a','b')替换其中的字符


```python
print(message.replace('!','.'))
```

string.center(n,str) 输出一个string居中n为长度str为填充字符的字符串


```python
print('hello world'.center(50,'*'))
```

string.count(str,a,b) 在string中a到b范围内查找str出现的次数


```python
print('aaaaaaabbbbbbccc'.count('a',3,14))
```

string.endswith(str,a,b) 在string中a到b范围内检查是否以str结尾（startswith是否以str起始）


```python
print('xidianuniversity'.endswith('sit',0,-1))
```

可直接输出True和False


```python
print(True)
print(False)
```

同时按下CTRL和C可以无条件强行停止程序

同时按下CTRL和Z表示文件或程序结束

> string.ljust(width[, fillchar])返回一个原字符串左对齐(rjust右对齐),并使用 fillchar 填充至长度 width 的新字符串，fillchar 默认为空格
>
> string.replace(old, new [, max])将字符串中的old替换成new,如果 max 指定，则替换不超过 max 次
>
> string.swapcase() 大小写转换
>
> string.split(str,num) 以 str 为分隔符截取字符串。str未指定时默认为空格。num未指定值时默认截取所有；如果 num 有指定值，则仅截取 num+1 个子字符串
>
> string.splitlines([keepends]) 按照行('\r', '\r\n', \n')分隔，返回一个包含各行作为元素的列表，如果参数 keepends 为 False，不包含换行符，如果为 True，则保留换行符。
>
> string.zfill (width)返回长度为 width 的字符串，原字符串右对齐，前面填充0
>
> string.expandtabs(tabsize=int)把字符串 string 中的 tab 符号转为空格
>
> string.find(str,a,b) 在string中a到b范围内检查是否含有str并返回第一个的位置（在整个字符串的位置），否则**返回-1**。a和b不写则查找整个字符串。 rfind从右边开始
>
> string.index(str,a,b) 在string中a到b范围内检查是否含有str并返回第一个的位置（在整个字符串的位置），否则**报错**。a和b不写则查找整个字符串。 rindex从右边开始
>
> string.join(str1,str2,...) 将序列中的元素以指定的字符string连接生成一个新的字符串

## 3.转义符


```python
print('\\ 反斜杠  \'  单引号  \"  双引号')
print('pythonn\b uses'+r' \b as backspace.')
print('\a'+r'\a means alarm.')
print('\n\nHere is how 1. \n'+r'\n works.')
print('\n\nHere is how 2. \v'+r'\v works.')
print('\n\nHere is how 3. \t'+r'\t works.')
print('\n\nHere is how 4. \r'+r'\r works.')
print('\n\nHere is how 5. \f'+r'\f works.')
print('\xab 十六进制转义符')
print('\62 八进制转义符')
```

## 4.格式化字符串


```python
a=150.0000000000000009
b=53
print('%d' % (a))#整数
print('%f' % (a))#浮点数
print('%s' % (a))#字符串
print('%c' % (b))#ASCII字符
print('%u' % (a))#无符号整数
print('%o' % (b))#八进制数
print('%x' % (b))#十六进制数，或%X
print('%e' % (b))#科学计数法，或%E
print('%g' % (b))#%g=%f+%e,%G=%f+%E
print('%6d' % (a))#整数，右对齐
print('%-6d' % (a*500000))#整数，左对齐
print('%+6d' % (a))#整数，正数加正号
print('%#o' % (b))#八进制数，#显示八进制数符号
#（#对十六进制数同样有效）
print('%2.3f' % (a))#浮点数,f前面的数字：
#小数点前表示最小宽度，小数点后表示小数位数
```

## 5.判断函数

### 如果字符串均为指定字符则返回True，否则返回False：


```python
a='5'
print(a.isnumeric())
```

#### 如string.
> isalnum() 字母或数字
>
> isalpha() 字母
>
> isdigit() 数字
>
> islower() 小写字母
>
> isnumeric() 数字字符（Unicode数字，全角数字，罗马数字，汉字数字，指数分数等）
>
> istitle() 首字母大写
>
> isupper() 大写字母
>
> isdecimal() 十进制字符
>
> isspace() 空白

## 6.编码

### UTF-8


```python
a='茴字的四种写法'
b='读书人的事，能叫偷吗？'
autf=a.encode(encoding='UTF-8')
butf=b.encode(encoding='UTF-8')
print(autf,'\n',butf)
print(type(autf))#bytes格式对象 
```

### GBK 简体中文编码


```python
agbk=a.encode(encoding='GBK')
bgbk=b.encode(encoding='GBK')
print(agbk,bgbk)
```

### ANSI


```python
aansi=a.encode(encoding='ANSI')
print(aansi)
```

### GB2312 简体中文编码


```python
bgb2312=b.encode(encoding='GB2312')
print(bgb2312)
```

### GB18030 简体中文编码


```python
agb18030=a.encode(encoding='GB18030')
print(agb18030)
```

### UTF-8 vs. UTF-7


```python
print('\n')
c='''各个国家和地区所制定的不同 ANSI 编码标准中，都只规定了各自语言所需的“字符”。'''
c_8=c.encode(encoding='UTF-8')
c_7=c.encode(encoding='UTF-7')
print(c_7,'\n',c_8)
```

### 解码


```python
c_08=c_8.decode(encoding='UTF-8')#解码
c_07=c_7.decode(encoding='UTF-7')
print(c_07,'\n',c_08)
```

[返回上一页](python.md)