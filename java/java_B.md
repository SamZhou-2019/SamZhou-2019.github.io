# 十一、错误与异常

## 错误

+ 语法错误:没有遵循语言的规则,它们可以由编译器检查发现
+ 运行错误:程序运行过程中,环境发现了一个不可能执行的操作
+ 逻辑错误:程序没有按照预期的方案执行

## 异常

Error：内部系统错误，是由JVM抛出并在Error类中描述的，一般很少发生。
Exception：异常，由程序和外部环境引起的错误，能够通过程序捕获和处理。

免检异常：RuntimeExcption，Error及其子类
大多数情况下免检异常反应程序设计中不可重获的逻辑错误。不建议捕获或声明。

必检异常：所有其他异常。
编译器会强制程序员检查并处理它们。

### 声明异常

每个方法都需要声明（throws）它可能抛出的==必检异常==类型。
可以声明多个异常，用逗号分开。也可以声明自定义异常。

```java
public void readFile(String filename) throws FileNotFoundException{...}
```

### 抛出异常

程序检查到一个异常后，创建一个异常类型的对象并抛出（throw）它。

```java
throw new FileNotFoundException();// 方法1
FileNotFoundException ex = new FileNotFoundException();throw ex;// 方法2
```

一个方法出现异常时，如果想让该方法的调用者处理异常，则应当创建一个异常对象并抛出该异常。
如果能在发生异常的方法中处理异常就不需要抛出异常。

### 捕获异常

当必须处理不可预料的错误时使用。

```java
try{
// 正常逻辑
}
catch (/*异常*/Exception ex){
 // 可以处理一个异常
}
   catch (/*异常*/Exception2 ex2){
 // 也可以处理多个异常
}
   ...
finally {
 // 无论是否捕获异常，这部分代码都会执行
   }
```

> 如果声明了一个必检异常，如
>
> ```java
> void err() throws IOException {}
> ```
>
> 就必须**在try-catch块中捕获**
>
> ```java
> void p(){
>   try {err();}
>  catch(IOException ex) {//异常处理}
> }
> ```
>
> 或者**在调用它的方法中再次声明该异常**
>
> ```java
> void p() throws IOException {err();}
> ```
>
### 自定义异常类

创建自定义异常类：继承Exception的子类

```java
public class MyException extends Exception {}
```

[返回上一页](java.md)