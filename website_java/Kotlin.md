# Kotlin

2021/3/6

## 1.基本格式

```kotlin
fun main() {                        //声明主函数
    println("Hello world!")         //语句后面不需要加分号
    var a = 10                      //声明变量，可以不声明数据类型，Kotlin会自动判断
    val b = 50                      //声明常量
    var c: Int = 20                 //也可以声明常量或变量的数据类型
    println(a + b + c)
    test("Kotlin")
}

fun test(s: String): Int {           //也可以定义一个函数
    println("What you enter is: $s") //在字符串中引用变量时可以在变量前加$
    return 0
}
```

## 2.函数定义

```kotlin
import kotlin.math.max

fun main() {
    println(larger3(15,16))
}
//定义一个简单的函数：
fun larger1(num1:Int,num2:Int):Int{
    return max(num1,num2)
}
//该函数可以简化为以下写法：
fun larger2(num1:Int,num2:Int):Int=max(num1,num2)
//由于Kotlin可以自动判断数据类型，因此还可以简化为：
fun larger3(num1:Int,num2:Int)=max(num1,num2)
```

## 3.判断语句

#### if

```Kotlin
fun main() {
    println("Is 15 odd number? " + odd4(15))
}

//以常规思路写一个包含判断语句的函数：
fun odd1(num1: Int): String {
    if (num1 % 2 == 1) {
        return "Yes."
    } else {
        return "No."
    }
}

//该函数可以简化为以下写法：
fun odd2(num1: Int): String {
    return if (num1 % 2 == 1) {
        "Yes."
    } else {
        "No."
    }
}

//由于Kotlin中if和else自带return效果，因此还可以写作：
fun odd3(num1: Int): String = if (num1 % 2 == 1) {
    "Yes."
} else {
    "No."
}

//由于Kotlin可以自动判断数据类型，因此还可以简化为：
fun odd4(num1: Int) = if (num1 % 2 == 1) "Yes." else "No."
```

#### when

```kotlin
fun main(){
    println(grade(0)+" is the best programming language.")
    println("50L is a "+type(50L))
}

//when相当于Java中的switch，但是要比switch强大得多。
//用法一：值匹配
fun grade(no:Int) = when(no){
    0 -> "Kotlin" //->箭头指向返回值，结尾不需要break和分号（Java和C需要）
    1 -> "Python"
    2 -> "Java"
    3 -> "C"
    4 -> "PHP"
    else -> "Unknown" //缺省值为else（Java和C为default）
}

//用法二：类型匹配
fun type(data: Number) = when(data){
    is Int -> "int"
    is Double -> "double"
    is Long -> "long"
    else -> "not a number"
}

//用法三：扩展用法
fun grade2(no:Int) = when{
    no == 0 -> "Kotlin" //判断两者相等需要两个等号==（Java需要.equal()）
    no in 1..5 -> "Python" //no为int整形，no >= 1 && no <6 可以写作 no in 1..5
    //a..b代表一个[a,b]闭区间
    //b downTo a代表一个降序闭区间
    //a until b代表一个[a,b)的半开半闭区间
    no in 6..10 -> "Java"
    no in 11..15 -> "C"
    no in 16..20 -> "PHP"
    else -> "Unknown"
}
```

## 4.循环语句

while与Java中的while用法一致，略

#### for

<b style="color:red;font-size:large">`for (initialization;condition;action)` 在Kotlin中不适用，只能使用for-in用法。</b>

```kotlin
fun main(){
    for (i in 1..10) println(i)
    for (j in 2 until 13) println(j)
    for (k in 5..19 step 2) println(k) //如果需要每次都跳过一个间隔，可以使用step
    for (l in 18 downTo 2) println(l)
}
```

2020/3/7

## 5.类和对象

```kotlin
class Person {
    var age = 1
    var name = ""

    fun aging() {
        this.age++
    }

    fun selfIntro() {
        println("My name is $name, I am $age years old.")
    }

    fun set(name:String,age:Int){
        this.name=name
        this.age=age
    }
}
```

```kotlin
fun main() {
    var s = Person()  //相当于Java来说，Kotlin省略了new
    s.set("Jack", 10)
    s.aging()
    s.selfIntro()
}
```

### 继承

