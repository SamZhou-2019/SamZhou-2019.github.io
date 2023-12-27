# 六、数组

数组是可以表示一组具有相同数据类型的结构。创建数组时需要**指定数组的长度和数据类型**。

数组本身为引用数据类型，存储的数据可以是基本数据类型，也可以是引用数据类型。

```java
double[] student = new double[20]; // 不推荐使用 double student[]
/*数组一旦生成，其长度不可改变。*/
```

数组的长度可以利用`.length`来得到（例如，在遍历未知长度的数组时可以使用）。如上例中生成的student的长度为20：`student.length;` 。注意：

1. ⚠`length`不是方法，不能写作`.length()`。
2. ⚠没有初始化的数组不能使用length【编译时报错】。被初始化为null(如`int[] a = null`)时也不能使用`length`【报错NullPointerException】。
2. ⚠若引用的下标超出数组的长度，则会在运行时报错：ArrayIndexOutOfBoundsException（编译时不报错）。

### 数组创建时的缺省值

| 类型   | byte | short | int  | long | float | double | boolean | char   | Object（如String） |
| ------ | ---- | ----- | ---- | ---- | ----- | ------ | ------- | ------ | ------------------ |
| 缺省值 | 0x00 | 0     | 0    | 0L   | 0.0F  | 0.0    | false   | \u0000 | null               |

## 定义、创建、初始化数组

### 动态初始化：一维数组

```java
/*声明*/
byte[] a;// ⚠️声明数组时方括号内不允许指定数组长度
// 也可以使用这种方式：byte a[]; 等同于上面的语句，但推荐使用上面的语句

/*开辟空间*/
a = new byte[5];

/*声明和开辟空间也可以二合一，即：*/
byte[] a = new byte[5];

/*为数组分配元素*/
a[0] = 0x8a;
/*	a	[0]		[1]		[2]		[3]		[4]
 *		0x8a	0x00	0x00	0x00	0x00 */
```

### 静态初始化：一维数组

```java
// 创建数组的同时分配元素，元素数即数组的长度
double[] price = new double[]{3.50, 15.35, 4.65};// ⚠️注意：静态初始化时，不能指定数组长度
double[] price; price = new double[]{3.50, 15.35, 4.65}; // 等同于上面的语句
double[] price = {3.50, 15.35, 4.65}; /* 等同于上面的语句，但是不能单独给数组名赋值。错误用法：
double[] price;
price = {3.50, 15.35, 4.65};
但是可以为各个元素单独赋值，如 price[0] = 3.50; */

char[] ch = { 'a', 'b', 'c', 'd' };
int[] integar = { 1, 2, 3 };
```

### 动态初始化：二维数组

```java
float[][] b;
b = new float[3][4];// 也可以写作float[][] b=new float[3][4];
print(b); // 此语句输出的是b的地址
```

### 静态初始化：二维数组

```java
int[][] x = new int[][]{{1},{2,3,4},{5,6,7,8,9},{10,11}};
// 第二维的数组长度可以不一样。也可以省略new int[][]，如下：
int[][] x = {{1},{2,3,4},{5,6,7,8,9},{10,11}};
```



### 长度不同的二维数组

```java
float[][] c; //定义：数据类型[][] 数组名; 或 数据类型 数组名[][] ;
c = new float[2][];
c[0] = new float[5];
c[1] = new float[3];
System.out.println(c.length);// array.length数组长度
// c.length = 2, c[0].length = 5
```

## 数组的引用

```java
// 字符型数组引用数组名会输出整个数组
char[] ch = { 'c', 'h', 'a', 'r', 'a', 'c', 't', 'e', 'r' };
System.out.println(c);
// 数字型数组引用数组名会输出地址
int[] a = { 1, 2, 3 };
System.out.println(a);
// 将数组和字符串并置可以输出数组地址
System.out.println("c:" + c);
// ⚠方法引用数组并修改形参数组的元素，会影响到方法外的实参数组的元素
public static void test (int[] a1, char[] a2){
    a1[0] = 3;// 这一步会影响到方法外的数组
    a2 = new int[]{'x', 'i', ' ', 'a', 'n'};// 这一步则不会
}
// 方法也可以返回数组
public static int[] test(int[] list){
    return list;
}
test(new int[]{ 3, 4, 5 });// 没有赋给任何变量的数组被称为匿名数组
```

## 数组的复制

先来看一个❌错误的方法：

> ```java
> int[] a = { 1, 2, 3 };
> int[] b = { 4, 5 };
> b = a;// 利用数组名直接赋值，只会改变地址而不是数组本身
> ```
> > a -> "{1,2,3}"	b -> "{4,5}"
> > 进行a = b赋值后的状态：
> > a -> "{4,5}" <- b
> > "{1,2,3}"所在的空间垃圾回收
> > 此时`a==b`为`true`
>
> 有关垃圾回收的内容见【对象的复制】。

✅正确的方法：

1. 使用循环

   ```java
   int[] b = new int[a.length]; // 重新定义一个长度相同的数组
   for(int i=0; i<a.length; i++) b[i] = a[i];
   ```

2. `System.arrayCopy`(原数组，原数组起始位置，目标数组，目标数组起始位置，复制元素数量)

   ```java
   System.arrayCopy(a,0,b,0,3);
   ```

## bonus!

### jvm的内存区域

![jvm](imgs\jvm.png)

JAVA虚拟机jvm在运行java程序时，会从电脑的运行内存中分配空间。

以执行下面的代码为例，在jvm中大致的步骤如下

