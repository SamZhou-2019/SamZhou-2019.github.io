# 七、对象和类

面向对象的程序设计：使用对象进行程序设计。
对象：现实世界中可以明确表示的一个整体。
每个对象都有状态【变量】和行为【方法】。
类：定义同一类型对象的结构体。

```java
class className{// 修饰词 class 类名
    int classVariable;//定义变量
    // 没有static修饰词的变量一般只属于特定对象，不共享
    private char privateVariable;// 私有变量,类外不能直接使用
    final static float finalStaticVariable;
    //由static修饰的变量和方法由定义的所有对象共享
	//由final修饰的变量和方法不能修改
    void classFunction(){// 定义方法
        System.out.println(classVariable);
    }
}

className classObj = new Classname();// 引用类的基础上实例化一个对象
classObj.classVariable;// 调用对象的数据
classObj.classFunction();// 调用对象的方法
```

类内数据域的缺省值：类内的数据域在未赋值前的缺省值同数组缺省值。
<b style="color:red">⚠注意：方法中的局部变量没有缺省值，若直接使用则会报错。</b>

## UML类图

UML：统一建模语言

```java
class JavaTest{
    double status = 1.0;// 变量：状态
    JavaTest(){}// 构造方法
    double getStatus(){return status;}// 方法：行为
}
```

| JavaTest                            |
| ----------------------------------- |
| status: double                      |
| JavaTest()<br/>getstatus() : double |



