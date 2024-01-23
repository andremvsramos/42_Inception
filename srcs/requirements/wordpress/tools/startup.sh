# Config php.ini
#tail -f /dev/null

sed -i "s/memory_limit = .*/memory_limit = 256M/" /etc/php/7.4/fpm/php.ini
sed -i "s/upload_max_filesize = .*/upload_max_filesize = 128M/" /etc/php/7.4/fpm/php.ini
sed -i "s/zlib.output_compression = .*/zlib.output_compression = on/" /etc/php/7.4/fpm/php.ini
sed -i "s/max_execution_time = .*/cdmax_execution_time = 18000/" /etc/php/7.4/fpm/php.ini

service php7.4-fpm start
service php7.4-fpm stop
php-fpm7.4 -F -R
