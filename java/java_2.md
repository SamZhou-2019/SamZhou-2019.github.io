# 二、基本数据类型与基本操作

## 标识符

 * 由字符、数字、下划线_和美元符号$构成的字符串，区分大小写，不能用数字开头，不能包含空格。
 * 可以有任何的长度，<b style="color:red">⚠但不能是保留字或布尔值`true,false`、空值`null`</b>。

## 变量

概念：在程序执行的过程中，其值可以发生改变的量

作用：用来存储数据，代表内存的一块存储区域，这块内存中的值是可以改变的

命名规范（推荐遵守）：首个单词全小写，后面单词首字母大写）

⚠️同一个作用域（大括号内）不允许定义重名的变量

```java
// 声明变量：数据类型 变量名;
int test;
// 变量赋值：变量名=值;
test = 1;
// 可合并为一条语句：int test = 1;
// 赋值给不同数据类型的变量，或赋值超出数据范围，则会报错。如test=1.5;或test=1000000000000000;或test=10L;会报错
// 强制类型转换
int test = (int) 5.123;
// float建议用(int)，double建议用(long)
```

## 数据类型

| **基本数据类型**   | **范围**                                | **存储大小**        |
| ---------- | --------------------------------------- | ------------------- |
| **byte**   | -2^7^~2^7^-1(-128~127)                            | **8-bit signed**    |
| **short**  | -2^15^~2^15^-1                          | **16-bit signed**   |
| **int**    | -2^31^~2^31^-1                          | **32-bit signed**   |
| **long**   | -2^63^~2^63^-1                          | **64-bit signed**   |
| **float**  | 表示范围：绝对值为1.4E-45~3.4028235E38以及0.0  | **32-bit IEEE 754** |
| **double** | 绝对值为4.9E-324~1.7976931348623157E308以及0.0 | **64-bit IEEE 754** |
| **char**   | 0~65536 | **16-bit** |
| **boolean**   | true,false | **8-bit** |

Java中整型的范围与机器<b style="color:red">无关</b>（C/C++：有关）
Java没有无符号的数据类型，所以没有unsigned关键词。

```java
// 布尔变量 boolean 与整型、字符型不能相互转换
boolean b = true;// true false
// !b = false

// 整数变量 int byte short long
// int是程序默认的整型数据类型
byte a = 123;
System.out.println((int) a + x);// (类型) 强制转换数据类型
// 低精度的值赋给高精度变量时必须进行强制转换
short s = 12;
int x = 100, y = 0123/* 八进制 */, z = 0xABC123/* 十六进制 */;
long l = 23456L;// 若赋的值超出int范围，结尾需加大写字母“L”（未超出时可加可不加）

// 字符型变量 char
// 用单引号'括起来，单引号中有且只有一个字符（即字符数量只能为1）。双引号括起来的是字符串
char c = 'a', d = '我';// 0~65536 Unicode
// 转义：\n(换行) \b(退格) \t(制表) \r(回车) \' \" \\ \u0001(Unicode)
System.out.println(c + d);// 输出的是Unicode数值
System.out.println((int) c);
// 若赋值为整数，如char a = 65;不会报错，但会根据unicode自动转化为char，即实际的a为'A'（可以赋值0~65536范围内的int值）

// 浮点数变量 float double
float f = 3.14159f, e = 1e-5F;// ⚠️注意：**浮点数默认为double。若定义float，结尾需加大写或小写字母F或f。**
// 如：float a = 1.5;会报错，应改为float a = 1.5f;
// 若赋值为整数，如float a = 10;不会报错，但会自动转化为float，即实际的a为10.0f
// 保留八位有效数字
double g = 3.1415926535897d, h = 1e-90;// 结尾加大写小写字母D或d，可省略
// 同样的，若赋值为整数，如double a = 10;不会报错，但也会自动转化
// 可用科学计数法表示浮点数，用e或者E表示指数
// 保留十六位有效数字
// 精度从低到高：byte short/char int long float double
// 从低到高转换无需显式强制转换，从高到低必须使用强制转换（否则会报错）
double a = 1;
int i = (int)3.5;
```



```java
// 数制转换
System.out.println(Integer.toHexString(2020));// 将数字转换成十六进制字符串
System.out.println(Integer.toBinaryString(2020));// 将数字转换成二进制字符串
System.out.println(Integer.toOctalString(2020));// 将数字转换成八进制字符串
System.out.println(Integer.toString(2020));// 将数字转换成十进制字符串
```

除了八种基本数据类型以外的数据类型统称**引用数据类型**，如字符串String。

```Java
String s1 = "tom";
String s_null = null; // 空值:null null可以赋值给引用数据类型
String s_2 = ""; // 空串 
```



## 常量

```java
// 常量只允许被赋值一次，值一旦设定便不允许改变
// 使用final来表示常量，习惯上常量名用大写字母和下划线表示
final double FINAL_TEST = 1.0;
```


[返回上一页](java.md)
