# MatLab 笔记

```matlab
% 求解方程ax²+bx+c=0
P=[a,b,c] 
r=root(p)
% 如
p=[6,5,4,9,8,7,2]
r=root(p)
% 表示6x⁶+5x⁵+4x⁴+9x³+8x²+7x+2=0
% 求解线性方程组（三种方法）：
Ax=b
x=A\b
x=inv(A)*b
% ∫f(x)dx (从a到b)
quad('f(x)',a,b)
```

```matlab
cd % 显示当前目录
cd 目录 % 改变当前目录
cd\ % 回到根目录
```

```matlab
% 幻方
Magic(n)
% 如
magic(3)
a'# 矩阵转置
```

- 矩阵元素用[]括住,元素与元素之间用逗号或空格隔开,行与行之间用分号隔开
- 矩阵元素可以是实数,虚数`a+bi`或表达式
- 分号出现在指令后则屏幕不立即显示结果
- 当一个命令或矩阵太长时可以用...续行
- `[a,I,b]`生成a到b等间距(间距为i)的向量

- `C=b(:)` 使b矩阵中所有元素变为一列

- `[]`空阵

- `rand(a,b)` a行b列随机矩阵

- 输出pi:

  ```matlab
  digits(a)  % a为pi的精确度
  vpa(pi)  % 输出pi
  ```

- `eyes(a)`单位矩阵
- `zeros(a)`全0矩阵
- `ones(a)`全1矩阵
- `linspace(a,b,n)`将区间[a,b]分为n-1个区间
- `A(3,5)`☞A₃₅,可以直接用来修改某矩阵元素:`A(3,5)=15`
- `load *.m `加载m文件
- `A=xlsread('...\*.xls') `直接读取excel文件
- `plot(a)`按照矩阵画出折线图
- `b=reshape(a,m,n)`矩阵变维(元素个数不变)
- `rot90(a)`逆时针旋转90°
- `fliplr(a)`垂直对称,`flipud(a)`水平对称
- `tril(a)`下三角阵,`triu(a)`上三角阵
- `tril(a,-1)`不包含对角线

- `+`加 `-`减 `*`乘 `/`右除 `\`左除 `^`乘方

- `inv(a)`矩阵求逆
- `det(a)`求行列式
- `eig(a)`求特征值
- `diag(a)`对角矩阵
- `sqrt(a)`矩阵开方
- `.* ./ .\ .^` 矩阵元素乘除
- `class(a)` 输出变量类型 
- `size(a)`以m×n形式输出变量大小
- `double(a `  `char(b)` 强制转换
- `a(end:-1:1) `反序输出

| 1、通用操作指令                                 |                                                              |                                                              |
| ----------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 指令                                            | 含义                                                         | 举例                                                         |
| cd                                              | 设置当前工作日录                                             | `cd c:\mydir`                                                |
| path                                            | 显示当前工作路径                                             | `path`                                                       |
| addpath                                         | 添加工作路径                                                 | `addpath c:\matlab\work`                                     |
| md                                              | 新建文件夹                                                   | `md c:\matlab\work`                                          |
| mkdir                                           | 新建文件夹                                                   | `mkdir(‘c:\matlab\work’)`                                    |
| dir                                             | 列出指定目录下的文件和子目录清单                             | `dir`                                                        |
| delete                                          | 删除指定文件                                                 | `delete exam.m`                                              |
| clf                                             | 清除图形窗                                                   | `clf`                                                        |
| clc                                             | 清除指令窗口中显示内容                                       | `clc`                                                        |
| clear                                           | 清除MATLAB工作空间中保存的变量                               | `clear`                                                      |
| edit                                            | 打开M文件编辑器                                              | `edit  c:\matlab\wook\exam.m`                                |
| exit                                            | 关闭/退出MATLAB                                              | `exit`                                                       |
| quit                                            | 关闭／退出MATLAB                                             | `quit`                                                       |
| who                                             | 显示内存变量                                                 | `who`                                                        |
| whos                                            | 显示内存变量大小                                             | `whos`                                                       |
| which                                           | 指出其后文件所在的目录                                       | `which`                                                      |
| what                                            | 列出指定目录下的m文件                                        | `what`                                                       |
| length                                          | 求变量长度                                                   | `length(x)`,其中x为某一变量                                  |
| hold                                            | 保持当前图形不进行刷新                                       | `hold on`/ `hold off`                                        |
| linspace                                        | 生成等间距向量                                               | l`inspace(x1, x2, n)`，其中x1是初值，x2是终值，n为向量个数   |
| meshgrid                                        | 产生平面区域内的网格坐标矩阵                                 | `[x,y]=meshgrid(x1:(x2-x1)/n:x2)，`其中其中x1是下限，x2是上限，(x2-x1)/n  为步长 |
| 2、数据显示格式控制指令                         |                                                              |                                                              |
| 指令                                            | 含义                                                         | 举例说明                                                     |
| format  short                                   | 通常保证小数点后4位有效数字，最多不超过7位；对于大于1000的实数，用5位有效数字的科学记敷形式显示 | 314.159被显示为314.1590；3141.59被显示为3.1416e+003          |
| format  long                                    | 15位数字表示                                                 | 3.141592654                                                  |
| format  short e                                 | 5位科学记数表示                                              | 3.14E+00                                                     |
| format  long e                                  | 15位科学记数表示                                             | 3.14E+00                                                     |
| format  shor g                                  | 从format  short和format short e中自动选择最佳记述方式(缺省设置) | 3.1416                                                       |
| format  long g                                  | 从format long和format longe中自动选择最佳记述方式            | 3.141592654                                                  |
| format  rat                                     | 近似有理数表示                                               | 355／113                                                     |
| format  hex                                     | 十六进制表示                                                 | 4009211h54442d18                                             |
| format +                                        | 显示大矩阵用；正数、负数、零分别用+，—，空格表示             | +                                                            |
| format  bank                                    | (金融)元、角、分表示                                         | 3.14                                                         |
| format  compact                                 | 显示变量之间没有空行                                         |                                                              |
| format  loose                                   | 在显示变量之间有空行                                         |                                                              |
| 注:format short g显示格式是缺省默认的显示格式； |                                                              |                                                              |
| 3、MATLAB的预定义变量                           |                                                              |                                                              |
| 预定义变量                                      | 含义                                                         |                                                              |
| ans                                             | 计算结果的缺省变量名                                         |                                                              |
| eps                                             | 机器零阈值                                                   |                                                              |
| Inf或inf                                        | 无穷大，如1/0                                                |                                                              |
| i或j                                            | 虚单元                                                       |                                                              |
| pi                                              | 圆周率                                                       |                                                              |
| Nan或nan                                        | 不是一个数，如0/0                                            |                                                              |
| nargin                                          | 函数输入宗量数目                                             |                                                              |
| nargout                                         | 函数输出宗量数目                                             |                                                              |
| realmax                                         | 最大正实数                                                   |                                                              |
| realmin                                         | 最小正实数                                                   |                                                              |