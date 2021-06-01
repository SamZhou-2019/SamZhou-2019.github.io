# 爬虫笔记

[toc]

## 1.最简单的爬虫

获取页面HTML

```python
import requests
url="https://www.baidu.com/"
headers={'User-Agent':'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.6) Gecko/20091201 Firefox/3.5.6'}
r=requests.get(url,headers=headers,timeout=1)
#timeout参数设定超时的秒数。超过该时间，服务器仍未响应则报错。
print(r.text)#获取网站的HTML
print(r.encoding)#获取网站的编码格式
print(r.status_code)#获取网站的响应状态码
```

提取数据

```python
import requests
from bs4 import BeautifulSoup as bs

url="https://www.baidu.com/"
headers={'User-Agent':'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.6) Gecko/20091201 Firefox/3.5.6'}
r=requests.get(url,headers=headers)

soup=bs(r.text,"html.parser")#解析HTML
p=soup.find("a").text.strip()
#.text提取文本，.strip()去除空白字符
print(p)
with open("test.txt","a+") as f:
    f.write(p)
    f.close()#向文件写入数据
```

示例：爬取微博热搜

```python
import requests
from bs4 import BeautifulSoup as bs
url="https://s.weibo.com/top/summary"
headers={'User-Agent':'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.6) Gecko/20091201 Firefox/3.5.6'}
r=requests.get(url,headers=headers,timeout=1)
soup=bs(r.text,"lxml")
p=soup.find_all("td",class_="td-02")#核心部分
i=0#计数
for pa in p:
    print(str(i)+"\t"+pa.a.text.strip())
    i+=1
```

示例：爬取天眼查上市公司列表

```python
import requests
from bs4 import BeautifulSoup as bs
import pandas
import time
def spiderx(url):
    headers={'User-Agent':'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.6) Gecko/20091201 Firefox/3.5.6'}
    r=requests.get(url,headers=headers)
    soup=bs(r.text,"lxml")
    p=soup.find_all("td")
    i=0
    with open("./elibs_quoted.csv","a+") as f:
        for pa in p:
            f.write(pa.text.strip()+",")
            i+=1
            if i%5==0:
                f.write("\n")
    f.close()


with open("./elibs_quoted.csv","w+") as f:
    f.write('股票名称,股票代码,公司名称,交易所名称,上市日期\n')
    f.close()
for i in range(1,289):
    url="https://www.tianyancha.com/elibs_quoted/p"+str(i)
    spiderx(url)
    print("Page "+str(i)+" Completed")
print("Program Completed")
```

## 2.定制Request

1. 发送post请求

```python
import requests
url="http://httpbin.org/post"
data_dict={'key':'value','name':'sam','age':'8'}
r=requests.post(url,data=data_dict)
print(r.text)
print(r.status_code)

import json
with open('test.json','w',encoding='utf-8') as f:
    json.dump(r.text,f)# 可以将返回的json代码写入json格式的文件
```

会返回一段json代码，其中包含：

```json
  "form": {
    "age": "8",
    "key": "value",
    "name": "sam"
  }
```

具体操作如下：

```python
import requests
url="【网站】"
headers={
    'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36 Edg/88.0.705.56',
    'method': 'POST',
    'scheme': 'https',
    'dnt': '1',
    ...
    【这一部分通常在Chrome浏览器的开发人员工具-网络中查询，单击某一条被记录的元素并查看“标头”，其中的“请求标头”即为这一部分。注意数字也要写成字符串形式】
}
data_dict={
    【这一部分通常在Chrome浏览器的开发人员工具-网络中查询。提交表单后，单击某一条被记录的元素并查看“标头”，其中的“表单数据”即为这一部分（若没有这一部分，则表明这一条记录没有上传任何表单）。注意数字也要写成字符串形式】
}
r=requests.post(url,data=data_dict,headers=headers)

import json
jsonData=json.loads(r.text)
# 【返回值应为json格式的纯文本。json.loads将文本格式化为元组，便于操作。这一部分通常在Chrome浏览器的开发人员工具-网络中可以查询。提交表单后，单击某一条被记录的元素并查看“预览”（若这一部分为空，则表明这一条记录没有返回数据）。】
print(jsonData)
print(jsonData["data"]["unit"][i]) # 此行仅为示例，实际代码以实际情况为准
```

