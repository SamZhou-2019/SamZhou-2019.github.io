# Java 学习笔记（一）

整理于2020-10-12

## Java程序的大致结构

```java
public class HelloWorld {
    public static void main(String[] args) {//程序入口
        System.out.println("Hello World");//输出一个字符串
        Student sam = new Student();//类的实例化（对象）
        sam.greetings("Sam");//对象使用方法
    }
}

class Student {//定义一个类
    public void greetings(String s) {//类中的一个方法，形参为一个字符串
        System.out.println("Hello, " + s);
    }
}
```

## 数据类型

```java
// 布尔变量 boolean
boolean b = true;// true false
// !b = false

// 整数变量 int byte short long
int x = 100, y = 0123/* 八进制 */, z = 0xABC123/* 十进制 */;// -2^31~2^31-1
byte a = 123;// -2^7~2^7-1
System.out.println((int) a + x);// (类型) 强制转换数据类型
// 低精度的值赋给高精度变量时必须进行强制转换
// 精度从低到高：byte short char int long float double
short s = 12;// -2^15~2^15-1
long l = 23L;// 结尾加大写字母“L” -2^63~2^63-1

// 字符型变量 char
char c = 'a', d = '我';// 0~65536
// 转义：\n \b \t \' \" \\ \u0001(Unicode)
System.out.println(c + d);// 输出的是Unicode数值
System.out.println((int) c);

float f = 3.14159f, e = 1e-5F;// 结尾加大写或小写字母F或f
// 表示范围：绝对值为1.4E-45~3.4028235E38
// 保留八位有效数字

double g = 3.1415926535897d, h = 1e-90;// 结尾加大写小写字母D或d，可省略
// 表示范围：绝对值为4.9E-324~1.7976931348623157E308
// 保留16位有效数字

// 数制转换
System.out.println(Integer.toHexString(2020));// 将数字转换成十六进制字符串
System.out.println(Integer.toBinaryString(2020));// 将数字转换成二进制字符串
System.out.println(Integer.toOctalString(2020));// 将数字转换成八进制字符串
System.out.println(Integer.toString(2020));// 将数字转换成十进制字符串
```

## 程序输入与输出

```java
import java.util.Scanner;
...
Scanner reader = new Scanner(System.in);
String s = reader.next();// 输入字符串
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
// System.out.printf：按C语言形式输出数据

reader.close();// 输入完毕后及时关闭输入实例
```

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
```

```java
switch(i){ 
    case *: ;break; 
    ...
    default: ;break; 
}
```

```java
i=(condition)?a:b
```

```java
for (……;……;……)
{ }
```

```java
while (boolean) {}
```

```java
do{} while (boolean);
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

## 数组

#### 一维数组

```java
int a[];// int[] a;声明数组时方括号内不允许指定数组长度
a = new int[5];// 为数组分配元素，也可以写作int a[]=new int[5];
a[0] = 0x8a;
...
```

#### 二维数组

```java
float b[][];
b = new float[3][4];// 也可以写作float b[][]=new float[3][4];
```

#### 长度不同的二维数组

```java
float c[][];
c = new float[2][];
c[0] = new float[5];
c[1] = new float[3];
System.out.println(c.length);// array.length数组长度
// c.length = 2, c[0].length = 5
```

#### 数组初始化

```java
char d[] = { 'a', 'b', 'c', 'd' };
int e[] = { 1, 2, 3 };
```

#### 数组的引用，注意地址的变换

```java
// 字符型数组引用数组名会输出整个数组
char c[] = { 'c', 'h', 'a', 'r', 'a', 'c', 't', 'e', 'r' };
System.out.println(c);

// 将数组和字符串并置可以输出数组地址
System.out.println("c:" + c);

// 数字型数组引用数组名会输出地址
int a[] = { 1, 2, 3 };
System.out.println(a);

int b[] = { 4, 5 };
b = a;
//利用数组名直接赋值,只会改变地址而不是数组本身
```

```mermaid
graph TD
	AA[a]-->A("{1,2,3}")
	BB[b]-->B("{4,5}")
	a=b
	AAA[a]-->C("{4,5}")
	BBB[b]-->C
```

## 运算符

基本运算符 +, -, *, /, %, ++, --
比较运算符 >, <, >=, <=, ==, !=
逻辑运算符 &&, ||, !

位运算符 &, |, ~, ^ (按位与，或，非，异或)

```java
/* 15  00000000 00000000 00000000 00001111
   23  00000000 00000000 00000000 00010111
 &= 7  00000000 00000000 00000000 00000111
 |=31  00000000 00000000 00000000 00011111
 ~=-16 11111111 11111111 11111111 11110000
 ^=24  00000000 00000000 00000000 00011000*/
```

## 类

```java
class className{// 类名
    int classVariable;//定义变量
    private char privateVariable;// 私有变量,类外不能直接使用
    final static float pi=3.14159f;
    //由static修饰的变量和方法由定义的各对象共享
	//由final修饰的变量和方法不能修改
    void classFunction(){// 定义方法
        System.out.println(classVariable);
    }
}

className test = new Classname();// 实例化一个对象
```

例子:

```java
class Student{
    long stu_no;
    String stu_name;
    boolean stu_sex;
    String stu_dorm;//定义变量
    void present(){
        System.out.printf("%s is present.\n", stu_name);
    }//定义方法
    void info(){
        System.out.printf("No:%d\nName:%s\nDorm:%s\nSex:", 				stu_no,stu_name,stu_dorm);
        if (stu_sex == true)
            System.out.println("Male");
        else
            System.out.println("Female");
    }
}

Student test = new Student();//实例化一个对象
```

