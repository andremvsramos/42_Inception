FROM debian:bullseye

RUN apt-get update -yq

RUN apt-get install vim -yq
RUN apt-get install curl -yq
RUN apt-get install wget -yq
RUN apt-get install php7.4-fpm php7.4-mysql -yq

RUN ln -sf /usr/share/zoneinfo/Europe/Lisbon /etc/localtime

# Copy the script to the VM container
COPY /tools/ /tmp/

RUN mkdir /var/www
RUN mkdir /var/www/html
WORKDIR /var/www/html
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz
RUN rm latest.tar.gz
WORKDIR /var/www/html/wordpress
COPY /conf/ .
RUN chown -R www-data:www-data /var/www/html/wordpress

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /tmp/
# Install wordpress CLI to allow command line management
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp-cli

ENTRYPOINT ["sh", "-c", "/bin/bash /tmp/startup.sh;"]