2. 请求头示例

```python
headers = {
'user-agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.82 Safari/537.36'
}
```

3. 传递URL参数

必应搜索引擎的URL通常是https://cn.bing.com/search?q=[搜索关键词]。问号后面的字符串即为URL参数，以键值对形式出现。多个键值对由&分开。

```python
import requests
url="https://cn.bing.com/search"
params_dict={"q":"test"}
headers = {'user-agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.82 Safari/537.36'}
r=requests.get(url,params=params_dict,headers=headers)
print(r.text)#网页HTML
print(r.status_code)
print(r.url)#生成的URL链接
```

示例：利用有道翻译api进行文本翻译

```python
from time import sleep
import requests

p="在这里输入文本"
Q = p.strip()
print('欲翻译文本 => %s' % (Q))
data = {
    'q': Q,
    'from': 'Auto', # "chinese","english"
    'to': 'Auto'
}

sleep(5)
information = requests.post('https://aidemo.youdao.com/trans', data)
json = information.json()
errorCode = json['errorCode']
while errorCode != '0':
    print('出现错误！返回的状态码为：%s' % (errorCode))
    sleep(300)
query = json['query']
translation = json['translation']
print('原文本:' + query)
for x in range(len(translation)):
    print('翻译结果' + str(x + 1) + " : " + translation[x])
    school_en=translation[x]
```

## 3.爬取动态网站

1. 使用selenium模拟浏览器抓取

需要在命令行提前安装selenium

```powershell
> pip install selenium
```

并下载geckdriver.exe，复制到FIrefox安装目录（否则会报错）

```python
from selenium import webdriver
driver = webdriver.Firefox()
driver.get("https://www.baidu.cn")
```

`driver.find_element_by_css_selector` 筛选出第一个符合条件的代码块，如：

```python
driver.find_element_by_css_selector('div.text')
# 筛选出第一个<div class='text' ...>的代码块
driver.find_elements_by_css_selector('div.text')
# 筛选出所有<div class='text' ...>的代码块并存储为列表
```

`switch_to.frame` 定位至指定的frame代码块，如：

```python
driver.switch_to.frame(driver.find_element_by_css_selector("iframe[title='frame']"))
```

`driver.find_element_by_tag_name`  筛选出第一个指定标签的代码块，如：

```python
driver.find_element_by_tag_name('p')
# 筛选出第一个<p ...>的代码块
driver.find_element_by_tag_name('p')
# 筛选出所有<p ...>的代码块并存储为列表
```

示例：爬取西电教务处的通知公告

```python
from selenium import webdriver
driver = webdriver.Firefox()
driver.implicitly_wait(10)# 隐性等待，最长设置为10秒
driver.get("https://jwc.xidian.edu.cn/tzgg.htm")

# 爬取其中一条
div = driver.find_element_by_css_selector('div.list')# 定位至<div class='list' ...>
if(div.text != ''):
    content = div.find_element_by_tag_name('a')
    print(content.text)

print('\n')
# 爬取所有信息 
div = driver.find_element_by_css_selector('div.list')
content = div.find_elements_by_tag_name('a')
for item in content:
    if(item.text != ''):
        print(item.text)
```

2. selenium的附加功能

如：限制图片加载

```python
fp = webdriver.FirefoxProfile()
fp.set_preference("permissions.default.image",2)

driver = webdriver.Firefox(firefox_profile=fp)
driver.get("https://jwc.xidian.edu.cn")
```

如：禁止JavaScript

```python
fp = webdriver.FirefoxProfile()
fp.set_preference("javascript.enabled", False)

driver = webdriver.Firefox(firefox_profile=fp)
driver.get("https://weibo.cn")
```

如：模拟点击按钮

```python
load_more = driver.find_element_by_css_selector('div.btn btn-change')
load_more.click()
```

示例：爬取B站排行榜

