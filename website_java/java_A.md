# 十、抽象和接口

## 抽象

abstract类（抽象类）：用abstract修饰的类。

> + 用abstract修饰，可以有抽象方法，也可以有普通方法。
> + 不能用new创建该类的对象（实例化）【即便没有抽象方法也不能实例化对象】，但可以创建上转型对象，也可以定义构造方法（在子类中调用）。
> + 只能在 被非抽象子类重写 时实现其功能，可以利用多态性。
> + 非抽象类的子类可以是抽象类。
> + 抽象类可以用作数据类型，如用来定义数组。

抽象方法：用abstract修饰的方法。

> + 只能声明【只有方法头】，没有方法体，不能实现任何功能。
> + 一般用来被子类覆盖，因此不能用final和static修饰。
> + 定义抽象方法的类==⚠必须为抽象类==。
> + 抽象类的非抽象子类中，所有的抽象方法都==⚠必须覆盖。如果不能覆盖所有的抽象方法，这个类就必须是抽象的。
> + 子类可以覆盖父类的非抽象方法，并定义其为抽象方法。此时该子类必须是抽象类。

```java
public class abstract_test {
    public static void main(String[] avgs) {
        Shape a = new Circle();
        System.out.println(a.area(5));
        // 抽象类可以创建上转型对象，并且可以使用被非抽象子类重覆盖的方法（多态）
        a.call();
    }
}

abstract class Shape {
    // abstract类（抽象类）
    abstract double area(double a);// 抽象方法
    
    void call() {
        System.out.println("A shape.");
    }// 非抽象方法
}

class Circle extends Shape {
    double area(double a) {
        return a * a * Math.PI;
    }

    void call() {
        System.out.println("A circle.");
    }
}

// 抽象类可以用作数据类型，如用来定义数组
Shape[] shapes = new Shapes[10];
```

## 接口

与抽象类相似，但只包含==⚠常量和抽象方法==。

> + 接口被认为是一种特殊的类。和抽象类类似，也不能用new实例化，但可以创建上转型对象。
> + 没有共同的根。（所有的类有一个共同的根：Object类）
> + 接口也可以用作数据类型，与抽象类相似。
> + 如果一个类扩展了接口，这个类就类似于这个接口的子类。与继承不同，一个类可以同时扩展多个接口，用逗号隔开。
>   但是如果一个类扩展的多个接口之间有信息冲突，就会引起错误。（例如，两个相同的常量有不同的值，两个方法有相同的头标志，但返回类型不同）
> + 单重或多重继承中，父子关系较强的使用子类继承，较弱的使用接口。

```java
public interface Comparable{
    public static final double pi = 3.1415926;
    //所有的变量都必须是public static final，因此这三个修饰符可以省略
    public abstract int CompareTo();
    //所有的方法必须是public abstract实例方法，因此这两个修饰符可以省略
}
```

子类在扩展接口时，必须重写接口的方法。

```java
public class Circle extends Shape implements Comparable{...}
```

|        | 变量                                        | 构造方法                                                     | 方法                                    |
| ------ | ------------------------------------------- | ------------------------------------------------------------ | --------------------------------------- |
| 抽象类 | 无限制                                      | 子类通过构造方法链调用构造方法，抽象类不能用new操作符实例化。 | 无限制                                  |
| 接口   | 所有的变量必须是public static final，即常量 | 没有构造方法，接口不能使用new操作符实例化。                  | 所有的方法必须是public abstract实例方法 |

[返回上一页](java.md)