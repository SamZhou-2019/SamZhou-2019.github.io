# 学习笔记-C语言的常用函数

## \#include\<ctype.h\>

####（以下函数，是则返回“真"，否则返回“假"）

isalnum(int)判断是否为字母或数字

isalpha(int)字母

isprint(int)可以打印的字符

iscntrl(int)控制字符(换页,接行,回车,水平制表符,垂直制表符,退格,警报)

isdigit(int)十进制数字

isgraph(int)除空格外可以打印的字符

ispunct(int)标点符号

isspace(int)空格字符（空格,换页,换行,回车,水平制表符,垂直制表）

isupper(int)大写字母

islower(int)小写字母

isxdigit(ins)十六进制数字

####（以下函数输出字符）

tolower(int)若为大写字母,输出小写字母

toupper(int)若为小写字母,输出大写字母

## \#include\<errno.h\>

> 一个整数初始化为0,程序运行正常时为0,错误时为一个非0整数

```C
errno\=0;
…
printf("errno\=%d",errno);
```

## \#include\<math.h\>

#### （三角函数单位为弧度）

acos(double) 反余弦

asin(double) 反正弦

atan(double) 反正切

atan2(double a,double b)反正切a/b

cos(double) 余弦

sin(double) 正弦

tan(double) 正切

cosh(double) 双曲余弦

sinh(double) 双曲正弦

tanh(double) 双曲正切

exp(double n) e的n次方

idexp(double a,int b) a\*2^b

frexp(double,int\*) 把浮点数分为一个2的整数幂和一个小数，整数存在指针指向的位置

log(double) 自然对数

log10(double) 以10为底的对数

sqrt(double) 平方根

modf(double,double\*)把浮点数的整数部分存在指针指向的位置

pow(double a,double b) a^b

fabs(double) 绝对值

ceil(double) 向上取整（天花板）

floor(double) 向下取整（地板）

fmod(double x,double y) 计算商为整数时x/y的浮点余数

## \#include\<stdio.h\>

remove(const char\*) 删除文件名为指针指向的字符串的文件

rename(const char\*,const char\*) 将文件名为前一个指针指向的字符串的文件的文件名改为后一个指针指向的字符串

tmpfile() 临时二进制文件，运行成功则返回临时文件，否则出错并返回NULL 这是一个指针

fclose(FILE\*) 关闭文件（成功返回0，否则返回EOF）

fopen(const char \*,const char\*) 打开文件名为前一个指针指向的字符串的文件，运行成功则返回文件。 这是一个指针。

```c
fp=fopen(fl,w);
/*后一个指针：
（有b的为二进制文件，否则为文本文件；若文件不存在，有w的会新建文件，否则出错并返回NULL）
r：只读 w：只写 a：追加 r+：读写 w+：读写 a+：追加读写
rb：只读 wb：只写 ab：追加 rb+：读写 wb+：读写 ab+：追加读写*/
```

fprintf(FILE\*, const char \*format, data) 将格式为format的数据data输出到指针指向的文件中去

> 格式：
> d,i 十进制整数（int） u 无符号十进制整数（unsigned int） o 无符号八进制整数 c字符
> x，X 无符号十六进制整数 f浮点数，小数形式（float） s字符串
> e，E浮点数，指数形式（float） g，G 选取e和f中较短的格式输出
> 以上符号与%中间加入：
> 正数（如%5.2f：输出右对齐至少五位，保留两位小数）
> 负数（如%-5.2f：输出左对齐至少五位，保留两位小数）
> l：为long或double；ll：为 long long \*；无效数据（不输入或输出任何数据）

```c
fprintf(fp,"%d,%c",a,b);
```

fscanf(FILE\*,const char\* format, data) 将指针指向的文件中格式为format的数据输入到参数data中去

```c
fscanf(fp,"%d,%c",a,b);
```

printf(const char \*format, data) 将格式为format的数据data输出到屏幕上

```c
fprintf("%d,%c",a,b);
```

scanf(const char\* format, data) 将格式为format的数据输入到参数data中去

```c
fscanf("%d,%c",&a,&b);
```

sprintf(char \*s, const char \*format, data)将格式为format的数据data输出到数组s中去，最后添加‘\0’

scanf(char \*s ,const char \*format, data)将指针指向的数组中格式为format的数据输入到参数data中去

fgetc(FILE \*) 向指针指向的文件读取下一个字符，返回int 

