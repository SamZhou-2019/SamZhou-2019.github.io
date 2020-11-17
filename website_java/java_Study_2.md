# Java 学习笔记（二）

## main 方法

main方法是Java程序的入口

```java
public static void main(String[] avgs)
```

String[] avgs 又被称为“命令行参数”。当该Java程序被命令行或其他Java程序调用时起作用。

```bash
$ java className arg0 arg1 ... argn
#arg 通常为字符串
```

```java
className.main(arg0,arg1,...,argn)
```

## 包装类

每一个数据类型都有包装类，以Character为例

```java
Character.isDigit(char);//判断是否为数字
Character.isISOControl(char);//判断是否为Unicode控制字符
Character.isAlphabetic(char);//判断是否为字母
Character.isDefined(char);//判断是否为Unicode定义的字符
Character.isLetter(char);//判断是否为字母
Character.isWhitespace(char);//判断是否为空白字符
Character.isUpperCase(char);//判断是否为大写字母
Character.isLowerCase(char);//判断是否为小写字母
Character.isLetterOrDigit(char);//判断是否为数字或字母
Character.toUpperCase(char);//转换为大写字母
Character.toLowerCase(char);//转换为小写字母
Character.toString(char);//转换为字符串
Character.toChars(char);//转换为字符
Character.compare(char1,char2);//字符比较
Character ch = 'e';
ch.equals('d');//判断字符是否相等
ch.charValue();//转换为字符
ch.compareTo(char);//字符比较
```

## 字符串

```java
String message = new String("I drink coffee.");//正式初始化方法
String messageNew = "I drink tea";//快速格式化方法
messageNew = "Coffee对身体不好。";
//字符串变量是一个指针，内容不可改变。
//尝试重新赋值只会创建一个新的字符串对象。
//而原有的字符串对象则被垃圾回收机制清理。

System.out.println(messageNew.length());
//在Java中字符串由Unicode储存，中英文字符长度均为1。
System.out.println(messageNew.charAt(8));
//不能用messageNew[8]

//字符串相加
System.out.println(message.concat(messageNew).concat("\nOK, I drink tea."));
System.out.println(messageNew+"\n"+message);

//提取子串
System.out.println(messageNew.substring(6,9));//从a到b不包括b
System.out.println(messageNew.substring(6));//从a到末尾

//比较字符串内容
System.out.println(message.equals(messageNew));//内容是否相等
//message==messageNew比较的是字符串变量存储的地址。
System.out.println(message.compareTo(messageNew));//按照Unicode比较字符串

//修改字符串
System.out.println(message.toLowerCase());//转换为小写字母
System.out.println(message.toUpperCase());//转换为大写字母
//trim()：去掉头尾的空格
System.out.println(message.replace("coffee", "wine"));//
//replace(oldChar, newChar)：将字符串中的 oldChar 用 newChar 来代替
//replaceAll 全部替换 replaceFirst 从左到右查找，只替换第一个

//查找字符或子串
//indexOf("",index)：从前向后查找
//lastIndexOf("",index)：从后向前查找   
//如果找不到，则返回 -1
System.out.println(message.indexOf("coffee"));

//将字符和数字转换为字符串
System.out.println("咖啡的价格是￥"+String.valueOf(50));

//根据正则表达式拆分字符串为字符串数组
System.out.println(message.split(" ")[2]+"\n"+message.split(" ")[1]);

//字符缓冲区
StringBuffer buff = new StringBuffer(40);
//构造时默认长度为16，可定义长度，为空缓冲区
//参数为字符串时，生成字符串+长度16空的缓冲区
buff.append("I love Sundae");//追加内容，可追加基本数据类型，字符串及缓冲区
buff.append(", a kind of ice cream").append(", very much.");//支持连写
String str = buff.toString();//转为字符串
System.out.println(str);
```

## 文件与输入输出

```java
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

public class file_test {
    public static void main(String[] avgs) throws IOException {
        File f = new File("test.txt");
        if (!f.exists()) {//判断文是否存在
            //f.mkdir();//创建文件夹(目录)
            f.createNewFile();//创建文件
            /*File
            *exists()    文件或目录是否存在
            canRead()    是否可读
            canWrite()    是否可写
            isDirectory()    是否为目录
            isFile()    是否为文件
            isAbsolute()    本File对象是否采用绝对路径来创建的
            isHidden()    是否为隐藏文件
            getAbsolutePath()    得到绝对路径
            getCanonicalPath()    得到规范的绝对路径
            getName()    得到文件/目录名
            getPath()    得到路径
            getParent()    得到父目录的路径名
            lastModified()    最后修改时间
            delete()    删除
            renameTo(File)    重命名
            deleteOnExit()   JVM关闭时删除文件
            setReadOnly()    设置只读
            setReadable(boolean)    设置是否可读
            setWritable(boolean)    设置是否可写
            setExecutable(boolean)    设置是否可执行
            */
        }
        PrintWriter pw = new PrintWriter("test.txt");
        pw.print("test");//可使用print,printf,println
        pw.close();//及时关闭对象
        Scanner sn = new Scanner(f);
        String a=sn.nextLine();//读取下一行
        /**Scanner
         * next()    读入字符串
         * hasNext()    boolean,是否有输入
         * nextByte(),nextInt(),nextShort(),
         * nextDouble(),nextFloat(),nextLong()    读入相应类型数据
         * useDelimiter(String)    设置分隔符
         */

        sn.close();//及时关闭对象
        System.out.println(a);
    }
}
```

## 上转型，多态与抽象

父类 a = new 子类，即“子类是父类"
如 `Animal a = new Dog();`

上转型对象只继承父类的变量、方法和==子类重写的方法==，不能继承子类新增的变量和方法（除非强制转换为子类对象，如 `a = (Dog) a;`）。但相比于用子类直接创建的对象，上转型对象可以继承父类的隐藏变量。

上转型变量继承子类重写的方法，可以行使自己的功能行为。这种性质被称为多态性（Polym）。

```java
public class polym {

    public static void main(String[] avgs) {
        // 多态
        Animal P;
        P = new Cat();
        P.run();// 上转型对象继承子类重写的方法
        P = new Bird();
        P.run();
    }
}

class Animal {
    void run() {
    }
}

class Cat extends Animal {
    void run() {// 子类重写父类的方法
        System.out.println("Run with four legs.");
    }
}

class Bird extends Animal {
    void run() {
        System.out.println("Run with two claws.");
    }
}
```

abstract类（抽象类）：用abstract修饰，可以有抽象方法，也可以有普通方法。不能用new创建该类的对象，但可以创建上转型对象，并且可以使用被非抽象子类重写的方法（多态）

抽象方法：用abstract修饰的方法。只能声明，不能实现任何功能。一般用来被子类重写，因此不能用final和static修饰。

```java
public class abstract_test {
    public static void main(String[] avgs) {
        Shape a = new Circle();
        System.out.println(a.area(5));
        // 抽象类可以创建上转型对象，并且可以使用被非抽象子类重写的方法（多态）
        a.call();
    }
}

abstract class Shape {
    // abstract类（抽象类）
    // 可以有抽象方法，也可以有普通方法
    // 不能用new创建该类的对象
    abstract double area(double a);

    // 抽象方法：abstract方法只能声明，不能实现任何功能
    // 一般用来被子类重写，因此不能用final和static修饰
    void call() {
        System.out.println("A shape.");
    }
}

class Circle extends Shape {
    double area(double a) {
        return a * a * Math.PI;
    }

    void call() {
        System.out.println("A circle.");
    }
}
```