```python
from selenium import webdriver
import time

driver = webdriver.Firefox()
driver.implicitly_wait(10)
driver.get("https://www.bilibili.com/v/popular/all")
time.sleep(3)

div = driver.find_element_by_css_selector('div.video-card__info')
if(div.text != ''):
    print(div.text+'\t')
    content = div.find_element_by_tag_name('p')
    print(content.text)

print('\n')

for page in range(0,5):
    time.sleep(3)# 每次翻页时暂停3秒，等待加载
    driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
    # 排行榜每次只加载20项，每次翻页到底就加载20项
    
divs = driver.find_elements_by_css_selector('div.video-card__info')
i=0
for div in divs:
    if(div.text != ''):
        i+=1
        content = div.find_element_by_tag_name('p.video-name')
        upname = div.find_element_by_tag_name('span.up-name__text')
        play = div.find_element_by_tag_name('span.play-text')
        like = div.find_element_by_tag_name('span.like-text')
        print(str(i)+'\t'+content.text+'\n\t'+upname.text+'\n\t播放量  '+
        play.text.strip()+'\t点赞数  '+like.text.strip())
```

## 4.网页解析

1. 使用BeautifulSoup进行解析

需要提前安装BeautifulSoup：

```powershell
> pip install bs4
```

示例：解析7K7K网站中的所有链接

```python
from bs4 import BeautifulSoup
import requests

headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36'}
url='https://www.7k7k.com/'
url_html=requests.get(url,headers=headers)# 获取超文本
soup=BeautifulSoup(url_html.text,'lxml')# 解析网页，需要安装lxml
finds=soup.find_all('a')# 检索所有a标签。标签内的限制:如class，可以加  ,class_=''
for find in finds:
    print(find['href'])# 获取标签内的内容
    print(find.text.strip())# 获取标签间的内容
```

示例：解析7K7K网站中的所有链接并保存至文本文件中

```python
from bs4 import BeautifulSoup#bs插件
import requests#requests插件

url='http://www.7k7k.com/'
test=requests.get(url)#获取网页源文件

soup=BeautifulSoup(test.text,'lxml')#利用lxml解析网页源文件
finds=soup.find_all('a')#寻找带有a标签的所有代码
with open('htmltext1.txt','a+') as html:#开始编写文件
    html.seek(0)#定位文件至顶端
    html.truncate()#清除定位后的内容（这一行和前一行的作用是清空文档）
    for find in finds:#分析每一行代码
        try:
            website=str(find['href'])#选择带有href标签的代码
            if 'http' not in website:#加网页前缀
                html.write('http://www.7k7k.com'+website+'\n')#输出到文档
            else:
                html.write(website+'\n')
            html.write(find.text+'\n')
        except KeyError:#如果没有href则跳过
            True
```

实战：爬取7k7k网页上的所有图片

```python
from bs4 import BeautifulSoup# bs插件
import requests# requests插件
import os# os用来保存图片

def get(url):
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36'}
    # 给请求指定一个请求头来模拟chrome浏览器
    return requests.get(url,headers=headers)# 获取网页源文件
  
url='https://www.7k7k.com/'
test=get(url)

soup=BeautifulSoup(test.text,'lxml')# 利用lxml解析网页源文件
finds=soup.find_all('img')# 寻找带有img标签的所有代码
if not os.path.exists(r'./src'):
    os.makedirs(r'./src')# 保存图片的目录，如果没有就创建一个
i=0# 编号
for find in finds:
    #src
    try:
        img=requests.get(str(find['src']))#直接访问图片链接
        file_name=r'img_src_'+str(i)+'_'+find['alt']+r'.jpg'#设置文件名
        translation = file_name.maketrans('/\\|?<>:*\" ', '##########')
        file_name=file_name.translate(translation)#文件名当中不能出现的字符用#代替
        f=open(r'./src/'+file_name,'wb')#创建并打开文件
        f.write(img.content)#写入文件
        print('Writing : '+file_name+'   No.'+str(i)+'  '+str(find['src']))
        f.close()#关闭文件
        print('Completed : '+file_name+'   No.'+str(i)+'  '+str(find['src']))
        i=i+1#文件名计数器
    except KeyError:
        True
    except requests.exceptions.MissingSchema:
        True
    #lz_src
	try:
        img=requests.get(str(find['lz_src']))#直接访问图片链接
        file_name=r'img_src_'+str(i)+'_'+find['alt']+r'_lz.jpg'#设置文件名
        translation = file_name.maketrans('/\\|?<>:*\" ', '##########')
        file_name=file_name.translate(translation)#文件名当中不能出现的字符用#代替
        f=open(r'./src/'+file_name,'ab')#创建并打开文件
        f.write(img.content)#写入文件
        print('Writing : '+file_name+'   No.'+str(i)+'  '+str(find['lz_src']))
        f.close()#关闭文件
        print('Completed : '+file_name+'   No.'+str(i)+'  '+str(find['lz_src']))
        i=i+1#文件名计数器
    except KeyError:
        True
    except requests.exceptions.MissingSchema:
        True
```

