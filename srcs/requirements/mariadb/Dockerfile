FROM debian:bullseye
EXPOSE 3306

# Install MariaDB
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    --no-install-suggests mariadb-server
RUN rm -rf /var/lib/apt/lists/*

RUN ln -sf /usr/share/zoneinfo/Europe/Lisbon /etc/localtime

# Give perms to script test
COPY /tools/ /tmp/
RUN  chmod +x /tmp/script.sh
COPY /conf/wordpress.sql /tmp/

# Copy mariadb config to VM
COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN mtsql_install_db

ENTRYPOINT ["sh","-c", "/bin/bash /tmp/startup/sh;"]