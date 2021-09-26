import requests
from bs4 import BeautifulSoup

URL = "http://feeds.bbci.co.uk/news/video_and_audio/world/rss.xml"
# URL = "https://realpython.github.io/fake-jobs/"

page = requests.get(URL)

soup = BeautifulSoup(page.content, "html.parser")

print(soup.prettify())
