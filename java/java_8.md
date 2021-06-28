# 八、字符串和文件

## 字符串

```java
String message = new String("I drink coffee.");//正式初始化方法，注意S大写
String messageNew = "I drink tea";//快速格式化方法
//String(StringA, int1, int2)构造方法：从字符串StringA提取【从int1开始，共int2个字符】的字符串
messageNew = "Coffee对身体不好。";//字符串是一个对象，内容不可改变。尝试重新赋值只会创建一个新的字符串对象，而原有的字符串对象则被垃圾回收机制清理。

System.out.println(messageNew.length());
//在Java中字符串由Unicode储存，中英文字符长度均为1。
//注意⚠这里的length是一个方法，因此结尾有括号。（数组的length是一个变量，因此不需要括号）
System.out.println(messageNew.charAt(8));//提取字符串中的某个元素
//索引为0至长度减1。⚠注意不能用中括号messageNew[8]
```

### 字符串的修改

```java
//字符串连接：concat和+加号，可以连用concat和加号
System.out.println(message.concat(messageNew).concat("\nOK, I drink tea."));
System.out.println(messageNew+"\n"+message);

//提取子串
System.out.println(messageNew.substring(6,9));//从a到b不包括b
System.out.println(messageNew.substring(6));//从a到末尾
//.getChars(int1, int2, Char[], int3) 将字符串从int1到【int2-1】的部分
//存放在指定字符数组【Char[]】，从指定位置【int3】开始（无返回值）
//.toCharArray() 将字符串转化为字符数组并返回

//比较字符串内容
System.out.println(message.equals(messageNew));//内容是否相等，返回布尔值
//⚠ message==messageNew比较的是字符串变量存储的地址。
System.out.println(message.compareTo(messageNew));//按照Unicode值比较字符串，返回一个值：=0说明相等，>0说明前者大于后者，<0说明后者大于前者
//.compareToIgnoreCase() 不区分大小写进行比较
//.startsWith(String) 判断是否以特定字符串开始
//.endsWith(String) 判断是否以特定字符串结束
//.contains(String) 判断是否包含特定字符串

//修改字符串
System.out.println(message.toLowerCase());//转换为小写字母
System.out.println(message.toUpperCase());//转换为大写字母
//trim()：去掉头尾的空格
System.out.println(message.replace("coffee", "wine"));
//replace(oldChar, newChar)：将字符串中的 oldChar 用 newChar 来代替
//oldChar 也可以用正则表达式
//replaceAll 全部替换 replaceFirst 从左到右查找，只替换第一个

//查找字符或子串
//indexOf(char/String,index)：从前向后查找
//lastIndexOf(char/String,index)：从后向前查找
//这两个方法中index可省略。若指定index，则从index指定的位置开始查找
//如果找不到，则返回 -1
System.out.println(message.indexOf("coffee"));
//String.match(regex) 判断字符串是否与regex正则字符串相符，返回一个布尔值

//将字符和数字转换为字符串
System.out.println("咖啡的价格是￥"+String.valueOf(50));

//根据正则表达式拆分字符串为字符串数组
System.out.println(message.split(" ")[2]+"\n"+message.split(" ")[1]);
```

### 字符串缓冲区

```java
StringBuffer buff = new StringBuffer(40);
//构造时默认长度为16（无参构造），可定义长度。此时为空缓冲区
//参数为字符串时，生成字符串+长度16空的缓冲区
buff.append("I love Sundae");//append方法追加内容，可追加基本数据类型，字符串及缓冲区
//可以以基本数据类型作为参数，append方法会自动将参数转化为字符串并追加
buff.append(", a kind of ice cream").append(", very much.");//支持连写
buff.insert(13,"***");//insert方法可以指定字符串追加的位置
buff.reverse();//reverse方法翻转字符串缓冲区的字符串
buff.delete(6,13);//delete方法删除一段字符串，范围是从前一个参数到后一个参数【不包括】
buff.replace(2,6,"!");//replace方法替换一段字符串为指定的另一段字符串，，范围是从前一个参数到后一个参数【不包括】
String str = buff.toString();//转为字符串
System.out.println(str);
System.out.println(buff.charAt(3));//chatAt方法返回字符串缓冲区的【参数指定的位置】的字符

//字符串与数值的转换
Integer.parseInt("123"); //123 String->int
//Double.parseDouble String->Double
String.valueOf(123); //"123" int->String
```

### 字符串分析器🎈

```java
StringTokenizer st1 = new StringTokenizer("too simple sometimes naïve");
//第一种构造方法：将字符串按照空白字符进行分割
StringTokenizer st2 = new StringTokenizer("伟大斗争、伟大工程、伟大事业、伟大梦想","、");
//第二种构造方法：将第一个字符串按照【第二个字符串中各符号的任意匹配】进行分割
System.out.println(st1.countTokens());//输出分割后的字符串数量
System.out.println(st1.nextToken());//输出分割后的下一个字符串，同时内置计数器加1，通常用于循环语句
System.out.println(st1.hasMoreTokens());//判断是否还有下一个字符串
```

