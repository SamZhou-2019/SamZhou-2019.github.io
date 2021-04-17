# 爬虫笔记

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
pip install selenium
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
pip install bs4
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

def findall(url):
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36'}
    # 给请求指定一个请求头来模拟chrome浏览器
    return requests.get(url,headers=headers)# 获取网页源文件
  
url='https://www.7k7k.com/'
test=findall(url)

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