Kotlin的抽象类和Java没有区别，但是<b style="color:red;font-size:large">非抽象类默认是不能被继承的</b>（相当于默认加了一个Java中的`final`。若要让某个非抽象类可继承，只需加一个关键字**`open`**。

```kotlin
open class Person {...}
```

继承时，Java的关键字为`extends`，而Kotlin直接用冒号替代。

同时，继承时父类的类名后**要加括号**（Java不用加括号）

```kotlin
class Student : Person(){...}
```

### 主构造函数

主构造函数是最常用的构造函数。每个类默认有一个不带参数的构造函数，可以在类名后直接指明参数。每个类只能有一个主构造函数

```kotlin
open class Person(name:String,age:Int) {...}
```

主构造函数没有函数体。（继承时父类的类名后要加括号，就是这个原因。在Java中子类的构造方法要继承父类的构造方法，而在Kotlin中只需在父类类名后加括号。如果定义父类时，父类的主构造函数里面有参数，则在继承时，子类和父类的主构造函数里面也要有对应的参数）

主构造函数可以有函数体，用结构体init标识。

```kotlin
open class Person(val name: String, val age: Int) {
    init {//主构造函数的函数体
        println("My name is $name, I am $age years old.")
    }
}

class Student(sno: String, grade: Short, name: String, age: Int) : Person(name, age) {...}
```

### 次构造函数

次构造函数有函数体。一个类可以有多个次构造函数。

1. 一个类可以既定义主构造函数又定义次构造函数。此时次构造函数必须调用主构造函数。

```kotlin
open class Person(val name: String, val age: Int) {
    init {
        println("My name is $name, I am $age years old.")
    }
    constructor():this("Default",0){
        //1.次构造函数的关键字为constructor
        //2.次构造函数需要调用主构造函数，调用时使用关键字this
        println("All the args are default.")
    }
}

class Student(sno: String, grade: Short, name: String, age: Int) : Person(name, age) {
    constructor(sno: String, grade: Short):this(sno,grade,"unknown",0)
    //1.子类也可以有次构造函数
    //2.次构造函数也可以没有函数体
}
```

2. 一个类可以不显式定义主构造函数，只定义次构造函数。

```kotlin
open class Person {
    constructor(){//只定义了次构造函数
        println("All the args are default.")
    }
}
```

```kotlin
open class Person(val name: String, val age: Int) {...}

class Student : Person {//子类也可以只定义次构造函数，此时这里子类和父类的类名后均没有括号
    constructor(name: String, age: Int):super(name,age)//但是这个时候次构造函数需要调用父类的构造函数，因为子类没有主构造函数来调用
}
```

### 接口

```kotlin
fun main() {
    var d = Dog("Kim")
    d.eating()
    d.saying()
}

interface Say {//接口相当于一个抽象类，可以定义一系列的抽象函数，用具体的类实现
    fun saying()//接口中的函数可以没有函数体，此时实现这个接口的类必须重写该函数
}

interface Eat {
    fun eating()
    //接口中的函数可以有函数体，此时实现这个接口的类可以不用重写该函数。函数体的内容被称为该函数的默认实现
}

open class Animal(name: String, food: String, voice: String) {
    var name = name
    var food = food
    var voice = voice
}

class Dog(name: String) : Animal(name, "meat", "Woof!"), Eat, Say {
    //一个类可以实现多个接口，“实现”这个关键字为冒号（JAVA为implements）
    //类的继承和接口的实现，都用冒号标识，类和接口之间、接口和接口之间用逗号隔开
    override fun eating() {//重写接口中的方法，关键字为override
        println("$name is eating $food.")
        println("$name says: $voice")
    }

    override fun saying() {
        println(voice)
    }
}
```

### 修饰符

| 修饰符        | Java                               | Kotlin                 |
| ------------- | ---------------------------------- | ---------------------- |
| private(一样) | 仅本类可见                         | 仅本类可见             |
| public        | 对所有类可见                       | 对所有类可见（缺省值） |
| protected     | 本类，本类的子类和同一个包的类可见 | 本类，本类的子类可见   |
| default       | 同一个包的类均可见（缺省值）       | 没有这个修饰符         |
| internal      | 没有这个修饰符                     | 同一个模块的类均可见   |

### 数据类

在Java中通常需要重写某个类的equals()、hashCode()和toString()方法。而在Kotlin中仅需定义该类为数据类