2. BeautifulSoup的其它用法

如：超文本格式化

```python
print(soup.prettify())
```

3. lxml解析网页

```python
import requests
from lxml import etree

link = "http://www.7k7k.com/"
headers = {'User-Agent' : 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.6) Gecko/20091201 Firefox/3.5.6'} 
r = requests.get(link, headers= headers)

html = etree.HTML(r.text)
title_list = html.xpath('//div//a//text()')# XPath语法，text()返回标签内的内容
print (title_list)# 获取到的是列表
```

## 5.数据存储

### 1.SQL server

```python
import pymssql # 需要提前安装pymssql包

def sqlconnect():
    connect = pymssql.connect(【服务器名称】, 【用户名】,【密码】, 【数据库名】)
    # 建立SQL服务器连接
    if connect:
        print('SQL Server Connected') # 连接成功
        True
    else:
        print('SQL Server Error') # 连接失败，退出
        exit()
    return connect

connect = sqlconnect()  # 连接SQL服务器
cursor = connect.cursor() # 创建游标对象，用于执行SQL语句
cursor.execute(【SQL语句，字符串形式】) # 执行SQL语句
cursor.executemany( # 可执行多行语句
    "INSERT INTO persons VALUES (%d, %s, %s)",
    [(1, 'John Smith', 'John Doe'),
     (2, 'Jane Doe', 'Joe Dog'),
     (3, 'Mike T.', 'Sarah H.')])
row = cursor.fetchone() # 执行SELECT查询语句后，将返回值赋给变量（row）
# fetchone仅获取一行，获取多行可使用fetchall
connect.commit()  # 提交SQL语句
cursor.close() # 关闭游标
connect.close()  # 断开服务器连接
```

### 2.MySQL

```python
import pymysql
# 打开数据库连接
db = pymysql.connect(【服务器名称】, 【用户名】,【密码】, 【数据库名】)
# 使用cursor()方法获取操作游标 
cursor = db.cursor()
# SQL 插入语句
sql = 【SQL语句，字符串形式】
try:
   # 执行sql语句
   cursor.execute(sql)
   # 提交到数据库执行
   db.commit()
except:
   # 如果发生错误则回滚
   db.rollback()
# 关闭数据库连接
db.close()
```

## 6.多线程编程

```python
import threading
import time

def test(x): # 创建一个函数，用于输出时间
    for i in range(5):
        print(threading.current_thread().name,' test ',i,end=' : ')
        time.sleep(1)
        print(time.asctime())
        
thread = threading.Thread(target=test(3)) # 创建线程
thread.start() # 启动线程
```

`print(threading.current_thread().name)`方法用于输出线程的名字。每一个线程都有一个name属性，代表线程的名字。如果没有赋值的话默认就是“Thread-n”，其中n为自然数。

- 如果需要给线程赋值，则可以使用name='ThreadName'：

    `thread = threading.Thread(target=test,name='TestThread')`
    
- 可以通过thread.is_alive()查询线程是否还在运行，返回布尔值
- `thread.join()`可以阻塞该线程（停止运行）。可以添加参数`thread.join(timeout)`，规定等待的时间（timeout，浮点数）

示例：多线程抛硬币

