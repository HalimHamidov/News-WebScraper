import psycopg2
import psycopg2.extras 
from items_soup import *
import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy.orm import *

engine = create_engine(f'postgresql://postgres:postgres@localhost:5432/news_db')
Session = sessionmaker(bind=engine) 
df.to_csv('data/BBCnews.csv',index=False, encoding = 'utf-8')
with Session() as session:
    path = "data/"
    df = pd.read_csv(path + f'BBCnews.csv') 
    df.to_sql('news_items_dt', con=engine, if_exists='append',index=False)