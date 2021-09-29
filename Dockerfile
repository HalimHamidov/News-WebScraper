FROM ubuntu

# Meta-packages and Python configuration
RUN apt-get update -y && apt-get install -y build-essential python3 python3-dev python3-pip python3-distutils 
COPY requirements.txt /tmp/
RUN pip3 install --requirement /tmp/requirements.txt

# Debian boot parameter settings and installing The Time Zone Database
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata

# Mongodb configuration
RUN apt-get update -y && apt-get install -my mongodb

# Postgres configuration
RUN apt-get update -y && apt-get install -my postgresql postgresql-contrib

# add the 'postgres' admin role
USER postgres

RUN /etc/init.d/postgresql start &&\
    psql --command "CREATE USER apearl WITH SUPERUSER PASSWORD 'apearl';" &&\
    createdb -O apearl apearl

RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/12/main/pg_hba.conf

# expose Postgres port
EXPOSE 5432
EXPOSE 5050

# bind mount Postgres volumes for persistent data
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

USER root
RUN mkdir -p /src
RUN mkdir -p /src/data
RUN chown -R postgres:postgres /src/

USER postgres

COPY src/* /src/

RUN mkdir -p /var/run/postgresql/12-main.pg_stat_tmp
RUN chown postgres:postgres /var/run/postgresql/12-main.pg_stat_tmp -R
# RUN ln -s /tmp/.s.PGSQL.5432 /var/run/postgresql/.s.PGSQL.5432

WORKDIR "/src"
CMD ["bash","menu.sh"]
