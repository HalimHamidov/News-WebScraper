FROM ubuntu

# Meta-packages and Python configuration
RUN apt-get update -y && apt-get install -y build-essential python3 python3-dev python3-pip wget lxml python-lxml pandas

# Debian boot parameter settings and installing The Time Zone Database
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata

# Postgres configuration
RUN apt-get update -y && apt-get install -my postgresql postgresql-contrib
RUN pip3 install psycopg2

# add the 'postgres' admin role
USER root

RUN /etc/init.d/postgresql start &&\
    psql --command "CREATE USER root WITH SUPERUSER PASSWORD 'root';" &&\
    createdb -O root root

# expose Postgres port
EXPOSE 5432
EXPOSE 5050

# bind mount Postgres volumes for persistent data
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

USER root
RUN mkdir -p /src
RUN mkdir -p /src/data
RUN chown -R root:root /src/

USER root

COPY src/* /src/

WORKDIR "/src"
CMD ["bash","menu.sh"]