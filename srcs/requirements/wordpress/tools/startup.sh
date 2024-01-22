# Config php.ini

sed -i "s/memory_limit = .*/memory_limit = 256M/" /etc/php/fpm/php.ini
sed -i "s/upload_max_filesize = .*/upload_max_filesize = 128M/" /etc/php/fpm/php.ini
sed -i "s/zlib.output_compression = .*/zlib.output_compression = on/" /etc/php/fpm/php.ini
sed -i "s/max_execution_time = .*/max_execution_time = 18000/" /etc/php/fpm/php.ini

service php-fpm start
service php-fpm stop
php-fpm -F -R