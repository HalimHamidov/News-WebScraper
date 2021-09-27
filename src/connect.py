import requests
from bs4 import BeautifulSoup
import pandas as pd

#enter URL
url = "http://feeds.bbci.co.uk/news/world/us_and_canada/rss.xml"

resp = requests.get(url)

soup = BeautifulSoup(resp.content, features="xml")

items = soup.findAll('item')

#declare empty var to append data
news_items = []

#scarring HTML tags such as Title, Description, Links and Publication date
for item in items:
    news_item = {}
    news_item['title'] = item.title.text
    news_item['description'] = item.description.text
    news_item['pubDate'] = item.pubDate.text
    news_item['link'] = item.link.text
    news_items.append(news_item)

#import pandas to create dataframe for db and CSV
df = pd.DataFrame(news_items,columns=['title','description','pubDate','link'])
