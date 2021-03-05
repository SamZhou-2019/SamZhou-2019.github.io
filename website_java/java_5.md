# 五、方法

```java
/*定义方法*/
public /*修饰词*/ int /*返回值类型*/ method /*方法名*/ (int x /*形参*/) /*方法头*/{
    /*方法体*/
    /*在方法体内定义的变量称为局部变量，只限于在方法体内使用*/
    return x;/*返回值，方法体中可以提前return*/
}
/*调用方法*/
int m = method(a /*实参*/);
double time = System.currentTimeMillis();// ⌚获得当前时间
```

> 这个方法不会改变方法外的变量--<b>值传递</b>。
> 如何利用方法改变方法外的变量?<br>装箱类,如Int:首字母大写

## 重载

重载：一个类中可以有多个相同名字的变量/方法，但类型/参数必须不同。重载方法调用参数时必须对应。

```java
public int max (int x, int y){}
public double max (int x, int y){} // ❌ 仅改变返回值类型，不是重载
public int max (int n, int m){} // ❌ 仅改变形参命名，不是重载
public int max (int x, int y, int z){} // ✅
public double max (double x, double y){} // ✅
```

子类中名称相同的变量和方法会隐藏/重写父类的同名变量和方法。如需使用父类变量或方法则需使用super.。

重载示例：

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

### 歧义调用

一个方法的调用可能会与多个重载的方法匹配，此时会产生编译错误。如：

> max（1，2）可以匹配max（int，double），也可以匹配max（double，int）

解决方法：`max(1, (double)2)`或`max((double)1, 2)`

## 方法示例

### 弹出一个可视化对话框

```java
import javax.swing.JOptionPane;

javax.swing.JOptionPane.showMessageDialog(null,//对话框配置，默认为null
/*showInputDialog为输入对话框*/            "Hello, world",//对话框主体内容
/*返回输入的字符串*/                       "welcome",//对话框标题
javax.swing.JOptionPane.INFORMATION_MESSAGE);//对话框类型，包括ERROR_MESSAGE, INFORMATION_MESSAGE, WARNING_MESSAGE, _MESSAGE, PLAIN_MESSAGE
```

```java
final double PI=3.14159;
Double radium=Double.parseDouble(JOptionPane.showInputDialog("Please input radium:"));//弹出一个输入对话框
//Double.parseDouble指字符串转换为浮点数
JOptionPane.showMessageDialog(null, "Area="+Double.toString(radium*radium*PI),
                              "Result", JOptionPane.INFORMATION_MESSAGE);
```

例子：弹出到前时间对话框

```java
import java.util.Date;
import javax.swing.JOptionPane;

public class current_time {
    public static void main(String avgs[]) {
        long millis = System.currentTimeMillis();
        /* Java的System类中，有currentTimeMillis()方法， 
        返回从GMT 1970年1月1日0点开始到当前时刻的毫秒数 */
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

        String timeString = String.format("%02d:%02d:%02d BJT\n", 
                                          real_hour, real_minute, real_second);

        Date date = new Date();// java.util.Date包

        JOptionPane.showMessageDialog(null, timeString + date.toString(), 
                                      "Current Time\n",
                JOptionPane.INFORMATION_MESSAGE);
    }
}
```

### Math类中的方法

```java
//类常量：
public static double PI
public static double E
//三角函数
public static double sin(double a)//如：Math.sin(Math.PI/2) 得到1.0
public static double cos(double a)//如：Math.cos(Math.PI/2) 得到 0.0
public static double tan(double a)
public static double acos(double a)
public static double asin(double a)
public static double atan(double a)
//指数函数
public static double exp(double a)//e^a
public static double log(double a)//ln(a)
public static double log10(double a)//log10(a)
public static double pow(double a, double b)//a^b
public static double sqrt(double a)//√a
//取整
public static double ceil(double a)//得到向上与a最接近的整数
public static double floor(double a)//得到向下与a最接近的整数
public static double rint(double a)//得到与a最接近的整数。如果到两个整数的距离相等，则返回其中的奇数
public static int round(float a)//四舍五入：(int)Math.floor(a + 0.5)
public static double round(double a)//四舍五入：(long)Math.floor(x + 0.5)
//min/max/abs
public static double min(double a, double b)
public static float min(float a, float b)
public static long min(long a, long b)
public static int min(int a, int b)/**/
public static double max(double a, double b)
public static float max(float a, float b)
public static long max(long a, long b)
public static int max(int a, int b)/**/
public static double abs(double a)
public static float abs(float a)
public static long abs(long a)
public static int abs(int a)
//random
public static double random()//得到 [0.0, 1.0) 之间的一个随机数
```

## 包

把多个类放在一起成为包，可以：

1. 避免命名冲突
2. 便于发布软件
3. 保护类

包是分层次的，并且可以有包含关系。类必须隶属于某个包中。
缺省包：某个类的包名称为空，类似于根目录上的类。
包名称使用倒写的Internet域名，如`cn.edu.xidian.ems`（https://ems.xidian.edu.cn）

在类中定义包名

```java
package cn.edu.xidian.ems;
```

编译与运行

```bash
$ javac cn/edu/xidian/ems/Helloworld.java # 注意目录结构分割符为斜杠
$ java -classpath "D:\java" cn.edu.xidian.ems.Helloworld
# 以包名称的方式写目录。classpath被称为类路径，字符串格式，是包的位置
```

导入其他包中的类

```java
import javax.swing.JOptionPane;
import javax.swing.*; // 导入这个包里面的所有类
```

[返回上一页](java.md)