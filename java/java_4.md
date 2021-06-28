# 四、条件语句与循环语句

以下语句与C相似

```java
if (condition) 
{ } 
else if (condition) 
{ } 
...
else 
{ }
```

```java
switch(i){// i可以是char，byte，short或int值 
    case value1: statement1;break; // value表达式必须是常量
    ...
    default: statementd;break; 
}
```

```java
i=(condition)?a:b// condition为true时执行a，false时执行b
```

```java
for (initialization;condition;action)// 初始条件和迭代语句可以有多个，用逗号隔开
// for(;;)即while(true)
{ }// ⚠注意：括号外没有分号
```

```java
while (boolean) {}// 注意：无分号
```

```java
do{} 
while (boolean);// ⚠注意结尾一定要有分号
```

```java
break; 
continue;
```

以下语句与python中的for item in items相似

```java
char c[] = { 'X', 'I', 'D', 'I', 'A', 'N' };
for (char x : c)// x必须未定义
System.out.println(x);
```

必要时可以使用下述语句暂停线程：

```java
Thread.sleep(sleep_time);// 线程停滞x毫秒
```

+ **在循环中不要比较浮点数相等，因为浮点数是近似的，可能会导致不正确的循环次数和不准确的结果。**
+ **在循环体内定义的变量只能在循环体内使用。**

## 程序输入与输出

```java
import java.util.Scanner;
Scanner reader = new Scanner(System.in);
//参数为System.in时默认读取命令行输入的字符串。也可以以字符串变量作为参数，字符串默认以空格分割
//可以使用useDelimiter(regex);方法设置用来分割的正则表达式字符串
String s = reader.next();// 输入字符串，空格为分隔符
// .nextBoolean()
// .nextInt()
// .nextByte()
// .nextShort()
// .nextLong()
// .nextFloat()
// .nextDouble
System.out.print(s);
// System.out.println：输出数据后换行
// System.out.print：输出数据后不换行
// System.out.printf：按C语言形式输出数据 %b %c %d %f %e %s
// System.format：用法同System.out.printf，创建格式化的字符串
reader.close();// ⚠输入完毕后及时关闭输入实例
```

[返回上一页](java.md)