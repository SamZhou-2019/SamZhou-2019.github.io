# 一、Java概述

## Java是什么

Java是一种编程语言，更是一种平台

+ JVM: Java Virtual Machine

  Java虚拟机，运行Java程序，屏蔽底层差异

+ JRE: Java Runtime Environment

  Java运行环境，包含了运行Java程序所必要的组件

+ JDK: Java Development Kit

  Java开发工具包，除了JRE外还包含开发、调试Java程序所需要的各种工具、库等

<b style="color:red">特点：简单、高效、安全、健壮、面向对象的、分布式的、解释型的、体系结构中立的、可移植的、多线程的、动态的</b>

<b style="color:orange">面向对象三个基本特征：封装、继承、多态</b>

## Java程序的大致结构

```java
public class Helloworld {//定义一个类
    public static void main(String[] args) {//main:程序入口
        System.out.println("Hello World");//输出一个字符串
        Student sam = new Student();//类的实例化（对象）
        sam.greetings("Sam");//对象使用方法
    }
}

class Student {
    public void greetings(String s) {//类中的一个方法，形参为一个字符串
        System.out.println("Hello, " + s);
    }
}
```


### Java文件剖析

1. 注释

   ```java
   //单行注释：只对本行//后的内容起到注释作用
   /*多行注释：注释范围为两个星号内的内容，可以是多行内容
   和C语言类似
   */
   ```

2. 保留字

   ```java
   // 全部为小写，在编译器中会变色
abstract,continue,for,new,switch,assert,default,goto,package,synchronized,boolean,do,if,private,this,break,double,implements,protected,throw,byte,else,import,public,throws,case,enum,instanceof,return,transient,catch,extends,int,short,try,char,final,interface,static,void,class,finally,long,strictfp,volatile,const,float,native,super,while
   // ⚠对编译器具有特殊意义，在程序中不能用作其他目的
   ```

3. 修饰符

   ```java
   public static private final abstract protected
   ```

4. 语句，表示一个或一系列操作，以<b style="color:red">分号</b>结束

5. 块，由<b style="color:red">花括号</b>括起来

6. 类，是对象的模板和蓝图

   ```java
   public class ClassName{
       /*class的命名规则：
       1. 同文件名对应
       2. 首字母大写
       3. 名词形式
       */
   }
   ```

7. 方法

### main 方法

main方法是Java程序的入口

```java
public static void main (String[] args){}
    //程序的入口，解释器通过调用main方法执行应用程序
```

`String[] avgs` 又被称为“命令行参数”。当该Java程序被命令行或其他Java程序调用时起作用。

```bash
$ java className arg0 arg1 ... argn
# arg 通常为字符串
```

```java
className.main(arg0,arg1,...,argn)
```


## 如何运行Java

```bash
$ javac Helloworld.java # 编译，无输出说明编译成功，生成Helloworld.class文件
$ java Helloworld # 执行，⚠注意不加.class后缀
Hello World
Hello, Sam
$ javap Helloworld.class # 反编译，将字节码反编译为源码
```

> Java程序的执行需要经过哪些步骤？如下：
>
> **(JavaSourceFile)----[javac.exe]---->(JavaBytecode)----[java.exe]---->{execute}**
> **(源程序)----[编译器]---->(字节码程序)----[解释器]---->{执行}**

## bonus!

### 中文编码格式问题

通常windows中cmd的编码格式为gbk。所以如果在命令行编译并运行编码格式为utf-8的java文件时会乱码。解决方案：
1. 将java源文件改为gbk格式，重新编译
2. 在编译命令后指定编码格式：`javac -encoding 源文件的编码格式 源文件名.java`

### 有关类的声明

Java中的类通过class声明。

⚠注意：一个java文件内，可以声明多个类，编译完成后，生成的class文件的数量等于声明的类数量【可以使用java命令分别单独运行每个类】。但是
1. 不同的类，类名不能相同
2. 一个java文件内只允许有一个使用public修饰的类
3. 被public修饰的类的类名必须和文件名保持一致

### 文档注释

   ```java
   /** 和普通注释不同，文档注释的前半部分有两个星号 */
   ```

用于产生帮助文档，对整个类、整个方法进行解释。

生成帮助文档：`javadoc -d 目标目录 【-author -version】 源文件名.java`（中括号【】里面的部分可以省略）。然后用浏览器打开目标目录下的index.html，即可显示帮助文档。

[返回上一页](java.md)