fputc(int c,FILE \*) 向指针指向的文件写入一个字符c 

fgets(char \*s,int n,FILE\*) 向指针指向的文件读取n-1个字符，写入到指针s指向的数组并返回s 这是一个指针

fputs(char \*s,FILE\*) 向指针指向的文件写入指针s指向的数组

getchar() 输入一个字符

gets() 输入字符串，直到换行

putchar(int) 输出一个字符

puts(char \*s) 输出字符串s

fread(char \*,int size,int count,FILE \*fp) 将数组a中大小为size的count组数据从指针指向的文件中读取出来

```c
fread(&a,sizeof(a),1,fp);
```

fwrite(char \*,int size,int count,FILE \*fp) 将数组a中大小为size的count组数据输出到指针指向的文件中

```c
fwrite(&a,sizeof(a),1,fp);
```

fseek(FILE\*,int a,int b) 读取指针指向的文件，位置为起始点向前移动a字节

> 起始点：b\=\=0：文件起始位置；b\=\=1：当前位置；b\=\=2：文件末尾位置

ftell(FILE\*) 获得当前的文件读取位置并返回该位置

rewind(FILE\*) 定位到文件的起始位置

clearer(FILE\*) 清除文件结束符和错误提示符

feof(FILE\*) 当文件设置了文件结束符时返回非0值

ferror(FILE\*) 若输入输出出现错误则返回非零值，否则返回0

## #include\<stdlib.h\>

#### （以下三个函数是将字符串转为指定格式）

> atoi(char\*) int
>
> atof(char\*) double
>
> atol(char\*) long int

rand() 返回伪随机数

calloc(unsigned int a, unsigned int b) 分配a个长度为b字节的空间，返回空间首地址 这是一个指针，如int \*a;a\=calloc(50,4);

malloc(unsigned int a) 分配a字节的空间，返回空间首地址 这是一个指针，如int \*a;a\=malloc(50);

realloc(char \*p, unsigned int b) 将p指向的空间大小改为b字节，如realloc(a,4);

free(char \*p) 释放p指向的空间，如free(a);

abort() 使程序异常终止

exit(int a) 使程序正常终止，a\=\=0表示程序运行正常，a!\=0表示程序运行不正常

system(char\*) 运行外部环境命令 e.g. system(“cls")（清除屏幕）

abs(int) 绝对值 labs(int)：格式为long int

div(int a,int b) a/b的整数商 ldiv(int a,int b)：格式为long int

## \#include\<string.h\>

strcpy（char\* s1,char\* s2） 将字符串s2复制到字符串s1中 e.g.strcpy(str1,str2)

memcpy (char\* s1,char\* s2,int n)或strncpy (char\* s1,char\* s2,int n) 将字符串s2复制n个字符到字符串s1中

memmove (char\* s1,char\* s2,int n) 将字符串s2复制n个字符到一个临时数组再复制到字符串s1中，效果同memcpy

strcat(char\* s1,char\* s2) 连接两个字符串

strncat (char\* s1,char\* s2,int n) 将字符串s2复制n个字符到字符串s1后面，后面加一个’\\0’

memcmp(char\* s1,char\* s2,int n)或strncmp(char\* s1,char\* s2,int n) 将字符串s1的前n个字符与字符串s2的前n个字符作比较，当s1的前n个字符大于，等于或小于s2的前n个字符时，输出一个大于，等于或小于0的整数

strcmp(char\* s1,char\* s2) 或strcoll(char\* s1,char\* s2) 将字符串s1与字符串s2作比较，当s1大于，等于或小于s2时，输出一个大于，等于或小于0的整数

memchr(char\* s,int c,int n) 确定c在字符串s的前n个字符中第一次出现的位置，返回该位置的指针。如没有则返回空指针。 这是一个指针。

strchr(char\* s,int c) 确定c在字符串s中第一次出现的位置，返回该位置的指针。如没有则返回空指针。 这是一个指针。

strpbrk(char\* s1,char\* s2) 确定字符串s2中任意字符在字符串s1中第一次出现的位置，并返回该位置的指针。如没有则返回空指针。 这是一个指针。

strstr(char\* s1,char\* s2) 确定字符串s2在字符串s1中第一次出现的位置，并返回该位置的指针。如没有则返回空指针。 这是一个指针。

memchr(char\* s,int c,int n) 把c的值复制到字符串s的前n个字符中并返回s。 这是一个指针。

strlen(char \*s) 计算字符串s的长度