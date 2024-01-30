#!/bin/bash

# This variables should be stored in env
#DB_NAME=database1
#DB_USER=user1
#DB_PASSWORD=abc
#DB_PASS_ROOT=123

#service mariadb start

#mariadb -v -u root << EOF
#CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
#CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
#GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
#GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
#SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');
#EOF

#sleep 5

#service mariadb stop

#exec $@

# Start the MariaDB service
service mariadb start

# Create a database if it does not already exist
mariadb -uroot -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

# Create a user if it does not already exist, identified by the specified password
mariadb -uroot -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# Grant all privileges on the specified database to the specified user, allowing access from any host
mariadb -uroot -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# Change the password for the 'root' user on the local machine
mariadb -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; FLUSH PRIVILEGES;"

# Shut down MariaDB, waiting for all slaves to catch up
mariadb-admin -uroot -p$MYSQL_ROOT_PASSWORD --wait-for-all-slaves shutdown

# Start the MariaDB server in a safe mode
mysqld_safe


#HOW TO CHECK IF EVERYTHING IS OK SO FAR:
#1)build the image;
#2)docker run -d 48331fc16a65 (run the image)
#3)docker exec -it f35ffa4c266a(ID Container) bash
#4)check if env variables are ok:
#5)Run the MDB service: mysql -u theuser -p thedatabase
#6)if prompt is: MariaDB [thedatabase]> it means that all is ok.
#7)SHOW TABLES; #For now, we don't have any table, so it'll return an empty set, But at the end of the project, it'll have some tables created by wordpress.
#8) SHOW DATABASES;  command in MariaDB, and it has displayed a list of databases. In this case, you have two databases:
#DataBaseMDB
#information_schema
#The information_schema database is a system database that contains metadata about other databases on the MariaDB server.
