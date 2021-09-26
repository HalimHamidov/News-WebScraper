CREATE DATABASE news_db OWNER postgres;

\connect news_db;

CREATE TABLE news (
    id SERIAL PRIMARY KEY,
    status TEXT,
    updated TEXT,
    encoding TEXT
);

CREATE TABLE daily (
    id SERIAL PRIMARY KEY,
    daily_id TEXT, 
    feed TEXT,
    published TEXT, 
    title TEXT, 
    summary TEXT, 
    link TEXT
)