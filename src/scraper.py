import requests
from bs4 import BeautifulSoup
import pandas as pd

#enter URL
url = "http://feeds.bbci.co.uk/news/world/us_and_canada/rss.xml"

resp = requests.get(url)

soup = BeautifulSoup(resp.content, features="xml")
# print(soup.prettify())

items = soup.findAll('item')
# print(items)

#declare empty var to append data
news_items = []

#scarring HTML tags such as Title, Description, Links and Publication date
for item in items:
    news_item = {}
    news_item['title'] = item.title.text
    news_item['description'] = item.description.text
    news_item['link'] = item.link.text
    # news_item['plink'] = item.guid.text
    news_item['pubDate'] = item.pubDate.text
    news_items.append(news_item)

# print(news_items[0])

#import pandas to create dataframe and CSV
df = pd.DataFrame(news_items,columns=['title','description','pubDate', 'link'])#'plink'])
print(df)

df.to_csv('data/BBCnews.csv',index=False, encoding = 'utf-8')


