# 安卓开发笔记

## 问题帖

The specified Gradle distribution 'https://services.gradle.org/distributions/gradle-6.5-bin.zip' does not exist.

> 在第一次使用Android Studio，创建一个新项目之后，点击右上角的gradle图标，下载完成之后报错：
>
> ```bash
> The specified Gradle distribution 'https://services.gradle.org/distributions/gradle-6.5-bin.zip' does not exist.
> ```
>
> 解决方法：打开这个链接，下载gradle-6.5-bin.zip，然后解压到`C:\Users\【用户名】\.gradle`里面。回到Android Studio，依次选择`File->Settings->Build,Execution,Deployment->Gradle`，在"Use Gradle from:"旁边的下拉框选择”Specified location” and paste the direction ，右边的框中填`C:\Users\【用户名】\.gradle\gradle-6.5-bin`，点击Apply。
>
> 再点击gradle图标，就不会报这个错了。[参考链接](https://stackoverflow.com/questions/56161984/the-specified-gradle-distribution-https-services-gradle-org-distributions-gra)