### 访问权限
| *访问权限符* | *访问权限类型* | *变量和方法权限对比* | *子类继承权限对比* ||
| ---- | ---- | ---- | ---- | ---- |
|private|私有变量和私有方法|类外不能使用|子类不能继承|最严格|
|public|共有变量和共有方法|类外可以使用|同包不同包的子类可以继承|最开放|
|protected|受保护变量和受保护方法|同包的类之间可以使用|同包不同包的子类可以继承|最复杂|
|不加访问权限符|友好变量和友好方法|同包的类之间可以使用|同包的子类可以继承|默认情况|

推荐变量设置为私有变量，使用方法读取和修改对象数据(get&set)

```java
private int age;

public int getAge() {
    return age;
}

public void setAge(int age) {
    this.age = age;
}
```

- public类（共有类）可以在任意类创建对象
- 友好类只能在同包的类里面创建对象
- private和protected不能修饰类

### 子类

子类继承 class 子类 extends 父类。每个子类只能有一个父类。父类与子类之间为树形结构，根节点为java.lang.Object。不同包的子类不能继承父类的友好变量和友好方法，但可以继承父类的受保护变量和受保护方法。

```java
final class UniversityStudent extends Student
```

protected私有变量和方法 子类继承的更多说明：

1. 当在其他类O用某类A创建对象N时，如O与A在同一个包中，则N可以使用A自己创建的私有变量和方法
2. 当在其他类O用某类A创建对象N且A为B的子类时时，如O与B在同一个包中，则N可以使用B创建的私有变量和方法

### final

final可以修饰类，方法和变量。

- final类不可被继承，即不能有子类
- final方法不能由子类重写
- final变量即常量，定义后不可被修改

### 重载

重载：一个类中可以有多个相同名字的变量/方法，但类型/参数必须不同。重载方法调用参数时必须对应。

```java
void calculate(double C) {
    double result = C * C * PI;
    System.out.println("Object:Circle");
    this.printFunction(result);// this表示由类实例化的当前对象
}

void calculate(double A, double B) {
    double result = A * B;
    System.out.println("Object:Square");
    this.printFunction(result);
}

void calculate(double A, double B, double C) {
    double cosB = (A * A + C * C - B * B) / (2 * A * C);
    double result = 0.5 * A * C * Math.sqrt(1 - cosB * cosB);
    System.out.println("Object:Triangle");
    this.printFunction(result);
}
```

子类中名称相同的变量和方法会隐藏/重写父类的同名变量和方法。如需使用父类变量或方法则需使用super.。

### 构造方法

```java
class plus{
    int x;
    //若未定义构造方法则采用无参数的默认构造方法，如plus()
    plus(int a,int b){//构造方法无类型，可定义参数
        x=a+b;
    }
}
plus test=new plus(20,30);//构造方法的作用体现在这里
```

### instance of

用法：对象 instanceof 类名
如果对象是由类及其父类定义的，则返回true，否则返回false

```java
System.out.println(test instanceof Student);
```

## 弹出一个可视化对话框

```java
import javax.swing.JOptionPane;

javax.swing.JOptionPane.showMessageDialog(null,//对话框配置，默认为null
                                          "Hello, world",//对话框主体内容
                                          "welcome",//对话框标题
                                          javax.swing.JOptionPane.INFORMATION_MESSAGE);//对话框类型，包括ERROR_MESSAGE, INFORMATION_MESSAGE, WARNING_MESSAGE, QUESTION_MESSAGE, PLAIN_MESSAGE
```

```java
final double PI=3.14159;
Double radium=Double.parseDouble(JOptionPane.showInputDialog("Please input radium:"));//弹出一个输入对话框
//Double.parseDouble指字符串转换为浮点数
JOptionPane.showMessageDialog(null, "Area="+Double.toString(radium*radium*PI), "Result", JOptionPane.INFORMATION_MESSAGE);
```

例子：弹出到前时间对话框

```java
import java.util.Date;
import javax.swing.JOptionPane;

public class current_time {
    public static void main(String avgs[]) {
        long millis = System.currentTimeMillis();
        /* Java的System类中，有currentTimeMillis()方法， 返回从GMT 1970年1月1日0点开始到当前时刻的毫秒数 */
        long second = millis / 1000;
        long minute = second / 60;
        long hour = minute / 60;

        int real_second = (int) second % 60;
        int real_minute = (int) minute % 60;
        int real_hour = (int) hour % 24;
        if (real_hour >= 16)
            real_hour = real_hour - 16;
        else
            real_hour = real_hour + 8;

        String timeString = String.format("%02d:%02d:%02d BJT\n", real_hour, real_minute, real_second);

        Date date = new Date();// java.util.Date包

        JOptionPane.showMessageDialog(null, timeString + date.toString(), "Current Time\n",
                JOptionPane.INFORMATION_MESSAGE);
    }
}
```

## 随机数

```java
import java.util.Random;

Random ran = new Random();
System.out.println(ran.nextBoolean());
// ran.nextInt() .nextLong() .nextFloat() .nextDouble() .setSeed(seed);
// ran.nextInt(bound) 产生0到bound参数(不包括)的随机数

// 计算机产生的实际上是一组以种子为依据生成的伪随机数
// 常见做法：设定不同的随机数种子以生成尽可能随机的数
Random rand = new Random(System.currentTimeMillis());
```

