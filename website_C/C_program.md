# C语言案例

## 0. Hello, World!

   ```c
#include <stdio.h>

void main() {
    printf("%s", "Hello world!");
    getchar();
}
   ```

## 1. 输入一个数字(0~25)，返回对应的大小写字母。

   ```c
#include <stdio.h>
int main() {
    int n;
    printf("Please input a number between 0 and 25:");
    scanf("%d", &n);
    if (n >= 0 && n <= 25) {
        n = n + 65;
        printf ("UPPER_CHAR:%c\n", n);
        n = n + 32;
        printf ("lower_char:%c\n", n);
    } else
        printf("ERROR\x7");
    return 0;
}
/*关键词：ASCII*/
   ```

## 2. 辗转相除法计算最大公约数。

   ```c
#include <stdio.h>
int main() {
    int a, b, c, x, y;
    printf("请输入一个自然数：");
    scanf("%d", &a);
    printf("请输入另一个自然数：");
    scanf("%d", &b);
    x = a;
    y = b;
    for (;;) {
        c = a % b;
        if (c != 0) {
            a = b;
            b = c;
        } else
            break;
    }
    printf("最大公约数%d\t最小公倍数%d\a", b, x * y / b);
    return 0;
}
/*关键词：辗转相除法*/
   ```

## 3. 生成一个棋盘。

   ```c
#include <stdio.h>
int main() {
    int i, j;
    for (i = 1; i <= 8; i++) {
        for (j = 1; j <= 8; j++) {
            if ((i + j) % 2)
                putchar('\68'), putchar('\68');
            else
                putchar('\0'), putchar('\0');
        }
        putchar('\n');
    }
    return 0;
}
   ```

## 4. 输入十个数，判断最值和计算总和。

   ```c
#include <stdio.h>

int main() {
    int c[10] = {};
    int n, p, q, s, i;
    int min(int x, int y);
    int max(int x, int y);
    printf("请输入10个数字\n");
    for (n = 0; n <= 9; n++) {
        printf("请输入%d个数字：", n + 1);
        scanf("%d", &c[n]);
    }
    p = max(c[0], c[1]);
    q = min(c[0], c[1]);
    for (n = 0; n <= 9; n++) {
        printf("%d", c[n]);
        putchar('\t');
        s = s + c[n];
        p = max(c[n], p);
        q = min(c[n], q);
    }
    printf("\n最大值：%d\t最小值：%d\t总和：%d\a", p, q, s);
    return 0;
}

int min(int x, int y) {
    int z;
    if (x < y)
        z = x;
    else
        z = y;
    return z;
}

int max(int x, int y) {
    int z;
    if (x > y)
        z = x;
    else
        z = y;
    return z;
}
/*关键词：函数*/
   ```

## 5. 带有errno错误代码的自然对数。

   ```c
#include <errno.h>
#include <stdio.h>
#include <ctype.h>
#include <math.h>
int main() {
    double m, n, a;
    printf("请输入一个数。如果这个数符合条件，程序将返回它的自然对数：");
    scanf("%lf", &m);
    a = log(m);
    if (errno)
        printf("出现错误,错误代码为：%d", errno);
    else
        printf("%lf", a);
    return 0;
}
/*当输入的数为0或负数时，程序会返回错误代码34。关键词：errno.h*/
   ```

## 6. 输出$$\pi$$和e的倍数。

   ```c
#include <stdio.h>
#define PI 3.14159265358979323846
#define E 2.71828182845904523536

int main() {
    printf("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&\n");
    double i = 1.0, n;
    do {
        n = i * PI;
        printf("%-8.1f*PI=%24.16f\n", i, n);
        i++;
    } while (i <= 100);
    printf("PI OVER\n");
    printf("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&\n");
    getch();

    printf("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&\n");
    i = 1.0;
    do {
        n = i * E;
        printf("%-8.1f*E=%24.16f\n", i, n);
        i++;
    } while (i <= 100);
    printf("E OVER\n");
    printf("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&\n");
    getch();
    return 0;
}
/*关键词：宏定义，输出格式*/
   ```

