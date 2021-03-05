# 六、数组

数组是可以表示一组具有相同数据类型的结构。

```java
double[] student = new double[20]; // 不推荐使用 double student[]
/*数组一旦生成，其长度不可改变。可以用*/student.length;/*来得到数组大小：20*/
// ⚠length不是方法，不能写作.length()
```

数组创建缺省值

| 类型   | byte | short | int  | long | float | double | boolean | char   | Object（如String） |
| ------ | ---- | ----- | ---- | ---- | ----- | ------ | ------- | ------ | ------------------ |
| 缺省值 | 0x00 | 0     | 0    | 0    | 0     | 0      | false   | \u0000 | null               |

## 定义、创建、初始化数组

```java
double[] price = new double[]{3.50, 15.35, 4.65};// 注意不能指定数组长度
double[] price = {3.50, 15.35, 4.65};
/* 不能单独给数组名赋值，错误用法：
double[] price;
price = {3.50, 15.35, 4.65};
但是可以为各个元素单独赋值*/
char[] ch = { 'a', 'b', 'c', 'd' };
int[] integar = { 1, 2, 3 };
```

### 一维数组

```java
byte[] a;// ⚠声明数组时方括号内不允许指定数组长度
a = new byte[5];// 为数组分配元素
a[0] = 0x8a;
/*	a	[0]		[1]		[2]		[3]		[4]
 *		0x8a	0x00	0x00	0x00	0x00 */
```

### 二维数组

```java
float[][] b;
b = new float[3][4];// 也可以写作float[][] b=new float[3][4];
```

### 长度不同的二维数组

```java
float[][] c;
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

```java
int[] a = { 1, 2, 3 };
int[] b = { 4, 5 };
b = a;// 利用数组名直接赋值，只会改变地址而不是数组本身
```

> a -> "{1,2,3}"	b -> "{4,5}"
> 进行a = b赋值后的状态：
> a -> "{4,5}" <- b
> "{1,2,3}"所在的空间垃圾回收

有关垃圾回收的内容见【对象的复制】。

1. 使用循环

   ```java
   int[] b = new int[a.length];
   for(int i=0; i<a.length; i++) b[i] = a[i];
   ```

2. `System.arrayCopy`(原数组，原数组起始位置，目标数组，目标数组起始位置，复制元素数量)

   ```java
   System.arrayCopy(a,0,b,0,3);
   ```

[返回上一页](java.md)