```python
import threading
import random
 
class myThread (threading.Thread):
    def __init__(self, name, x):
        threading.Thread.__init__(self)
        self.name = name # 这里的变量要和线程运行的变量一致
        self.x = x
    def run(self): # 重写run
        print ("Starting " + self.name)
        coin_1(self.name, self.x)
        print ("Exiting " + self.name)
        
def coin_1(threadName, x): # 抛硬币
    print(threadName+'开始计算。')
    i=a_side=b_side=0
    with open('coin.txt','w') as record:
        while i<x:
            result=int(2*random.random())
            if result is 1:
                a_side+=1
                record.write(str(i+1)+'  a,\n')
            else:
                b_side+=1
                record.write(str(i+1)+'  b,\n')
            i+=1
            if(i%10==0):
                print(threadName,' - ',i)
    print(str(threadName)+' :正面 '+str(a_side)+' 次，反面 '+str(b_side)+' 次。')
    print(str(threadName)+' :正面概率为 '+str(100*a_side/x)+' %，反面概率为 '+str(100*b_side/x)+' %。')
    
threads = [] # 线程列表

# 创建新线程
thread1 = myThread("Thread-1", 5000)
thread2 = myThread("Thread-2", 5000)
thread3 = myThread("Thread-3", 5000)
thread4 = myThread("Thread-4", 5000)
thread5 = myThread("Thread-5", 5000)
 
# 开启新线程
thread1.start()
thread2.start()
thread3.start()
thread4.start()
thread5.start()
 
# 添加线程到线程列表
threads.append(thread1)
threads.append(thread2)
threads.append(thread3)
threads.append(thread4)
threads.append(thread5)
 
# 等待所有线程完成
for t in threads:
    t.join()
    
print ("Exiting Main Thread")
```

## 7.Scrapy

Scrapy 是用 Python 实现的一个为了爬取网站数据、提取结构性数据而编写的应用框架，常应用在包括数据挖掘，信息处理或存储历史数据等一系列的程序中。

详细的信息可以参考Scrapy中文参考文档：https://scrapy-chs.readthedocs.io/zh_CN/latest/index.html

### 第一步：安装

在命令行使用pip工具安装Scrapy框架：

```powershell
> pip install Scrapy
```

安装完成后，只需在命令行输入scrapy，提示`Scrapy 【版本号】 - no active project`，证明安装成功。

### 第二步：新建项目

在项目目录中新建一个新的scrapy项目，在命令行输入：

```powershell
> scrapy startproject mySpider
```

将会显示以下文字，说明创建成功（以anaconda为例）：

> New Scrapy project 'mySpider', using template directory 'c:\programdata\anaconda3\lib\site-packages\scrapy\templates\project', created in:
>     【当前目录】\mySpider
>
> You can start your first spider with:
>     cd mySpider
>     scrapy genspider example example.com

mySpider为项目名称。可以看到将会创建一个mySpider文件夹，目录大致如下：

> mySpider/
>
> |—scrapy.cfg                              项目的配置文件。
>
> |—mySpider/                             项目的Python模块，将会从这里引用代码。
>
> ​	|—\_\_init\_\_.py
>
> ​	|—items.py                             项目的目标文件。
>
> ​	|—pipelines.py                       项目的管道文件。
>
> ​	|—settings.py                         项目的设置文件。
>
> ​	|—spiders/                             存储爬虫代码目录。
>
> ​		|—\_\_init\_\_.py
>
> …

### 第三步：创建爬虫类

打开mySpider/items.py，修改为自己需要的内容，如

```python
import scrapy

class MyspiderItem(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    name = scrapy.Field()
    pic = scrapy.Field()
    href = scrapy.Field()
```

### 第四步：制作爬虫

在当前目录输入如下命令，在该目录创建一个名为test的爬虫，并指定爬取的域名范围。我们取4399.com作为域名范围，即：

```powershell
> cd mySpider
> scrapy genspider test "4399.com"
# 输出： Created spider 'test' using template 'basic' in module:
#         mySpider.spiders.test
```

此时mySpider/spider文件夹下新增了一个文件test.py，内容如下：

```python
import scrapy

class TestSpider(scrapy.Spider):
    name = 'test' # 爬虫的唯一识别名称
    allowed_domains = ['4399.com'] # 爬虫的域名范围，不包含该域名的URL会被忽略
    start_urls = ['http://4399.com'] # 爬虫的最初始页面，以列表的形式定义

    def parse(self, response):
        pass

```

可以修改start_urls的值为需要爬取的第一个URL，如`start_urls = ['https://www.4399.com']` 。

同时修改`parse()`方法，将整个网页写入一个超文本文本。

```python
import scrapy

class TestSpider(scrapy.Spider):
    name = 'test'
    allowed_domains = ['4399.com']
    start_urls = ['https://www.4399.com/']

    def parse(self, response):
        filename = "test.html"
        open(filename, 'wb').write(response.body)

```

然后在当前目录尝试运行以下命令：

```powershell
> scrapy crawl test
```

运行结果若出现`Traceback (most recent call last):`即为出现错误，需检查错误原因。最后出现`[scrapy.core.engine] INFO: Spider closed (finished)`即为爬虫完成退出。

