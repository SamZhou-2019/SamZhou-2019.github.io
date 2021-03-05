# 九、继承和多态

## 继承和子类

继承：使用现有类的所有功能，在无需重新编写原有的类的基础上，对这些功能进行扩展。
通过继承创建的类被称为“子类”或“派生类”；被继承的类被称为“父类”、“超类”或“基类”。
继承是一个从一般到特殊的过程。

`class 子类 extends 父类`
每个子类只能有一个父类。父类与子类之间为树形结构，根节点为`java.lang.Object`。

```java
class UniversityStudent extends Student
```

1. 子类可以从父类继承属性和方法，也可以

   + 添加自己特有的属性、方法
   + 覆盖父类的方法

2. 子类不能继承父类的构造方法，只能被显式或隐式调用。

   + 使用关键字super可以显式调用父类的构造方法

   + 若没有构造方法被显式调用，父类的无参构造方法就将被自动、隐式调用
> <b style="color:red">⚠此时若父类没有无参构造方法，程序将无法编译</b>。解决方法：
>
> 1. 给父类添加无参构造方法
> 2. 在子类显式调用父类定义的构造方法
>
> 构造方法链：利用子类实例化对象时会沿着继承链调用所有父类的构造方法

3. 不同包的子类不能继承父类的友好变量和友好方法，但可以继承父类的public/private变量和public/private方法。
   protected受保护变量和方法—子类继承的更多说明：

   + 当在其他类O用某类A创建对象N时，如O与A在同一个包中，则N可以使用A自己创建的受保护变量和方法

   + 当在其他类O用某类A创建对象N且A为B的子类时，如O与B在同一个包中，则N可以使用B创建的受保护变量和方法

4. 动态绑定：对象调用一个方法，JVM将从定义该对象的类出发，沿着继承链查找该方法的实现，直至找到为止【匹配方法头】，调用该实现【绑定方法】。

   > O —- C1 –> C2 –> ... –> Cn-1 –> Object

> + 使用引用变量调用实例方法时，变量所引用对象的实际类在<b style="color:red">运行</b>时决定使用该方法的哪个实现。
>
> + 访问数据域或静态方法时，引用变量所声明的类型在<b style="color:red">编译</b>时决定使用哪个数据域或静态方法。
>
>   这是调用实例方法与访问数据域或静态方法的主要不同。

### super

super指向该类的父类，用于：

1. 调用父类的构造方法

   ```java
   super();//无参构造方法
   super(int i);//有参构造方法
   ```

2. 调用父类方法

   ```java
   super.func(int i, char ch);
   ```

> <b style="color:red">⚠注意</b>
>
> 1. 在子类中直接使用父类构造方法的名字会引起语法错误
>
> 2. super调用构造方法的语句必须放在子类构造方法的第一句
>
>    ```java
>    public test(){
>        super();
>        int num = 0;
>    }//✅
>    public test(){
>        int num = 0;
>        super();
>    }//❌
>    ```

## 覆盖

子类对父类**可访问的实例方法**进行修改。

⚠“可访问”意味着父类的**private方法**不能被覆盖；**static方法和父类数据域**可以被继承，但也不能被覆盖。重新定义**这两种方法及数据域**，会使得**父类的方法和数据域**被隐藏，但是仍然存在且与子类的方法和数据域相互独立。可以使用super来调用**父类数据域和static方法**。
⚠覆盖不能降低方法的访问性。访问性从小到大为：<b style="color:red">private->default->protected->public</b>

```java
class student{
    public double getGrade(long id){...}
}
class collegeStu{
    public double getGrade(long id){...}//override 💡覆盖不修改形参变量，仅改变方法体
    public double getGrade(short id){...}//overload
}
```

`⚠覆盖.equals(重写) == true // 这两个词是一个意思`

## 多态

子类重写父类的方法，可以各自行使自己的功能行为。这种性质被称为多态性（Polym）。

父类 a = new 子类，即“子类是父类"。创建的对象a被称为上转型对象。
如 `Animal a = new Dog();`即“狗是动物”。（这一句包含了隐式强制转换，子类转父类）

上转型对象只继承父类的变量、方法和<b style="color:red">子类重写的方法</b>，**不能继承子类新增的变量和方法，也不能赋值给子类实例化的对象（除非显式强制转换为子类对象，如 `a = (Dog) a;`）**。但相比于用子类直接创建的对象，上转型对象可以继承<b style="color:red">父类的隐藏变量</b>。

多态的作用：把不同的子类对象都看成父类，可以屏蔽不同子类对象的差异，使得代码通用化。

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

### instanceof

用法：对象 instanceof 类名
如果对象是由类及其父类定义的，则返回true，否则返回false

```java
System.out.println(test instanceof Student);
```

[返回上一页](java.md)