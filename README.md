# News-WebScraper

DevOps Task 

This task checks for the following skills:

Databases

Sites scraping

The basics of DevOps

1. Scraping

Create a script that parses the site and collects news

Url: https://ir.thomsonreuters.com/rss-feeds

This script should be able:

get all urls, titles, short description, datetime

Additional task:

use collected urls to get body of news

2. Database

Save all collected data in PostgresSQL database

Additional task:

Save collected data in MongoDB

3. The basics of DevOps

Chose one database, Mongo or Postgres to finish this part.

Create docker-compose.yml with all necessary services

Create python or shell script(or combination of them) as entry point for user

User should be able to:

Start database server

Create schema

Run scrapper

Retrieve data for a specific date (output-> csv file)

Additional task:

Create service in docker-compose with cron service inside. Cron task should start Scraper hourly and add only new news in database.

Also you should create instructions.md so user could be able to install and run everything that you created

It is normal if you don't know some of the things but get a tutorial/book and learn it on the flight.

4. Upload your project to GitHub