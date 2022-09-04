import requests

headers = dict()
headers['Accept'] = 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9'
headers['Accept-Encoding'] = 'gzip, deflate, br'
headers['Accept-Language'] = 'zh-CN,zh;q=0.9'
headers['Cache-Control'] = 'no-cache'
headers['Connection'] = 'keep-alive'
headers['Cookie'] = 'JSESSIONID=5398B85EA918A1D14C738E49E04B8903'
headers['DNT'] = '1'
headers['Pragma'] = 'no-cache'
headers['Sec-Fetch-Dest'] = 'document'
headers['Sec-Fetch-Mode'] = 'navigate'
headers['Sec-Fetch-Site'] = 'none'
headers['Sec-Fetch-User'] = '?1'
headers['Upgrade-Insecure-Requests'] = '1'
headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36'
headers['sec-ch-ua'] = '"Chromium";v="104", " Not A;Brand";v="99", "Google Chrome";v="104"'
headers['sec-ch-ua-mobile'] = '?0'
headers['sec-ch-ua-platform'] = '"macOS"'


res = requests.get('https://neris.csrc.gov.cn/alappl/home/gongshi2.do?pageNo=1&pageSize=10', headers=headers)

print(res.text)