```kotlin
data class Phone(val brand: String, val prive: Double)
```

即可。此时这三个方法实现的功能分别为：

`equals`：当两个对象的所有参数都相等时返回true，否则返回false

`hashCode`：返回非数值变量的哈希值和数值变量

`toString`：返回类名和各变量的值

### 单例类

单例类在全局仅允许有一个实例出现，在Kotlin中需要用关键字object创建。

```kotlin
object car {
    private var brand: String = "default"
    private var price: Double = 0.0
    
    fun info() {
        println("This car is $brand, it costs RMB$price.")
    }

    fun set(brand: String, price: Double) {
        this.price = price
        this.brand = brand
    }
}

fun main() {//单例类可以直接用类名调用函数
    car.set("BYD",400000.00)
    car.info()
}
```

## 6.集合

### List&Set

可以利用listOf创建只读列表，用mutableListOf创建可读写的列表。

```kotlin
var FiveEyes = listOf("America","English","Australia","Canada","New Zealand")
for (eye in FiveEyes){
    println("$eye is not a friendly country.")//可以使用for循环语句来读取
}
```

```kotlin
var books = mutableListOf("Economics","Python","Intelligence","Accounting")
books.add("Kotlin")
books.remove("Python")
for (book in books){
    println("I have a book teaching $book")
}
```

Set和List大致相同。Set是使用hash映射机制来存放数据的。可以利用setOf创建只读Set列表，用mutableSetOf创建可读写的Set列表。

### Map

Map是一种键值对形式的数据结构。

```kotlin
var market = HashMap<String, Double>()//可以通过如下语句添加元素
market["egg"]=1.5
market["apple"]=3.0
market["noodles"]=2.0
```

```kotlin
var market=mapOf("apple" to 1,"banana" to 2,"orange" to 3)
//也可以通过mapOf或者mutableMapOf定义
for ((fruit,price)in market){//可以使用for循环语句来读取
    println("$fruit is $price yuan.")
}
```

### Lambda表达式

Lambda表达式的语法结构为`{参数名1: 参数类型, 参数名2: 参数类型 -> 函数体}`

```kotlin
var list = listOf("Java","Python","Fortran","Kotlin","Matlab")
var lambda = {lang:String -> lang.length}//这是一个lambda表达式
var longest = list.maxBy(lambda)//maxBy表示取最大值对应的元素，minBy取最小的
println(longest)
/*以上代码可以简化：
1.lambda变量无需单独定义.
2.Kotlin规定如果lambda表达式是函数最后一个参数时，可以把表达式移到括号外；如果lambda表达式是唯一一个参数时还可以删除括号.
3.Kotlin的参数类型推导机制，可以把String省略。
4.如果Lambda表达式的参数列表只有一个参数，可以直接用it代替参数名。
因此第2、3行可以写作：*/
var longest = list.maxBy { it.length }
var newlist = list.map { it.toUpperCase() }
//map表示映射，这个表达式用于将单词转换为大写字母
var newlist1 = list.filter { it.length < 6 }
//filter表示过滤，这个表达式用于筛选长度小于6的字符串
var newlist1 = list.any { it.length < 6 }
var newlist1 = list.all { it.length < 6 }
//any用于判断是否至少有一个元素都满足条件，all用于判断是否所有元素都满足条件
```

## 7.空指针

Kotlin把空指针异常的检测提前到了编译时。以下代码在编译时会报错。

```kotlin
fun main() {
    test(null)// (×) Null can not be a value of a non-null type String
}

fun test(arg1:String){
    println("Hello, $arg1")
}
```

### 可空类型

可以在类名后加一个问号，表示这个类是可空的。

```kotlin
fun test(arg1:String?){
    println("Hello, $arg1")//在这里不会报错，直接输出Hello, null
    println(arg1.length)//在这里会报错，因为arg1是空值，空值不能计算长度
}
```

### 判空操作符

对象在使用方法时，如果对象是可空的，则需要检验对象是否为空。可以用`?.`代替`!=null`

```kotlin
println(arg1?.length)//当arg1为空值时不进行操作
```

`?:`操作符：该分号左右两边都有表达式，如果左边表达式不为空就返回左边表达式的结果，否则返回右边表达式的结果。

```kotlin
val c = a ?: b
```

