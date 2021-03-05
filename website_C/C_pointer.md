# 学习笔记-C语言的指针

C语言的指针既难理解又麻烦，很多东西我也理解不了。

以下程序写于2018年10月，整理与解释于2020年10月初。

## 形参&实参

这个程序中的swap函数当中的形参为指针。使用该函数时，需要传入地址作为实参。

```C
#include <stdio.h> 

void swap(char *px,char *py)//形参为指针
{
	char *p;
	p=*px;*px=*py;*py=p;//中间指针不加星号
}

int main()
{
    char *p1,*p2;
    char a,b;
	for(;;)
    {
        scanf("%d",&a);//输入一个大于0的整数a
        if(a<0) break;//小于零就退出
        b=a+2;
        p1=&a;//指针p1指向地址a
        p2=&b;//指针p2指向地址b
        printf("'%c'\n'%c'\n",a,b);//输出整数a，b对应的ASCII码
        swap(p1,p2);//调用函数，实参为指针p1，p2
        printf("'%c'\n'%c'\n",a,b);//可以发现p1和p2指向的空间，即a和b，里面的数据已经被交换
	}
	return 0; 
}
```

C语言当中，如果传入函数的是一个变量，则处理的仅仅是这个变量的“复制品”，而不改变变量本身。（如下方程序，函数swap仅仅是改变了被赋值的px和py。函数执行完毕后，a和b并未发生改变）。如使a和b发生改变，则应使用上方程序的方法。

```c
#include <stdio.h> 

void swap(char px,char py)//形参为指针
{
	char p;
	p=px;px=py;py=p;//中间指针不加星号
}

int main()
{
    char a,b;
	for(;;)
    {
        scanf("%d",&a);//输入一个大于0的整数a
        if(a<0) break;//小于零就退出
        b=a+2;
        printf("'%c'\n'%c'\n",a,b);//输出整数a，b对应的ASCII码
        swap(a,b);//调用函数，实参为指针p1，p2
        printf("'%c'\n'%c'\n",a,b);//可以发现p1和p2指向的空间，即a和b，里面的数据已经被交换
	}
	return 0; 
}
```

形参和实参的确不太好理解:sweat:

```c
#include<stdio.h>

void sort(int* e,int* r,int* t)
{
    int temp;
    if(*e>*r) {temp=*e;*e=*r;*r=temp;};
    if(*e>*t) {temp=*e;*e=*t;*t=temp;};
    if(*r>*t) {temp=*t;*t=*r;*r=temp;};
    printf("%d %d %d\a",*e,*r,*t);
}

int main()
{
    int a,b,c;
    scanf("%d%d%d",&a,&b,&c);
    int *p,*q,*s;
    p=&a;
    q=&b;
    s=&c;
    m(p,q,s);
    return 0;
} 
```

## 数组名也是一种指针

数组名是指向数组第一个元素的指针，如在下面的程序中，a即&a[0]。而要读取后面的元素，只需读取指针向后移动之后的地址，如在下面的程序中，a[5]即\*(a+5)。

```c
#include <stdio.h>

void main()
{
	char *u;
	char a[10]={'a','s','d','f','g','h','j','k','p','l'};
	u=&a;//将u指向数组a的第一个元素
	for(;u<(a+10);)
	{
        sleep(1);//间隔一秒输出
        printf("%c\t",*u++);//将u向后移动即可读取a的后续元素
	}
}
```

注意\*(u+i)和\*u+i的区别。
\*u+i的运算顺序是先取指针u的值，再将该值与i相加。

```c
#include <stdio.h>

void main()
{
    float *u;
    int i;
    int a[]={};
    u=&a[0];
    for(i=0;i<10;i++)
    {
        printf("%f\t",*u+i);//c[0]+i
        printf("%f\t\n",*(u+i));//依次输出c[0]-c[9]
    }
    putchar("\n");
    return 0;
}
```

作为指针的数组名同时也可以作为实参，传入到形参包含数组的函数中。函数的操作会影响实际的数组。如在下面的程序中，函数reverse会使得数组a发生改变。

```c
#include <stdio.h>

void reverse(int x[],int n)
{
    int i,t;
    for(;i<n/2;i++) 
    {
        t=x[i];
        x[i]=x[n-i-1];
        x[n-1-i]=t;}
}

int main()
{
    int a[10]={1,2,3,4,5,6,7,8,9,10};
    int i;int *b;
    for(i=0;i<10;i++) printf("Before reserve:%d\t",a[i]);
    printf("\n");
    b=a;
    reverse(b,10);
    for(i=0;i<10;i++) printf("After reserve:%d\t",a[i]);
    printf("\n\a");
    return 0;
}
```

