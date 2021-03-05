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
   //单行注释
   /*多行注释
   和C语言类似
   */
   ```

2. 保留字

   ```java
   abstract,continue,for,new,switch,assert,default,goto,package,synchronized,boolean,do,if,private,this,break,double,implements,protected,throw,byte,else,import,public,throws,case,enum,instanceof,return,transient,catch,extends,int,short,try,char,final,interface,static,void,class,finally,long,strictfp,volatile,const,float,native,super,while
   // ⚠对编译器具有特殊意义，在程序中不能用作其他目的
   ```

3. 修饰符

   ```java
   public static private final abstract protected
   ```

4. 语句，表示一个或一系列操作，以==分号==结束

5. 块，由==花括号==括起来

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
> **(JavaSourceFile)--|javac.exe|–>(JavaBytecode)--|java.exe|–>{execute}**
> **(源程序)--|编译器|–>(字节码程序)--|解释器|–>{执行}**

[返回上一页](java.md)