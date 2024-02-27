FROM debian:buster

RUN apt update -y -qq &&\
	apt upgrade -y -qq &&\
	apt install -y -qq nginx openssl

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /run/nginx

RUN mkdir /etc/nginx/ssl

# Genera un certificato SSL autofirmato per HTTPS
RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 -keyout /etc/nginx/ssl/lbusi.key \
    -out /etc/nginx/ssl/lbusi.crt \
    -subj "/C=IT/L=RM/O=42_Roma/OU=lbusi/CN=lbusi"

# Espone la porta 443 per le connessioni HTTPS
EXPOSE 443

# Avvia il server nginx in primo piano (foreground)
CMD ["nginx", "-g", "daemon off;"]

# FROM debian:buster
# RUN apt update -y && \
# 	apt install nginx -y && \
# 	apt install vim -y && \
# 	mkdir -p /etc/nginx/ssl && \
# 	apt install openssl -y && \
# 	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login" && \
# 	mkdir -p /var/run/nginx && \
# 	chmod 755 /var/www/html && \
# 	chown -R www-data:www-data /var/www/html
# COPY conf/nginx.conf /etc/nginx/conf.d/default.conf
# EXPOSE 443
# CMD [ "nginx", "-g", "daemon off;" ]