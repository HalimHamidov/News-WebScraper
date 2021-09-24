FROM ubuntu

# Meta-packages and Python configuration
RUN apt-get update -y && apt-get install -y build-essential python3 python3-dev python3-pip wget

# Debian boot parameter settings and installing The Time Zone Database
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata

# Postgres configuration
RUN apt-get update -y && apt-get install -my postgresql postgresql-contrib

