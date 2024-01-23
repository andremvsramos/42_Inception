FROM debian:bullseye
EXPOSE 3306

# Install MariaDB
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    --no-install-suggests mariadb-server
RUN rm -rf /var/lib/apt/lists/*

# MYSQL SERVICE TEST ENV
# ENV MYSQL_DATABASE="InceptionDB"
# ENV MYSQL_USER="andvieir"
# ENV MYSQL_PASSWORD="docker"
# ENV MYSQL_DB_HOST="mariadb"

RUN ln -sf /usr/share/zoneinfo/Europe/Lisbon /etc/localtime

# Give perms to script test
COPY /tools/ /tmp/
RUN  chmod +x /tmp/startup.sh

# Copy mariadb config to VM
COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN mysql_install_db

ENTRYPOINT ["sh","-c", "/bin/bash /tmp/startup.sh;"]