### 正则表达式🎈

| 表达式       | 含义                                                     |
| ------------ | -------------------------------------------------------- |
| .            | 任何一个字符                                             |
| \d           | 一个数字【相当于[0-9]】                                  |
| \D           | 一个非数字字符                                           |
| \s           | 一个空格字符【[ \t\n\x0B\f\r]】                          |
| \S           | 一个非空格字符                                           |
| \w           | 一个字符【包含数字、大小写字母、下划线，即[a-zA-Z_0-9]】 |
| \W           | 除\w外的其它字符                                         |
| [abc]        | a，b或c                                                  |
| [^abc]       | 除a，b或c的其它字符                                      |
| [a-g&&[d-m]] | [a-g]和[d-m]的交集[d-g]                                  |
| [a-z&&[d-m]] | [a-z]减去[d-m]的集合                                     |
| [a-d[g-m]]   | [a-d]和[g-m]的并集                                       |

| 表达式     | 含义                                      |
| ---------- | ----------------------------------------- |
| \p{Lower}  | 小写字母：[a-z]                           |
| \p{Upper}  | 大写字母：[A-Z]                           |
| \p{ASCII}  | 所有  ASCII：[\x00-\x7F]                  |
| \p{Alpha}  | 字母                                      |
| \p{Digit}  | 数字： [0-9]                              |
| \p{Alnum}  | 字母和数字                                |
| \p{Punct}  | 标点符号：!#$%&"()*+,-./;<=>?@[]\^_~{}\|` |
| \p{Graph}  | 可见字符：[\p{Alnum}\p{Punct}]            |
| \p{Print}  | 可打印字符：[\p{Graph}\x20]               |
| \p{Blank}  | 空格或制表符                              |
| \p{Cntrl}  | 控件字符：[\x00-\x1Fx7F]                  |
| \p{XDigit} | 十六进制数字： [0-9a-f-F]                 |
| \p{Space}  | 空格字符：[  \t\n\x0B\f\r]                |

| 表达式  | 含义                                                         |
| ------- | ------------------------------------------------------------ |
| X       | 字符x                                                        |
| \\\\    | 反斜杠字符                                                   |
| \\0n    | 八进制值0n的字符 （0 <= n <= 7）                             |
| \0nn    | 八进制值0nn （0 <= n <= 7）                                  |
| \\0mnn  | 八进制值0mnn（0 <= m <= 3，0 <= n <= 7）                     |
| \xhh    | 十六进制值0xhh的字符                                         |
| \uhhhh  | 十六进制值0xhhhh的字符                                       |
| \xh...h | 十六进制值0xh...h 的字符<br />(Character.MIN_CODE_POINT  <= 0xh...h <=  Character.MAX_CODE_POINT) |
| \t      | 制表符 （\u0009)                                             |
| \n      | 换行字符（\u000A)                                            |
| \r      | 回车字符 （\u000D)                                           |
| \f      | 表单馈送字符 （\u000C)                                       |
| \a      | 警铃字符（\u0007)                                            |
| \e      | 转义字符 （\u001B)                                           |
| \cx     | 对应于 x 的控件字符                                          |

| 表达式 | 含义                    |
| ------ | ----------------------- |
| ^      | 行的开头                |
| $      | 行的末尾                |
| \b     | 单词边界                |
| \B     | 非单词边界              |
| \A     | 输入的开头              |
| \G     | 上一个匹配的结束        |
| \Z     | 最终的终止符（如果有）  |
| \z     | 输入的末尾              |
| X?     | X，一次或没有           |
| X*     | X，多次或没有           |
| X+     | X，一次或多次           |
| X{n}   | X，正好n次              |
| X{n,}  | X，至少n次              |
| X{n,m} | X，至少n次，但不超过m次 |

## 文件与输入输出

```java
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

public class file_test {
    public static void main(String[] avgs) throws IOException {
        File f = new File("test.txt");
        if (!f.exists()) {//判断文件是否存在
            //f.mkdir();//创建文件夹(目录)
            f.createNewFile();//创建文件
            /*File
            exists()    文件或目录是否存在
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
        pw.print("test");//写入数据，可使用print,printf,println
        pw.close();//及时关闭写入对象
        Scanner sn = new Scanner(f);
        String a=sn.nextLine();//读取下一行
        /**Scanner
         * next()    读入字符串
         * hasNext()    boolean,是否有输入
         * nextByte(),nextInt(),nextShort(),
         * nextDouble(),nextFloat(),nextLong()    读入相应类型数据
         * useDelimiter(String)    设置分隔符
         */
        sn.close();//及时关闭读取对象
        System.out.println(a);
    }
}
```

[返回上一页](java.md)