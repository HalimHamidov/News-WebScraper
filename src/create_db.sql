CREATE DATABASE news_db OWNER postgres;

\connect news_db;

CREATE TABLE news_items (
    id SERIAL PRIMARY KEY,
    title TEXT,
    description TEXT,
    link TEXT,
    pubDate TEXT
)