而在二维数组中，需要使用两次\*运算符才能正确读取数据，否则读取的是地址。如在下面的程序中\*(\*(a+i)+j)指的是a\[i\]\[j\]，而\*(a+i)+j指的是&a\[i\]\[j\]。这是因为二维数组是“一维数组的数组”，你可以理解成是“数组的嵌套”，“数组套数组”。

```c
#include <stdio.h>

int main()
{
    int a[3][3]={{20,80,70},{30,40,50},{90,60,10}};
    int i,j;
    for(i=0;i<3;i++) 
    {
        for(j=0;j<3;j++) 
        {
            printf("%d\t",*(*(a+i)+j));//输出值
        }
        printf("\n");
    }
    for(i=0;i<3;i++) 
    {
        for(j=0;j<3;j++) 
        {
            printf("%d\t",*(a+i)+j);//输出地址
        }
        printf("\n"); 
    }
return 0;
}
```

## 指向数组的指针

可以用一个数组类型的指针指向数组。跟单个元素类型（如int \*a）不同的是，指针的内容是一个数组。它实质上是定义了一个指针，后面的中括号相当于在这个地址上向后移动的位数，相当于\*(a+i)。

```c
#include <stdio.h>

int main()
{
    int c[3]={5,4,1}; 
    int (*a)[3];
    a=&c;
    printf("%d  %d  %d",(*a)[0],(*a)[1],(*a)[2]); 
/*	 a     a+1    a+2
	 |     |      |
	\|/   \|/    \|/
	 c[0]  c[1]   c[2]    */
    return 0;
}
```

## 指针的数组

你可以把它理解成定义了一组指针，每一个指针指向数组对应的元素。

字符串名本身也是一个指针，因为字符串在C语言中就是一个字符数组。

```c
#include <stdio.h>
int main()
{
    char *p[5]={"app","odd","age","dog","kid"};//定义指针字符串
/*	p[0]->"app"
	p[1]->"odd"
	p[2]->"age"
	p[3]->"dog"
	p[4]->"kid"  */
    char *temp;
    temp=p[2];
    p[2]=p[3];
    p[3]=temp;//运算时不加星号 
    printf("%s",p[3]);//输出时不加星号 
    return 0;
}
```

## 指向函数的指针

函数也有指针！你可以直接给一个指针赋值，这个指针不需要初始化，赋的值就是函数名。使用时直接用\*运算符和实参组合即可。如下面的程序中(\*w)(p,q)，w就是一个函数指针。

```c
#include <stdio.h>

int min(int x,int y)
{
    int z;
    if(x<y) z=x;
    else  z=y;
}

int max(int x,int y)
{
    int z;
    if(x>y) z=x;
    else z=y; 
}

int sum(int x,int y)
{
    int z;
    z=x+y; 
}

int main()
{
    int p=15,q=16;
    char a;
    a=getchar();
    if(a=='0')
        w=max;//*w-->max
    else if(a=='1')
        w=min;//*w-->min
    else w=sum;//*w-->sum
    printf("%d",(*w)(p,q));
    return 0;
}	
```

## 返回指针的函数

这个是返回一个指针，不要和上面的搞混了！

定义函数时，可以把返回值定义为一个指针

```c
#include <stdio.h> 

int *p(int (*r)[4],int i)//注意这里的第一个形参。二维数组是数组套数组，同样数组名是指针套指针。这里int (*r)[4]是在二维数组中一个指向同一维度四个元素的数组的指针。
{
	int *s;
	s=(r+i);
	return(s);
}

int main()
{
    int c[3][4]={{6,3,2,5},{6,7,9,2},{9,5,4,1}}; 
/*    6 3 2 5  i=0
      6 7 9 2  i=1
      9 5 4 1  i=2 */ 
    int *a;
    a=p(c,1);
/*    6 3 2 5  i=0
 a-> [6 7 9 2] i=1
      9 5 4 1  i=2 */ 
    printf("%d\t%d\t%d\t%d\a",*a,*(a+1),*(a+2),*(a+3));
    return 0;
   } 
```

建议还是不要用这么麻烦的数组和指针:confounded:

## 指针与结构体

指针常常与结构体结合起来用于数据结构和算法编程。

```c
#include<stdio.h>
struct one
{
    int num;
    char word[50];
    int data;
    int *x;
}
int main()
{
    struct one a,b,c;
    struct one *p;
    (a.x)=&(b.num);
    (b.x)=&(c.num);
    (c.x)=NULL;
    scanf("%d%s%d",&a.num,&a.word,&a.data);
    scanf("%d%s%d",&b.num,&b.word,&b.data);
    scanf("%d%s%d",&c.num,&c.word,&c.data);
    p=&a;
    printf("%d\t%s\t%d\t",(*p).num,(*p).word,(*p).data);//这里结构体指针p指向的是结构体a
    return 0;
}
```

