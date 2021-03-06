# 旭旭的个人主页 🏡

> ### 📝学习笔记
>
> > [C语言的一些常用函数](website_C/C_functions.md)
> >
> > [Java学习笔记](website_java/java.md)
> >
> > [python学习笔记](website_python/python_study.html)
> >
> > [C语言的指针（一些小程序）](website_C/C_pointer.md)
> >
> > [C语言的程序示例](website_C/C_program.md)

> ### 📚学习资料
>
> > [管理学复习范围](webpage_management/management.htm)
> >
> > [组织行为学复习范围](webpage_management/Organizational_Behavior.htm)
> >
> > [西电暑实网课答案](webpage_shushi_2019/shushi_2019.html)

> ### 📌学习心得
>
> > [信息计量学-信息计量学-关于usnews\$曲阜师大的思考](website_informetrics/usnews.md)
> >
> > [金工日记](website_metalwork/metalwork.html)
> >
> > [信息安全-简单的隐写术](website_security/steganography.md)
> >
> > [计算机网络-ARP广播帧](website_security/ARP.md)
> >
> > [REG注册表管理](website_security/REG.md)
> >
> > [信息安全-记一次系统攻击实验](website_security/attackXP.md)
> >
> > [了解一下ADB](website_java/What'sADB.md)

> ### 📁其他
>
> > [这个西电程序员年薪竟然有这么多，原来是因为……](ruanwen/ruanwen.html)
> >
> > [用matlab做一个滑稽](website_matlab/huaji.md)
> >
> > [英语课写的小剧本](website_english/English_Script.md)

（以后可能还会写其他编程语言甚至金融财务的学习笔记。）

> 留一些要填的坑
>
> > Python 数据分析&网络爬虫
> > （肯定会写，毕竟涉及到自己的专业知识，以后会学）
> >
> > R语言&数据挖掘
> > （大三学过的课程，过了寒假就忘光了）
> >
> > 经济学&金融学&会计学
> > （这一堆坑能填则填吧）

https://samzhou-2019.github.io/ @旭旭 QQ:1301621033  [发送邮件](mailto:zhouzexu2010@sina.cn?cc=zxzhou@stu.xidian.edu.cn&subject=About%20samzhou-2019.github.io)

<script>
document.write(Date());
</script>
> ### 以下区域，我想到啥就写啥。
>
> \#金融学\#众所周知，咱们国家的交易市场一般是早上九点半开盘，但实际上并不是说只有到了九点半才交易。在之前的一段时间，会有叫做”集合竞价“的一步。每天只有四个小时的开盘时间（早上九点半到十一点半，下午一点到三点），然而各大公司的消息发布可不是仅仅只在这四个小时的时间发布。如果开盘即交易，从前一天收盘到第二天开盘的所有消息面都会涌入市场，造成大量的投资，而这会导致大盘的大幅度震荡。所以在每天开盘之前都会有集合竞价的时间（9 : 15\~9 : 25），十分钟只报价但不交易，前五分钟可下单也可撤单，后五分钟可下单但不可撤单（有的人可能会下大量的单，营造一种交易繁荣的假象。后五分钟不可撤单就是为了防止这种情况。——感谢金融系的魏同学）；十分钟结束时，按照成交量最大的原则定价，统一交易。（收盘前三分钟也会进行集合竞价，避免别有用心的人在交易结束前操纵价格）。
>
> \#情报学\#情报学真的不是搞间谍。
>
> \#离散数学\#我说的是谎话。这句悖论真的太好玩了。
>
> \#经济学\#舍友说他们这学期工程概论是教经济管理的，然而老师连GDP也不会算😂。
>
> \#Android开发\# The specified Gradle distribution 'https://services.gradle.org/distributions/gradle-6.5-bin.zip' does not exist.
>
> > 在第一次使用Android Studio，创建一个新项目之后，点击右上角的gradle图标，下载完成之后报错：
> >
> > ```bash
> > The specified Gradle distribution 'https://services.gradle.org/distributions/gradle-6.5-bin.zip' does not exist.
> > ```
> >
> > 解决方法：打开这个链接，下载gradle-6.5-bin.zip，然后解压到`C:\Users\【用户名】\.gradle`里面。回到Android Studio，依次选择`File->Settings->Build,Execution,Deployment->Gradle`，在"Use Gradle from:"旁边的下拉框选择”Specified location” and paste the direction ，右边的框中填`C:\Users\【用户名】\.gradle\gradle-6.5-bin`，点击Apply。
> >
> > 再点击gradle图标，就不会报这个错了。[参考链接](https://stackoverflow.com/questions/56161984/the-specified-gradle-distribution-https-services-gradle-org-distributions-gra)