|                 类名<br />（斜体表示抽象类）                 |
| :----------------------------------------------------------: |
|                       数据域：数据类型                       |
| 构造方法()<br />方法名(参数名：参数类型)：返回值参数类型<br />(+表示public，-表示private，#表示protected，下划线表示static，斜体表示abstract) |

## 构造方法

构造方法：用类创建对象的方法。

```java
class plus{
    int x;
    // 若未定义构造方法则采用无参数的默认构造方法，如plus()
    plus(int a,int b){// 构造方法无类型，可定义参数
        x=a+b;
    }// ⚠构造方法与所在的类必须具有相同的名字
    plus(){}// ⚠若定义了一个有参的构造方法，则无参构造方法默认不会生成，需要额外定义
}
plus test=new plus(20,30);//构造方法的作用体现在这里
```

对象的复制：和数组的复制一样，利用对象名直接赋值给另一个对象，只会改变地址而不是对象本身。垃圾回收机制同样也会起作用。

## 垃圾回收机制（GC）

当没有指针指向某一内存空间时，JVM会自动释放该空间。

```java
System.gc();
```

## 类的实例

### Date🎈

`java.util.Date`
		`Date()   `                                              构造方法：创建当前时间的Date对象
		`Date(elapseTime:long)`                    构造方法：参数为从Epoch Time开始的毫秒数
		`.toString():String`                          返回一个字符串表示的时间
		`.getTime():long`                               返回Epoch Time开始的毫秒数
		`.setTime(elapseTime:long):void`     设置新的时间
		`.after(date:Date):boolean`              判断日期是否在参数指定的日期之后
		`.before(date:Date):boolean`            判断日期是否在参数指定的日期之前
		`.equals(date:Date):boolean`            判断日期是否和参数指定的日期相同
		`.compareTo(date:Date):int`              比较日期和参数指定的日期：
																		相等时返回0，调用对象日期在前则返回负数，
																		参数指定日期在前则返回正数

`SimpleDateFormat`可以自定义Date对象的输出格式。

```java
Date d = new Date();//创建当前时间的对象
SimpleDateFormat sdf = new SimpleDateFormat("G");//创建格式对象时需定义输出日期的格式
System.out.println(sdf.format(d));
```

格式字符串中各字母的定义如下：

| 字母 | 描述                     | 示例 |
| ---- | ------------------------ | ---- |
| G    | 纪元标记                 | 公元 |
| y    | 四位年份                 | 2020 |
| M    | 月份                     | 12   |
| d    | 一个月的日期             | 28   |
| h    | A.M./P.M. (1~12)格式小时 | 6    |
| H    | 一天中的小时 (0~23)      | 18   |
| m    | 分钟数                   | 11   |
| s    | 秒数                     | 24   |
| S    | 毫秒数                   | 755  |
| E    | 星期几                   | 周一 |
| D    | 一年中的日子             | 363  |
| F    | 一个月中第几周的周几     | 4    |
| w    | 一年中第几周             | 1    |
| W    | 一个月中第几周           | 5    |
| a    | 上午/下午标记            | 下午 |
| k    | 一天中的小时(1~24)       | 18   |
| K    | 上午/下午(0~11)格式小时  | 6    |
| z    | 时区                     | CST  |

### Calendar🎈

抽象类`java.util.Calendar`可以定义日历对象并进行操作。由于是抽象类，因此不能使用new创建对象。可以使用它的方法`getInstance()`：

````
Calendar c = Calendar.getInstance();
````

来创建日历对象。该对象包含日期（常量YEAR, MONTH, DAY_OF_MONTH, WEEK_OF_YEAR, WEEK_OF_MONTH, DAY_OF_YEAR, DAY_OF_WEEK, DAY_OF_WEEK_IN_MONTH等）、时区（常量AM_PM, HOUR, HOUR_OF_DAY, MINUTE, SECOND, MILLISECOND等）、时间（常量ZONE_OFFSET等）等信息。
上述常量可以使用get方法输出：

```java
System.out.println(c.get(c.YEAR));
```

注意常量DAY_OF_WEEK中，星期日为1，星期一为2，以此类推；常量MONTH中一月为0，二月为1，以此类推。

使用set方法可以修改日期信息，有四种调用方法，如第一种调用方法：

```java
c.set(2021,1,1);//参数均为整型。
```

将日期对象c的年、月、日改为2021、1、1。第一个参数可为负数，代表公元前，下同。
第二种调用方法：五个整型，分别更改日期对象的年月日时分。
第三种调用方法：六个整型：分别更改日期对象的年月日时分秒。
第四种调用方法：第一个为Date常量，第二个为更改后的值。如：

```java
c.set(c.YEAR,2019); 
c.add(c.DATE,10);// 可以使用add方法改变日期。后一个参数为整型，若为负数则为减少日期 
```

使用`System.out.printf`方法可以按格式输出<b style="color:red">Date和Calendar对象</b>指定的日期，如：

```java
System.out.printf("%tF",c);
```

`System.out.printf`方法有一个“索引项”机制，可以重复调用字符串。格式是`%[索引]$[格式类型]`，如：

```java
System.out.printf("%1$s%3$s%2$tF%3$s%2$tT\n","Date:",c,"  ");//Date: 2020-12-29 21:30:00
```

如果连续重复使用同一个字符串，也可以使用小于号<，如`%<$s`。

| 类型符 | 说明                              | 示例                               |
| :----- | :-------------------------------- | :--------------------------------- |
| %tc    | 包括全部日期和时间信息            | 星期一 十二月 28 15:00:00 CST 2020 |
| %tF    | "年-月-日"格式                    | 2020-12-28                         |
| %tD    | "月/日/年"格式                    | 10/27/07                           |
| %tr    | "HH:MM:SS PM"格式（12时制）       | 03:00:00 下午                      |
| %tT    | "HH:MM:SS"格式（24时制）          | 15:00:00                           |
| %tR    | "HH:MM"格式（24时制）             | 15:00                              |
| %tb    | 月份简称                          | Jan                                |
| %ta    | 星期简称                          | 周一                               |
| %tB    | 月份全称                          | January                            |
| %tA    | 星期全称                          | 星期一                             |
| %tC    | 年的前两位                        | 20                                 |
| %ty    | 年的后两位                        | 20                                 |
| %tj    | 年的第几天                        | 150                                |
| %tm    | 两位数字的月份（不足两位前面补0） | 01                                 |
| %td    | 两位数字的日（不足两位前面补0）   | 05                                 |
| %te    | 月份的日（前面不补0）             | 5                                  |

### Random

```java
import java.util.Random;

Random ran = new Random();// 无种子的构造方法
System.out.println(ran.nextBoolean());
// ran.nextInt() .nextLong() .nextFloat() .nextDouble() .setSeed(seed)
// ran.nextInt(int bound) 产生0到bound参数(不包括)的随机数

// 计算机产生的实际上是一组以种子为依据生成的伪随机数，相同种子所生成的随机数列相同
// 常见做法：设定不同的随机数种子以生成尽可能随机的数
Random rand = new Random(System.currentTimeMillis());// 有种子的构造方法
```

### ArrayList

`java.util.ArrayList`类用于储存不限个数的对象

| +ArrayList()                     | 构造函数                                |
| -------------------------------- | --------------------------------------- |
| +add(o:Object):void              | 添加一个对象到ArrayList的尾部           |
| +add(index:int, o:Object):void   | 添加一个对象到ArrayList的指定位置       |
| +clear():void                    | 清除内容                                |
| +contains(o:Object):boolean      | 判断ArrayList中是否包含指定的对象       |
| +get(index:int):Object           | 获取指定位置的对象                      |
| +indexOf(o:Object):int           | 获取指定对象在ArrayList中的索引         |
| +isEmpty():boolean               | ArrayList是否为空                       |
| +lastIndexOf(o:Object):int       | 获取指定对象在ArrayList中最后出现的位置 |
| +remove(o:Object):boolean        | 在ArrayList中，移除指定的对象           |
| +remove(index:int):Object        | 在ArrayList中，移除指定位置的对象       |
| +size():int                      | ArrayList当前包含对象的数目             |
| +set(index:int, o:Object):Object | 设置指定位置上的对象                    |

### 包装类

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

| 基本数据类型 | char      | boolean | byte | short | int     | long | float | double |
| ------------ | --------- | ------- | ---- | ----- | ------- | ---- | ----- | ------ |
| 对应的包装类 | Character | Boolean | Byte | Short | Integer | Long | Float | Double |

包装类中包含的常量MIN_VALUE和MAX_VALUE即基本数据类型的取值范围，如Byte.MAX_VALUE

### Object

| 方法       | 功能                                                         |
| ---------- | ------------------------------------------------------------ |
| equals()   | 比较两个对象的引用（地址）是否相同，同“==”<br />通常需要覆盖这个方法来实现自己的逻辑 |
| hashCode() | 返回该对象的hash码                                           |
| clone()    | 复制一个对象                                                 |
| getClass() | 返回关于该对象的类的信息                                     |

### BitSet🎈

`java.util.BitSet`类用来创建一组特殊的数组，但是保存的是位值，且数组大小随需要增加。
这个类定义了两个构造方法：

```java
BitSet();//无参构造，默认创建一个空数组
BitSet(int);//有参构造，指定初始大小，所有位初始化为false
```

> `BitSet.set(int)` 方法set可以将<b style="color:red">参数`int`指定的位</b>的值设为`true`。
> 可以使用`BitSet.set(int1, int2)`来把<b style="color:red">`int1`【包括】到`int2`【不包括】指定位</b>的值都设为`true`。
> 也可以使用`BitSet.set(int, Boolean)`来设置<b style="color:red">`int`指定位</b>的值为==参数`Boolean`==的值。
> 还可以使用`BitSet.set(int1, int2, Boolean)`来把<b style="color:red">`int1`【包括】到`int2`【不包括】指定位</b>的值都设为<b style="color:red">参数`Boolean`</b>的值。

数组的索引标号从<b style="color:red">0到长度减1</b>。直接输出时，会输出标为1的位的序号。如：

```java
BitSet bit1 = new BitSet(16);
BitSet bit2 = new BitSet(16);
for (i = 0; i < 16; i++) {
            if (i % 2 == 0) bit1.set(i);// 0101 0101 0101 0101
            if (i % 3 == 0) bit2.set(i);// 1001 0010 0100 1001
}
System.out.println(bit1);
System.out.println(bit2);`
```

输出
`{0, 2, 4, 6, 8, 10, 12, 14}`
`{0, 3, 6, 9, 12, 15}`

`BitSet`中的方法如下：

| 方法名及参数                   | 返回值  | 描述                                                         |
| ------------------------------ | ------- | ------------------------------------------------------------ |
| `BitSet1.and(BitSet2);`        | void    | 两个`BitSet`进行逻辑**与**操作并赋值给BitSet1                |
| `BitSet1.or(BitSet2);`         | void    | 两个`BitSet`进行逻辑**或**操作并赋值给BitSet1                |
| `BitSet1.xor(BitSet2);`        | void    | 两个`BitSet`进行逻辑**异或**操作并赋值给BitSet1              |
| `BitSet1.andNot(BitSet2);`     | void    | 将BitSet1中指定的位设为0，“指定的位”是BitSet2中值为1的位     |
| `BitSet1.clear(int);`          | void    | 1. 将`int`参数指定的位的值设置为`false`<br />2. 如果没有参数，则把BitSet1的所有值都设置为`false`<br />3. 如果有两个`int`参数（`int1, int2`），则把从`int1`【包括】到`int2`【不包括】的值都设置成`false` |
| `BitSet1.flip(int);`           | void    | 将`int`参数指定位的值取反【`true`变`false`，`false`变`true`】<br />如果有两个`int`参数（`int1, int2`），则把从`int1`【包括】到`int2`【不包括】的值都取反 |
| `BitSet1.cardinality();`       | int     | 返回BitSet1中值为`true`的位的数量                            |
| `BitSet1.length();`            | int     | 返回BitSet1的位的数量                                        |
| `BitSet1.size();`              | int     | 返回BitSet1占用的实际物理空间大小                            |
| `BitSet1.nextClearBit(int)`    | int     | 从参数`int`开始返回第一个值为`false`的索引                   |
| `BitSet1.nextSetBit(int)`      | int     | 从参数`int`开始返回第一个值为`true`的索引                    |
| `BitSet1.equals(BitSet2);`     | Boolean | 判断两个`BitSet`各个位的是否完全相同                         |
| `BitSet1.intersects(BitSet2);` | Boolean | 判断两个`BitSet`中**值为`true`的位**是否有交集               |
| `BitSet1.isEmpty();`           | Boolean | 判断BitSet1中是否有**值为`true`的位**                        |
| `BitSet1.get(int);`            | Boolean | 返回BitSet1中`int`参数指定的位的值                           |
| `BitSet1.get(int1, int2);`     | BitSet  | 以BitSet的形式，返回BitSet1中从`int1`【包括】到`int2`【不包括】的值 |
| `BitSet1.clone();`             | Object  | 复制BitSet1<br /><b style="color:red">⚠注意返回值是Object，若赋值给另一个`BitSet`对象需要强制转换，即`(BitSet)`BitSet1.clone();`</b> |
| `BitSet1.toString();`          | String  | 输出`BitSet`的字符串形式                                     |

## 修饰词

1. static

   实例方法：没有static的变量和方法。在定义对象时一般绑定于该对象，不与其他对象共享，通常用**对象名.变量名**和**对象名.方法名**调用。
   静态方法：由static修饰的变量和方法。由定义的所有对象共享，可以直接利用**类名.变量名**和**类名.方法名**调用，不建议使用对象名调用。

   示例：java.lang.Math类【这里的方法都是静态方法，因此无需实例化即可使用。】

2. 可见性修饰符：public/private/protected

   + 缺省：**同包内的任意类**均可访问
   + public：**任意包的任意类**均可访问
   + private：只能在**本类**访问

   | *访问权限符*（修饰变量和方法） | *访问权限类型*         | *变量和方法权限对比*                            | *子类继承权限对比*                        |                 |
   | ------------------------------ | ---------------------- | ----------------------------------------------- | ----------------------------------------- | --------------- |
   | private                        | 私有变量和私有方法     | 类外不能使用                                    | 不能继承                                  | 最严格  ”私有“  |
   | 不加访问权限符                 | 友好变量和友好方法     | <b style="color:red">同包的类</b>可以使用       | <b style="color:red">同包的类</b>可以继承 | 默认情况 ”同包“ |
   | protected                      | 受保护变量和受保护方法 | <b style="color:red">同包的类和子类</b>可以使用 | <b style="color:red">任何类</b>均可以继承 | 最复杂          |
   | public                         | 共有变量和共有方法     | 类内外均可使用                                  | <b style="color:red">任何类</b>均可以继承 | 最开放  ”任意“  |

   - public类（共有类）可以在<b style="color:red">任意</b>类创建对象
   - 权限符缺省的类（友好类）只能在<b style="color:red">同包</b>的类里面创建对象
   - private和protected不能修饰类
   - ⚠访问修饰符不能用在<b style="color:red">局部变量</b>上
   

   |               | **本类** | **本包** | **子类** | **其他包** |
   | ------------- | :------: | :------: | :------: | :--------: |
   | **public**    |    ✅     |    ✅     |    ✅     |     ✅      |
   | **protected** |    ✅     |    ✅     |    ✅     |     ❌      |
   | **default**   |    ✅     |    ✅     |    ❌     |     ❌      |
   | **private**   |    ✅     |    ❌     |    ❌     |     ❌      |

1. final

   final可以修饰类，方法和变量。

   - final类不可被继承，即不能有子类
   - final方法不能由子类覆盖
   - final变量即常量，定义后不可被修改


## 封装

推荐将变量设置为私有变量，使用方法读取和修改对象数据(get&set)。
优点：保护数据，使得类更容易维护。

```java
private int age;

public int getAge() {//访问器（读）
    return age;
}

public void setAge(int age) {//修改器（写）
    this.age = age;
}
```

变量无法更改的类被称为永久类，创建的对象被称为永久对象。
⚠*私有变量没有set修改器*的类不一定是永久类。

方法在将对象作为自己的参数时，引用的是地址而不是值，因此在方法内对形参对象进行改变会造成方法外实参对象的改变。但利用形参对象重新实例化则不会对实参对象造成影响。（与数组的引用类似【方法引用数组并修改形参数组的元素，会影响到方法外的实参数组的元素】。）

## 枚举类

枚举类可以在类内定义，也可以在类外，还可以单独形成一个枚举类文件。定义时需要使用关键词enum。

```java
enum Animal {
    Dog, Cat, Fish;//枚举类中的常量【枚举常量】
}
```

枚举可以作为数据类型，定义**枚举变量**。它的值是枚举类的一个**枚举常量**。

```java
Animal A1 = Animal.Cat;
System.out.println(A1+"s eat fish.");//Cats eat fish.
```

枚举变量的方法：

1. 类名.values() 返回枚举类的所有值 
2. 类名.valueOf("枚举常量字符串") 将字符串转换为枚举常量 
   如Animal.valueOf("Cat")返回Cat
3. 枚举变量.ordinal() 返回枚举变量的值（枚举常量）所对应的序号 
   如Cat.ordinal()返回1

```java
//可以利用for循环语句或switch语句调用
for(Animal ani : Animal.values()){
    System.out.println(String.valueOf(ani.ordinal())+". "+ani+" is a kind of animal.");
    switch(ani){
        case Cat:System.out.println("They eat fish.");break;
        case Dog:System.out.println("They eat meat.");break;
        case Fish:System.out.println("They eat shrimps.");break;
    }
}
```

这一段程序会输出

> 0. Dog is a kind of animal.
> They eat meat.
> 1. Cat is a kind of animal.
> They eat fish.
> 2. Fish is a kind of animal.
> They eat shrimps.

[返回上一页](java.md)