## Install & Run

Go to the directory with the project files. Firstly we should set the environment with Ubuntu terminal(wsl in Windows) or Mac terminal, so that commands like bash works. Run in terminal
$ cd News-WebScraper

Build & and run app with run.sh file
```sh
$ bash run.sh
```
## When the project is built, 
bash menu would be shown in terminal:

```sh
Status: Downloaded newer image for mongo:latest
Creating news-webscraper_dbMongo_1 ... done
Creating pg_container              ... done
Creating pgadmin4_container        ... done

1) Start postgresql server  
2) Create schema
3) Run scrapper   
4) Save data to postgresql           
5) Retrieve data to csv     
6) Cron daily 
7) Quit
```
* By typing number 1  we start PostgreSQL server:
```
 Starting PostgreSQL 12 database server  
```
* By typing number 2  we create DATABASE;
```
CREATE DATABASE news_db OWNER postgres;
CREATE DATABASE  
\connect news_db;
```
* By typing number 3  we get scraped data from website:
```
                                               titled  ...                                              linkd
0   Afghanistan: Biden was advised to keep 2,500 t...  ...  https://www.bbc.co.uk/news/world-us-canada-587...
1   Capital Gazette shooting: 'No one could ever k...  ...  https://www.bbc.co.uk/news/world-us-canada-587...
2   Wayne Jenkins from behind bars: 'I sold drugs ...  ...  https://www.bbc.co.uk/news/world-us-canada-587...
3   Obamas break ground on controversial Chicago p...  ...  https://www.bbc.co.uk/news/world-us-canada-587...
4      R. Kelly found guilty in sex trafficking trial  ...  https://www.bbc.co.uk/news/entertainment-arts-...
..                                                ...  ...                                                ...
64  New York officer rescues fallen man from subwa...  ...  https://www.bbc.co.uk/news/world-us-canada-582...
65  How technology in the air battles fires on the...  ...  https://www.bbc.co.uk/news/world-us-canada-582...
66  Canada 'Sixties Scoop': Indigenous survivors m...  ...  https://www.bbc.co.uk/news/world-us-canada-552...
67  New Christmas campaign for Canadians held in C...  ...  https://www.bbc.co.uk/news/world-us-canada-552...
68  New Brunswick outbreak: How a smalltown doctor...  ...  https://www.bbc.co.uk/news/world-us-canada-546...

[69 rows x 4 columns]
```
By typing 4 we save data to database
```
Select by numbers: 4
```
By typing 5 we save data to csv file in ubuntu filesystem, which we can retrieve to host by running command `bash tun.sh` then we can check the folder src/data for csv file
```
Select by numbers: 5
```
```
$: cd src/data/
$: ls
> BBCnews.csv
```
By typing 6 we run crontab checking . If there is no crontab , we should click on option 7 and again check for cron by pressing 6 again.
```
no crontab for postgres
Select by numbers: 6
0 * * * * python3 /src/save_todb.py 2>&1
# This extra line makes it a valid cron
```
By typing 7 we start cron schedule. Don't care if it shows permission deny for command cron
```
Select by numbers: 7
Start cron schedule
```

By typing 8 we quit the menu app.
```
Select by numbers: 8
> $:
```

!Important

Be aware which OS env you run this application:

If you run on Mac or Ubuntu directly, there may be no problem.

But on Windows, sometimes such error pops out:

`Literal carriage return. Run script through tr -d '\r' .shellcheck(SC1017)`

That's why you should run this command on each file separately and replace accordingly.

`tr -d '\r' < entrypoint.sh > entrypoint1.sh`

rerun the app!

Good luck towards datascience!

Keep learning by coding!
