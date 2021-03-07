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

