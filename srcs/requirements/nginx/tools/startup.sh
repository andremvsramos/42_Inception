# tail -f /dev/null

#sed -i "s/{{DOMAIN_NAME}}/$DOMAIN_NAME/g" /etc/nginx/nginx.conf
#sed -i "s/__SCHOOL_USERNAME__/$SCHOOL_USERNAME/g" /etc/nginx/nginx.conf
#sed -i "s/__NGINX_WORDPRESS_CONTAINER_NAME__/$NGINX_WORDPRESS_CONTAINER_NAME/g" /etc/nginx/nginx.conf
#sed -i "s/__NGINX_WORDPRESS_PORT__/$NGINX_WORDPRESS_PORT/g" /etc/nginx/nginx.conf

sed -i "s#{{CERTIFICATE}}#$CERTIFICATE#g" /etc/nginx/nginx.conf
sed -i "s#{{KEY}}#$KEY#g" /etc/nginx/nginx.conf
sed -i "s#{{DOMAIN_NAME}}#$DOMAIN_NAME#g" /etc/nginx/nginx.conf

nginx -g "daemon off;"
