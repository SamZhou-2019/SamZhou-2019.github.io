# 四、控制语句

## 条件语句与循环语句

以下语句与C相似

```java
if (condition) 
{ } 
else if (condition) 
{ } 
...
else 
{ }
/* 和C一样，如果一个条件分支后只有一个语句，则大括号可以省略。
   但是，这行代码不能是变量的声明。由于定义的变量作用域仅限这个语句内，因此该变量无意义。
   此时属于语法错误。若该语句前后加大括号则不会报错。 */
/* 条件语句是可以嵌套的 */

i=(condition)?a:b // 三元运算符在行为上可以看作一种条件语句：condition为true时执行a，false时执行b
```

```java
switch(i){// i可以是char，byte，short或int类型的变量或常量，或String字符串【JDK>=1.7】和枚举型
    case value1: statement_1;break; // value表达式必须是常量
    ...
    default: statement_d;break; 
}
// ⚠️不同case的常量值不能相同
// ⚠️switch和case的条件不可以是float、double浮点型，也不可以是long
// break;可以省略，但是执行某个case后若没有break;则会继续运行下一个case后的语句（无视case的条件）直到遇到break;即停止。
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
// 输入
import java.util.Scanner;
Scanner reader = new Scanner(System.in);
//参数为System.in时默认读取命令行输入的字符串。也可以以字符串变量作为参数，字符串默认以空格分割
//可以使用useDelimiter(regex);方法设置用来分割的正则表达式字符串
String s = reader.next();// 输入字符串，空格为分隔符。
// 可以用以下函数接收各数据类型的数据：
// .nextBoolean() .nextInt() .nextByte() .nextShort() .nextLong() .nextFloat() .nextDouble() 
// ⚠️注意：如果输入了和指定数据类型不匹配的数据，则会报错：java.util.InputMismatchException

// 输出
System.out.print(s);
// System.out.println(s)：输出数据后换行
// System.out.print(s)：输出数据后不换行
// System.out.printf(s)：按C语言形式输出数据 %b %c %d %f %e %s
// System.format(s)：用法同System.out.printf，创建格式化的字符串
reader.close();// ⚠输入完毕后及时关闭输入实例
```

## bonus!

若使用`.next()`函数，则接收的字符串终止于空格。即：输入`12&3 45 678`，若使用`.next()`接收则只能接收`12&3`。

函数`.nextLine()`接收的字符串则终止于回车。

[返回上一页](java.md)