## 7. 汉诺塔

   ```c
#include <stdio.h>

int hanoi(int n, char a, char b, char c) {
    if (n != 1) {
        hanoi(n - 1, a, c, b);
        printf("%c-->%c\n", a, c);
        hanoi(n - 1, b, a, c);
    } else
        printf("%c-->%c\n", a, c);
}

int main() {
    int m;
    {
        printf("请输入盘子的数量：\n");
        scanf("%d", &m);
        printf("移动%d个盘子的步骤：\a\n", m);
        hanoi(m, 'A', 'B', 'C');
    }
    return 0;
}
/*输入盘子的数量，输出盘子移动的步骤*/
   ```

   > 请输入盘子的数量：
   > 3
   > 移动3个盘子的步骤：
   > A-->C
   > A-->B
   > C-->B
   > A-->C
   > B-->A
   > B-->C
   > A-->C

## 8. 生成一个菱形

   ```c
#include <stdio.h>

int main() {
    int i, a;
    for (a = 1; a <= 4; a++) {
        for (i = 1; i <= 7; i++) {
            if (i > (4 - a) && i < (4 + a)) {
                putchar('*');
                putchar(' ');
            } else {
                putchar('\0');
                putchar('\0');
            }
        }
        putchar('\n');
    }
    for (a = 3; a >= 1; a--) {
        for (i = 1; i <= 7; i++) {
            if (i > (4 - a) && i < (4 + a)) {
                putchar('*');
                putchar(' ');
            } else {
                putchar('\0');
                putchar('\0');
            }
        }
        putchar('\n');
    }
    return 0;
}
/*i= 1 2 3 4 5 6 7
   a=1  (4-a) * (4+a)
   a=2      * * *
   a=3    * * * * *
   a=4  * * * * * * *
   a=3    * * * * *
   a=2      * * *
   a=1        *          */
   ```

## 9. 输出ASCII码表

   ```c
#include <stdio.h>

void main() {
    char c = '\0';
    char n;
    int x;
    for (x = 0; x <= 255; x++) {
        n = c + x;
        printf("%d:", n);
        putchar(n);
        putchar('\n');
    }
}
   ```

## 10. 利用ctype.h判断输入字符的类型

```c
#include <stdio.h>
#include <ctype.h>

int main() {
    char c;
    for (; c != '\'';) {
        printf("输入一个字符，输入单引号\"\'\"结束：");
        c = getchar();
        getchar();
        if (isupper(c)) {
            printf("这是一个大写字母\n");
            c = tolower(c);
            printf("它的小写字母是%c\n", c);
        } else if (isspace(c))
            printf("这是一个空格字符\n");
        else if (isdigit(c))
            printf("这是一个数字\n");
        else if (islower(c)) {
            printf("这是一个小写字母\n");
            c = toupper(c);
            printf("它的大写字母是%c\n", c);
        } else if (ispunct(c))
            printf("这是一个符号\n");
    }
    printf("程序结束");
}
```

## 11. 杨辉三角

```c
#include <stdio.h>
#include <math.h>

int main() { //杨辉三角（1~12）
	int n, i, k, p, q, r, s = 1, t = 1, u = 1, v = 1;
	for (;;) {
		printf("请输入一个小于13的整数（输入0退出）：\n");
		scanf("%d", &n);
		if (n < 0 || n > 12) {
			printf("错误。请重新输入\n。");
			continue;
		} else if (n == 0)
			return (0);
		else {
			for (i = 0; i <= n; i++) {
				for (v = 1; v <= (36 - 3 * i); v++)
					putchar(' ');
				for (p = 1, s = 1; p <= i; p++)
					s = s * p;
				for (k = 0; k <= i; k++) {
					for (q = 1, t = 1; q <= k; q++)
						t = t * q;
					for (r = 1, u = 1; r <= (i - k); r++)
						u = u * r;
					printf("%6d", s / (t * u));
				}
				printf("\n");
			}
			continue;
		}
		return 0;
	}
}

```

$$C_i^k=i!/(k!(i-k)!)$$

