FROM debian:oldstable
ENV MYSQL_ROOT_PASSWORD=docker \
    MYSQL_DATABASE=inception_db \
    MYSQL_USER=user \
    MYSQL_PASSWORD=docker \
RUN apt-get update
RUN apt-get install -y --no-install-recommend \
    --no-install-suggest mariadb-server
RUN rm -rf /var/lib/apt/lists/*

COPY /config/mysql.cnf /etc/mysql/mysql.cnf

EXPOSE 3306

CMD ["mysqld"]