```java
public class Demo2{
	public static void main(String[] args){
		int num=10;
		int[] arrs1=null;
		double[] arrs2=new double[5];
		arrs2[0]=12.5;
		int[] arrs3={2,5,7};
	}
}
```

1. 对main方法所在的类进行加载，并存储在**方法区**。
2. main方法入栈【在**虚拟机栈**中分配一块区域，用于当前方法的局部变量占用】
3. 执行main方法
   - 局部变量的空间都在**虚拟机栈**开辟
   - 基本数据类型的值存入**虚拟机栈**，如`int num=10;`
   - 引用数据类型中的值存入**堆内存**（数组的空间在堆内存，其它引用数据类型可以在堆内存，也可能在其它区域），**虚拟机栈**存储地址。只要见到new关键字肯定会在**堆内存**开空间。
     如`int[] arrs1=null;`是在虚拟机栈存入一个`null`，此时不会在堆内存开空间；`double[] arrs2=new double[5];`是在虚拟机栈存入数组开头的地址，而在堆内存开辟5个double空间。
     二维数组则在虚拟机栈存储整个数组的地址，在堆内存开辟{第一个下标}个内存并存储第二维的各个数组的地址（若未制定第二维的个数，如`a[3][];`，则第二维的地址默认为null）。

### 数组的排序

Java中的列表排序函数：`Arrays.sort();`

```java
Arrays.sort(nums);
```

### 数组的扩容

给定一个数组，若要对数组进行扩容，参考*数组的复制*一节，不能直接赋值，需要新建另一个数组作为中介：

```java
// 任务：扩容arrs并增加一个元素a
int[] arrs = {1,2,3,4};
int a = 5;
// 1.新建一个比arrs长的数组newArrs
int newArrs[] = new int[arrs.length+1];
// 2.逐个赋值
for(int i=0;i<arrs.length;i++) newArrs[i]=arrs[i];
// 3.将新数组的地址赋值给原数组，即扩容完成
arrs=newArrs;
arrs[4]=a;
```

### 数组的反转

```java
public class Demo{
    public static void main(String[] args){
        /* 方法1 新建一个数组，反向赋值 */
        int[] arrs = {1,2,3,4,5};
        int[] newArrs = new int[arrs.length];
        for(int i = 0;i<arrs.length;i++){
            newArrs[i] = arrs[arrs.length-1-i];
        }
        for(int i = 0;i<arrs.length;i++){
            System.out.println(newArrs[i]);
        }

        /* 方法2 定义一个临时的变量，首尾互换 */
        int[] arrs = {1,2,3,4,5,6};
        int temp;
        for(int i = 0;i<(int)(arrs.length/2);i++){
            temp = arrs[i];
            arrs[i] = arrs[arrs.length-1-i];
            arrs[arrs.length-1-i] = temp;
        }
        for(int i = 0;i<arrs.length;i++){
            System.out.println(arrs[i]);
        }
    }
}
```

### 数组的二分排序

```java
public class Demo{
    public static void main(String[] args){
        /* 数组的二分查找 要求数组必须按大小排序。 */
        int[] arrs = {2,3,4,6,7,9,11,13,16};
        int bgn = 0;
        int end = arrs.length-1;
        int mid = (bgn + end) / 2;
        int target = 9;

        while(bgn <= end){
            mid = (bgn + end) / 2;
            if (arrs[mid] > target) end = mid - 1;
            else if (arrs[mid] < target) bgn = mid + 1;
            else if (arrs[mid] == target) {
                System.out.printf("已搜索到，在第%d位",mid+1);
                System.exit(0);
            }
        }
        System.out.println("需要搜索的数据不在数组中。");
    }
}
```

### 数组的冒泡排序

```java
public class Demo{
    public static void main(String[] args){
        /* 数组的冒泡排序 */
        int[] arrs = {5,3,8,6,1,4};
        int temp;
        for(int i = 0;i < arrs.length-1;i++){
            for(int j = 0;j < arrs.length-1-i;j++){
                if (arrs[j] > arrs[j+1]){
                    temp = arrs[j+1];
                    arrs[j+1] = arrs[j];
                    arrs[j] = temp;
                }
            }
        }

        /* 两两比较，大的在后面
         5 3 8 6 1 4 -> 3  5  6  1  4 $8$
         3 5 6 1 4 # -> 3  5  1  4 $6$ #
         3 5 1 4 # # -> 3  1  4 $5$ #  #
         3 1 4 # # # -> 1  3 $4$ #  #  #
         1 3 # # # # -> 1 $3$ #  #  #  # */

        for(int i = 0;i < arrs.length;i++){
            System.out.println(arrs[i]);
        }
    }
}
```

### 数组的简单选择排序

```java
public class Demo{
    public static void main(String[] args){
        /* 数组的简单选择排序：每次选择最大的一个数，放在数组末尾，并暂时排除该数 */
        int[] arrs = {23,62,85,27,46,74,41};
        int temp;
        int max;
        int max_index;
        for(int i = 0;i < arrs.length;i++){
            max = arrs[0];
            max_index = 0;
            for(int j = 0;j < arrs.length-i;j++){
                if(arrs[j] > max){
                    max = arrs[j];
                    max_index = j;
                }
            }
            if(max_index != arrs.length-1-i){
                temp = arrs[max_index];
                arrs[max_index] = arrs[arrs.length-1-i];
                arrs[arrs.length-1-i] = temp;
            }
        }

        for(int i = 0;i < arrs.length;i++){
            System.out.println(arrs[i]);
        }
    }
}
```





[返回上一页](java.md)