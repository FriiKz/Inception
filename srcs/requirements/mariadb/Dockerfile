FROM debian:buster

RUN	apt update -y -qq &&\
	apt upgrade -y -qq &&\
	apt install -y -qq mariadb-server gettext-base

WORKDIR /tmp/mariadb/

COPY conf/my.cnf /etc/mysql

COPY conf/script.sh /tmp/mariadb/

EXPOSE 3306

ENTRYPOINT ["sh", "/tmp/mariadb/script.sh"]

CMD ["mysqld_safe"]

# FROM debian:buster


# RUN apt-get update -y && apt-get install mariadb-server mariadb-client -y

# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/


# COPY ./conf/script.sh /tmp/script.sh


# ENTRYPOINT ["sh", "/tmp/script.sh"]


# FROM debian:buster

# RUN apt update -y && \
# 	apt upgrade -y && \
# 	apt-get install mariadb-server -y

# COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# COPY conf/script.sh /etc/mysql/

# RUN chmod -x /etc/mysql/script.sh

# # CMD ["sh", "/usr/bin/mysqld_safe"]
# CMD ["/script.sh"]