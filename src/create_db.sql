CREATE DATABASE news_db OWNER postgres;

\connect news_db;

CREATE TABLE news_items_dt (
    id SERIAL PRIMARY KEY,
    titled TEXT,
    descriptiond TEXT,
    pubdated TEXT,
    linkd TEXT

)