## 12. 计算圆周率$$\pi$$的小程序

```c
#include <stdio.h>
#include <math.h>

int main() {
	double  a = 1e-10;
	printf("正在计算pi，精度为%2.1e\n", a);
	int sign = 1;
	double pi = 0.0, n = 1.0, term = 1.0;
	while (fabs(term) >= a) {
		pi += term;
		sign = -sign;
		n += 2;
		term = sign / n;
	}
	pi = pi * 4;
	printf("pi=%20.18f\n请按任意键退出", pi);
	getchar();
	return 0;
}
```

## 13. 设置倒计时(输入秒数以设置倒计时)

```c
#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

int main() {
	printf("%s", "countdown(s):");
	float n;
	scanf("%f", &n);
	float i;
	system("cls");
	for (i = n; i >= 0; i--) {
		printf("%fs\n\a", i);
		Sleep(1000);
		system("cls");
	}
	return 0;
}
```

## 14. 矩阵乘法

```c
#include <stdio.h>
#include <stdlib.h>

int main() {
	/*输入行数列数*/
	int M, N, P;
	printf("请输入第一个矩阵的行数：");
	scanf("%d", &M);
	printf("请输入第一个矩阵的列数和第二个矩阵的行数：");
	scanf("%d", &N);
	printf("请输入第一个矩阵的行数：");
	scanf("%d", &P);
	/*分配空间的更科学的方法*/
	/*int **a,**b,**c;int i;
	a=(int **)malloc(sizeof(int*)*(M+1));
	for(i=0;i<M;i++)
	a[i]=(int *)malloc(sizeof(int)*(N+1));/*MxN*/
	/*b=(int **)malloc(sizeof(int*)*(N+1));
	for(i=0;i<N;i++)
	b[i]=(int *)malloc(sizeof(int)*(P+1));/*NxP*/
	/*c=(int **)malloc(sizeof(int*)*(M+1));
	for(i=0;i<M;i++)
	c[i]=(int *)malloc(sizeof(int)*(P+1));/*MxP*/
	int a[M][N], b[N][P], c[M][P];

	int x, y;
	for (x = 0; x < M; x++) {
		printf("请输入第一个矩阵的第%d行：", x + 1);
		for (y = 0; y < N; y++)
			scanf("%d", &a[x][y]);
	} /*输入第一个矩阵*/

	for (x = 0; x < M; x++) {
		printf("第一个矩阵的第%d行是：", x + 1);
		for (y = 0; y < N; y++)
			printf("%5d", a[x][y]);
		putchar('\n');
	}/*测试用：输出第一个矩阵**/

	for (x = 0; x < N; x++) {
		printf("请输入第二个矩阵的第%d行：", x + 1);
		for (y = 0; y < P; y++)
			scanf("%d", &b[x][y]);
	}/*输入第二个矩阵*/

	for (x = 0; x < N; x++) {
		printf("第二个矩阵的第%d行是：", x + 1);
		for (y = 0; y < P; y++)
			printf("%5d", b[x][y]);
		putchar('\n');
	} /*测试用：输出第二个矩阵*/

	int e, f, k;
	for (e = 0; e < M; e++) {
		for (f = 0; f < P; f++) {
			c[e][f] = 0;
			for (k = 0; k < N; k++) {
				c[e][f] += (a[e][k]) * (b[k][f]);
				printf("%d,%d,%d\n", c[e][f], a[e][k], b[k][f]);
			}
		}
	}

	for (x = 0; x < M; x++) {
		printf("求得的矩阵的第%d行是：", x + 1);
		for (y = 0; y < P; y++)
			printf("%5d  ", c[x][y]);
		putchar('\n');
	}
	printf("按任意键退出");
	getchar();
	return 0;
}
```

## 15. 输出鼠标位置

```c
#include <windows.h>
#include <stdio.h>

int main() {
	POINT curpos;
	while (1) {
		GetCursorPos(&curpos);
		printf("x:%d,y:%d", curpos.x, curpos.y);
		Sleep(1000);
		printf("\n");
	}
}
```


​    