### 第五步：爬取指定元素

爬取时需要XPath表达式。XPath将XML超文本文档看作树状结构，使用路径表达式来选取XML文档中的节点或节点集，以下是常用的元素：

| 表达式                                                       | 描述                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| nodename                                                     | 选取此节点的所有子节点<br />如：div 选取div元素的所有子节点。 |
| /                                                            | 从根节点选取<br />如：/html/head/title: 选择HTML文档中\ <head\> 标签内的 \<title\> 元素<br />如/html/head/title/text(): 选择上面提到的 \<title\> 元素的文字 |
| //                                                           | 选取所有元素而不考虑它们的位置<br />如//td：选择所有的 \<td\> 元素，而不管它们在文档中的位置。 |
| .                                                            | 选取当前节点                                                 |
| ..                                                           | 选取当前节点的父节点                                         |
| @                                                            | 选取属性<br />如：//@lang	选取名为 lang 的所有属性。<br />如：//div[@class="mine"]: 选择所有具有 class="mine" 属性的 div 元素 |
| \*                                                           | 匹配任何元素节点<br />如：@\*  表示匹配任何属性的节点        |
| \|                                                           | 路径表达式之间使用，表示“或”                                 |
| node()                                                       | 匹配任何类型的节点                                           |
| <br />\[1\]<br />[last()]<br />[last()-1]<br />[position()<5] | 位于标签名后，分别代表选取：<br />第一个元素<br />最后一个元素<br />倒数第二个元素<br />前四个元素 |

例如爬取目标网站的标题和描述：

```python
import scrapy

class TestSpider(scrapy.Spider):
    name = 'test'
    allowed_domains = ['4399.com']
    start_urls = ['https://www.4399.com/']

    def parse(self, response):
        # 使用XPath表达式进行选取，如网站标题
        title = response.xpath('/html/head/title/text()').extract_first()
        # .extract_first()仅提取第一个发现的节点，可以使用.extract()提取所有发现的节点并以元素形式保存。下一句选取网站描述
        context = response.xpath('/html/head/meta[@name="description"]/@content').extract()
        print(title)
        print(context)
        pass
```

即可在输出的代码中找到爬取结果。爬取结果可以保存为json格式、json lines（.jsonl）格式（默认Unicode编码）、xml格式、csv格式等。在命令后加`-o 【文件名】`即可，如：`scrapy crawl test -o testScrapy.xml`。

引入之前定义的MyspiderItem，`from mySpider.items import MyspiderItem`，然后将爬取的信息以MyspiderItem定义的形式封装起来：

```python
import scrapy
from mySpider.items import MyspiderItem

class TestSpider(scrapy.Spider):
    name = 'test'
    allowed_domains = ['4399.com']
    start_urls = ['https://www.4399.com/']

    def parse(self, response):
        # 建立一个用于存放爬取数据的列表
        items = []

        for each in response.xpath('//li/a'):
            # 将爬取的数据封装为MyspiderItem对象
            item = MyspiderItem() 
            
            name = each.xpath('text()').extract()
            pic = each.xpath('//img/@src').extract()
            href = each.xpath('@href').extract()

            if (name!=[]):
                item['name']=name[0]
            else:
                item['name']='None'
            if (pic!=[]):
                item['pic']=pic[0]
            else:
                item['pic']='None'
            if (href!=[]):
                item['href']=href[0]
            else:
                item['href']='None'
            # 注意.extract()返回的是一个列表
            items.append(item)

        return items
```

## 8.反爬虫问题

### 1.修改请求头

```python
# 默认请求头
import requests
r = requests.get('https://cn.bing.com')
print(r.request.headers)
# {'User-Agent': 'python-requests/2.19.1', 'Accept-Encoding': 'gzip, deflate', 'Accept': '*/*','Connection': 'keep-alive'}

# 指定请求头
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.6) Gecko/20091201 Firefox/3.5.6'}
r = requests.get('https://cn.bing.com', headers=headers)
print(r.request.headers)
# {'User-Agent': 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.6) Gecko/20091201 Firefox/3.5.6', 'Accept-Encoding': 'gzip, deflate', 'Accept': '*/*', 'Connection': 'keep-alive'}

# 通过随机频繁更换请求头以避免反爬
ua = UserAgent()
r = requests.get('https://cn.bing.com', headers={"User-Agent": ua.random})
print(r.request.headers)
# {'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36', 'Accept-Encoding': 'gzip, deflate', 'Accept': '*/*', 'Connection': 'keep-alive'}
```

