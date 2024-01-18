FROM debian:oldstable
RUN apt-get update
RUN apt-get upgrade

# -y : yes to prompts
# -no-install-recommends: does not install recommended packages
RUN apt-get install -y --no-install-recommends nginx openssl

# removes nginx default page
RUN rm /etc/nginx/sites-available/default && rm /etc/nginx/sites-enabled/default

# openssl req : generates certificate signing request
# -x509 : creates self-signed certificate instead of certf req
# -nodes : key w/ no password
# -days 365 : validity set to 365 days
# -newkey rsa:4096 : generates new 4096-bit RSA key 
# -keyout /etc/nginx/ssl/nginx.key : output file for private key
# -out /etc/nginx/ssl/nginx.crt : output file for public certificate
# -subj "/C=PT/ST=Porto/L=Porto/O=42 Porto/CN=andvieir" : information on certificate
RUN openssl req -x509 -nodes -days 365 -newkew rsa:4096 \
    -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=PT/ST=Porto/L=Porto/O=42 Porto/CN=andvieir"

COPY /config/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx","-g","daemon off;"]