### 2.修改间隔时间

```python
import time
import random

t1=time.time()
time.sleep(random.randint(0,5))
t2=time.time()
print(t2-t1)
```

### 3.使用代理

```python
import requests

link = "http://www.xxx.com/"
proxies = {'http':'http://xxx.xxx.xxx.xxx:xxxx'}
response = requests.get(link, proxies=proxies)
```

## 9.中文编码问题

### 1.中文编码基础函数

```python
str="西安电子科技大学"
print(str) # 西安电子科技大学
print(type(str)) # <class 'str'>
```

以GB2312和UTF-8编码方式为例：

```python
# 使用GB2312编码方式进行编码
str_gb2312=str.encode('gb2312')
print(str_gb2312) 
# b'\xce\xf7\xb0\xb2\xb5\xe7\xd7\xd3\xbf\xc6\xbc\xbc\xb4\xf3\xd1\xa7'
print(type(str_gb2312)) # <class 'bytes'>
# 使用UTF-8编码方式进行编码并解码
str_utf8_decode=str.encode('utf8').decode('utf8')
print(str_utf8_decode) # 西安电子科技大学
print(type(str_utf8_decode)) # <class 'str'>
# 猜测编码方式
import chardet
print(chardet.detect(str_gb2312))
# {'encoding': 'GB2312', 'confidence': 0.99, 'language': 'Chinese'}
```

### 2.解决中文乱码问题

```python
import requests
from bs4 import BeautifulSoup

r=requests.get('https://www.4399.com')
s=BeautifulSoup(r.text,'lxml')
s.find_all('a')
print(s)
# 此时获取的数据有中文乱码
print(r.encoding)
# 输出“ISO-8859-1”，说明此时使用这种编码方式解码的。但该网站的编码方式是GB2312。
# 切换编码方式
r=requests.get('https://www.4399.com')
r.encoding='gb2312'
s=BeautifulSoup(r.text,'lxml')
s.find_all('a')
print(s)
# 此时输出的数据没有中文乱码。
# 可以通过以下方式猜测编码方式：
import chardet
print(chardet.detect(r.content))
```

爬取新华社新闻排行榜并发送邮件至电子邮箱中

```python
import smtplib
import datetime
import time
from email.mime.text import MIMEText
import json
import requests
from bs4 import BeautifulSoup as bs

def send_email(message):  # 发送一封邮件
    msg_from = 'xyz@abc.com'  # 发送方
    passwd = 'password'  # 发送方授权码或密码
    msg_to = 'abc@xyz.com'  # 接收方
    subject = '新华社新闻排行榜'  # 主题
    msg = MIMEText(message,'plain','utf-8')  # HTML纯文本格式发送邮件
    msg['Subject'] = subject
    msg['From'] = msg_from
    msg['To'] = msg_to
    s = smtplib.SMTP_SSL("smtp.abc.com", 465)  
    # 邮件服务器及端口号，一般可以在邮件网站上查到
    s.login(msg_from, passwd)
    s.sendmail(msg_from, msg_to, msg.as_string())
    
content='' # 设置一个保存数据的字符串
url="http://www.news.cn/json/bangdan/top1.json" # 目标网站
headers={'User-Agent':'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.6) Gecko/20091201 Firefox/3.5.6'}
r=requests.get(url,headers=headers)
soup=bs(r.text,"lxml")
p=soup.find_all("p")
p=p[0].text[9:] # 去除无用字符
j=json.loads(p) # 解析json代码
for i in range(10):
    content=content+str(i+1)+' - '+j['list'][i]['listTitle']+'\n' 
    # 取出每一条新闻
    subpath=j['list'][i]['subpath']
    # 子网站中含用详细信息
    s=requests.get(subpath,headers=headers)
    s=s.text[14:-1] # 去除无用字符
    js=json.loads(s) # 解析json代码
    content=content+js['list'][0]["contentAbstract"]+'\n'
    content=content+js['list'][0]["contentUrl"]+'\n'
    # 取出摘要和含有详细新闻的网站
    
send_email(content) # 发送邮件
```



